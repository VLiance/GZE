// stb_leakcheck.h - v0.1 - quick & dirty malloc leak-checking - public domain

#ifndef STB_LEAKCHECK_IMPLEMENTATION
#define STB_LEAKCHECK_IMPLEMENTATION // don't implenment more than once

#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

extern void  stb_leakcheck_start();
extern void * stb_leakcheck_malloc(size_t sz, const char *file, int line);
extern void * stb_leakcheck_calloc(size_t _nNb, size_t sz, const char *file, int line);
extern void * stb_leakcheck_realloc(void *ptr, size_t sz, const char *file, int line);
extern void   stb_leakcheck_free(void* ptr);
extern void   stb_leakcheck_dumpmem(void);


#include "Lib_GZ/GZ.h"


//#define STB_LEAKCHECK_SHOWALL




/*
#define malloc(sz)    stb_leakcheck_malloc(sz, __FILE__, __LINE__)
#define free(p)       stb_leakcheck_free(p)
#define realloc(p,sz) stb_leakcheck_realloc(p,sz, __FILE__, __LINE__)
*/


#endif
