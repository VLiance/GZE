#include <stdio.h>
#include <math.h>
//#define STBI_NO_SIMD
//#define NULL 0

#define STBI_NO_JPEG  //Really strange bug with jit but this will not exist when embed in compilo

//#define STBI_JPEG_OLD

#define STBI_ASSERT(x)
#define STBI_NO_STDIO
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
#include "stb_image.h"