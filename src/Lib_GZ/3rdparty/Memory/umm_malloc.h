// ----------------------------------------------------------------------------
// umm_malloc.h - a memory allocator for embedded systems (microcontrollers)
//
// http://hempeldesigngroup.com/embedded/stories/memorymanager/
//
// Copyright (c) 2007-2008 Ralph Hempel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// ----------------------------------------------------------------------------

#ifndef UMM_MALLOC_H
#define UMM_MALLOC_H


#include "Lib_GZ/GZ.h"

#ifdef __cplusplus
 extern "C" {
#endif



//typedef  unsigned int gzUInt;
void *umm_malloc( gzUInt size );
void *umm_calloc( gzUInt size );
void *umm_realloc( void *ptr, gzUInt size );
void umm_free( void *ptr );
void *umm_info( void *ptr, int force );
void memory_stress();

//#include "../Debug.h"


// ----------------------------------------------------------------------------
// Size of the heap in bytes
#define UMM_MALLOC_CFG__HEAP_SIZE 8192

// ----------------------------------------------------------------------------
// A couple of macros to make packing structures less compiler dependent


// ----------------------------------------------------------------------------
// A couple of macros to make it easier to protect the memory allocator
// in a multitasking system. You should set these macros up to use whatever
// your system uses for this purpose. You can disable interrupts entirely, or
// just disable task switching - it's up to you
//
// NOTE WELL that these macros MUST be allowed to nest, because umm_free() is
// called from within umm_malloc()

#define UMM_CRITICAL_ENTRY()
#define UMM_CRITICAL_EXIT()



typedef struct UMM_HEAP_INFO_t {
  unsigned int totalEntries;
  unsigned int usedEntries;
  unsigned int freeEntries;

  unsigned int totalBlocks;
  unsigned int usedBlocks;
  unsigned int freeBlocks;
  }
  UMM_HEAP_INFO;

extern UMM_HEAP_INFO heapInfo;

//extern char   __umm_heap_start[];
//extern char   __umm_heap_end[];
//extern gzUInt __umm_heap_size;

//void *umm_info( void *ptr, int force );

// ----------------------------------------------------------------------------


//#define DBG_LOG_LEVEL 7

#if DBG_LOG_LEVEL >= 7
#  define DBG_LOG_TRACE( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_TRACE( format, ... )
#endif

#if DBG_LOG_LEVEL >= 6
#  define DBG_LOG_DEBUG( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_DEBUG( format, ... )
#endif

#if DBG_LOG_LEVEL >= 5
#  define DBG_LOG_CRITICAL( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_CRITICAL( format, ... )
#endif

#if DBG_LOG_LEVEL >= 4
#  define DBG_LOG_ERROR( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_ERROR( format, ... )
#endif

#if DBG_LOG_LEVEL >= 3
#  define DBG_LOG_WARNING( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_WARNING( format, ... )
#endif

#if DBG_LOG_LEVEL >= 2
#  define DBG_LOG_INFO( format, ... ) printf( format, ## __VA_ARGS__ )
#else
#  define DBG_LOG_INFO( format, ... )
#endif

#if DBG_LOG_LEVEL >= 1
#define DBG_LOG_FORCE( force, format, ... ) {if(force) {printf( format, ## __VA_ARGS__  );}}
#else
#  define DBG_LOG_FORCE( format, ... )
#endif


/*
  #define DBG_LOG_TRACE( format, ... )
  #define DBG_LOG_DEBUG( format, ... )
  #define DBG_LOG_FORCE( force, format, ... )
*/



#ifdef __cplusplus
}
#endif


#endif // UMM_MALLOC_H
