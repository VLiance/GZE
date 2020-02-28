
#include "Lib_GZ/Sys/Debug.h"
#include "stb_leakcheck.h"

#include <string.h>
#include <assert.h>

typedef struct malloc_info stb_leakcheck_malloc_info;

static bool bLeakcheckReady = true;

struct malloc_info
{
   char* file;
   int line;
   size_t size;
   stb_leakcheck_malloc_info *next,*prev;
   bool bReady;
   gzUInt64 nId;

};


static stb_leakcheck_malloc_info *mi_head;

void stb_leakcheck_start(){
    bLeakcheckReady = true;
}


void *stb_leakcheck_malloc(size_t sz, const char *file, int line)
{

        //        GZ_printf("\n--Maloc %d", bLeakcheckReady);
   stb_leakcheck_malloc_info* mi = (stb_leakcheck_malloc_info*)malloc(sz + sizeof(*mi));
   if (mi == NULL) return mi;
   mi->file = ( char*)file;
   mi->line = line;
   mi->next = mi_head;
   if (mi_head)
      mi->next->prev = mi;
   mi->prev = NULL;
   mi->size = (int) sz;
   mi->bReady = bLeakcheckReady;

   mi_head = mi;

    static gzUInt64 _nId = 0;
    _nId ++;
    mi->nId = _nId;
    /*
    if(  mi->nId  == 433){
            GZ::Sys::Debug::fError(gzStrL("Put line break here to get the call stack on Alloc Id : " ) + gzStrUI( mi->nId ) );
    }*/

   return mi+1;
}

void *stb_leakcheck_calloc(size_t _nNb, size_t sz, const char *file, int line)
{
   stb_leakcheck_malloc_info* mi = (stb_leakcheck_malloc_info*)calloc(1, _nNb * sz + sizeof(*mi));
   if (mi == NULL) return mi;
   mi->file = ( char*)file;
   mi->line = line;
   mi->next = mi_head;
   if (mi_head)
      mi->next->prev = mi;
   mi->prev = NULL;
   mi->size = (int) _nNb * sz;
   mi->bReady = bLeakcheckReady;
   mi_head = mi;
   return mi+1;
}

void stb_leakcheck_free(void *ptr)
{

   if (ptr != NULL) {
      stb_leakcheck_malloc_info *mi = (stb_leakcheck_malloc_info *) ptr - 1;
      mi->size = ~mi->size;
      #ifndef STB_LEAKCHECK_SHOWALL
      if (mi->prev == NULL) {
         assert(mi_head == mi);
         mi_head = mi->next;
      } else
         mi->prev->next = mi->next;
      if (mi->next)
         mi->next->prev = mi->prev;
      #endif
   }
}

void *stb_leakcheck_realloc(void *ptr, size_t sz, const char *file, int line)
{
   if (ptr == NULL) {
      return stb_leakcheck_malloc(sz, file, line);
   } else if (sz == 0) {
      stb_leakcheck_free(ptr);
      return NULL;
   } else {
      stb_leakcheck_malloc_info *mi = (stb_leakcheck_malloc_info *) ptr - 1;
      if (sz <= mi->size)
         return ptr;
      else {
         #ifdef STB_LEAKCHECK_REALLOC_PRESERVE_MALLOC_FILELINE
         void *q = stb_leakcheck_malloc(sz, mi->file, mi->line);
         #else
         void *q = stb_leakcheck_malloc(sz, file, line);
         #endif
         if (q) {
            memcpy(q, ptr, mi->size);
            stb_leakcheck_free(ptr);
         }
         return q;
      }
   }
}

void stb_leakcheck_dumpmem(void)
{
    #ifdef D_Debug


    unsigned int _nTotal = 0;
  //  GZ_printf("\n DUMP memory");
   stb_leakcheck_malloc_info *mi = mi_head;
   while (mi) {

        if( mi->bReady ){
          if ((ptrdiff_t) mi->size >= 0){
             GZ_printf("\nLEAKED: %s (%4d): %8d bytes at %p", mi->file, mi->line, mi->size, mi+1);
          //   GZ_printf(" Id:%d",   mi->nId );
            _nTotal += mi->size;
            gzHoldStr* sStr = (gzHoldStr*)mi+1;
                                      /*
            if( mi->line == 38 ){

            //    GZ_printf("\n%bReadys",sStr->array + 1);

            }*/
            }
        }



      mi = mi->next;

   }

if(_nTotal != 0){
        GZ::Sys::pDebug::fConsole(gzStrL("Total :") + gzStrUI(_nTotal) );
       //GZ_printf("\n");
       // GZ_printf("\nTotal : %d", _nTotal);
      // GZ_printf("\n");
}else{
    GZ::Sys::pDebug::fConsole(gzStrL(" ================================= "));
    GZ::Sys::pDebug::fConsole(gzStrL(" -- * No memory leak detected * --"));
  GZ::Sys::pDebug::fConsole(gzStrL(" ================================= "));
}

   #ifdef STB_LEAKCHECK_SHOWALL
   mi = mi_head;
   while (mi) {
      if ((ptrdiff_t) i->size < 0)
         GZ_printf("\nFREED : %s (%4d): %8d bytes at %p", mi->file, mi->line, ~mi->size, mi+1);
      mi = mi->next;
   }
   #endif

    #endif
}



