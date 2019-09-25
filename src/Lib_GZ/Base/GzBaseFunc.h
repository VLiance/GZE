//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#ifndef tHDef_GZ_MainHeaderBaseFunc
#define tHDef_GZ_MainHeaderBaseFunc

  #include "GzTypes.h"
  
/*
#ifdef D_Platform_Windows
    #include <stdlib.h>
#endif
*/

#ifdef GZ_tJit

//#include "Lib_GZ/CompRt/int_lib.h"

///// Base External Func ////////
extern "C"{
	int printf (const char*, ...);
	void* malloc(size_t _nSize);
	void* calloc(size_t num, size_t size);
	void* realloc (void* ptr, size_t size);
	void free (void* ptr);
	
	void* memcpy ( void * destination, const void * source, size_t num );
	void* memset ( void * ptr, int value, size_t num );
	
	//// string //
	int strcmp ( const char * str1, const char * str2 );
	int strncmp ( const char * str1, const char * str2, size_t num );
	//long int strtol (const char* str, char** endptr, int base); //Convert to integer
	gzInt64 strtol(const char* str, char** endptr, int base); //Convert to integer
	/////////////////
	

	#define assert(e)   //Remove Temp
}



//--Stdio--
#ifndef _FILE_DEFINED
#define	_FILE_DEFINED
typedef struct _iobuf
{
	char*	_ptr;
	int	_cnt;
	char*	_base;
	int	_flag;
	int	_file;
	int	_charbuf;
	int	_bufsiz;
	char*	_tmpfname;
} FILE;
#endif


#else
	

	#ifndef GZ_STD_Lib
	#define GZ_STD_Lib
		#include <stdlib.h> //printf
	#endif
	

	#ifndef GZ_STD_IO
	#define GZ_STD_IO
		#include <stdio.h> //printf
	#endif
	
	#ifndef GZ_STD_string
	#define GZ_STD_string
		#include <string.h>
	#endif
	
	#ifndef GZ_STD_assert
	#define GZ_STD_assert
		#include <assert.h>
	#endif
	

	
	#ifndef D_Debug
		#define NDEBUG
	#endif

	
#endif

//#undef GZ_tJit



#endif


