#include <stdio.h>
#include <math.h>

//#define STBI_ASSERT(x)
//#define STBI_NO_STDIO
/*
#ifdef UseCustomHeapFor_stb_image
    #include "Lib_GZ/Lib/Memory/umm_malloc.h"
	#define stb_img_malloc umm_malloc
	#define stb_img_realloc umm_realloc
	#define stb_img_free umm_free
#else
	#define stb_img_malloc malloc
	#define stb_img_realloc realloc
	#define stb_img_free free
#endif
*/


/*
   // #define your own functions "STBTT_malloc" / "STBTT_free" to avoid malloc.h
   #ifndef STBTT_malloc
   #include <stdlib.h>
   #define STBTT_malloc(x,u)  ((void)(u),malloc(x))
   #define STBTT_free(x,u)    ((void)(u),free(x))
   #endif
*/
  #include <stdlib.h>
  
 /*
 inline void* myMalloc(gzUInt _nSize){
	 printf("\nMalloc: %d", _nSize );
	 return malloc(_nSize*2);
 }
#define STBTT_malloc(x,u)  ((void)(u),myMalloc(x))
#define STBTT_free(x,u)    ((void)(u),free(x))

*/
#include "stb_truetype.h"







