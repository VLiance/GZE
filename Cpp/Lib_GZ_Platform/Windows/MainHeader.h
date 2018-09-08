//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

///// Windows Include /////
#undef UNICODE
#define UNICODE
#undef _UNICODE
#define _UNICODE
#define _CRT_ABS_DEFINED
#ifndef _WIN32_WINNT
	#define _WIN32_WINNT 0x0501
#endif
#ifndef _WIN32_IE
	#define _WIN32_IE 0x0501
#endif
#include <windows.h>
///////////////////////////
/* Only to gen WIn header
extern "C"{
	#ifdef GZ_tLibRT
		#undef _CRTIMP
		#define _CRTIMP  __declspec(dllimport)
	   _CRTIMP  wchar_t* __cdecl  fgetws (wchar_t*, int, FILE*);
	   _CRTIMP  int __cdecl 	fputws (const wchar_t*, FILE*);
	   _CRTIMP   wint_t __cdecl 	getwc (FILE*);
	   _CRTIMP   wint_t __cdecl 	getwchar (void);
	   _CRTIMP   wchar_t* __cdecl  _getws (wchar_t*);
	   _CRTIMP   wint_t __cdecl 	putwc (wint_t, FILE*);
	   _CRTIMP  int __cdecl 	_putws (const wchar_t*);
	   _CRTIMP  wint_t __cdecl 	putwchar (wint_t);
	   _CRTIMP  FILE* __cdecl 	_wfdopen(int, const wchar_t *);
	   _CRTIMP  FILE* __cdecl 	_wfopen (const wchar_t*, const wchar_t*);
	   _CRTIMP  FILE* __cdecl 	_wfreopen (const wchar_t*, const wchar_t*, FILE*);
	   _CRTIMP  FILE* __cdecl 	_wfsopen (const wchar_t*, const wchar_t*, int);
	   _CRTIMP  wchar_t* __cdecl  _wtmpnam (wchar_t*);
	   _CRTIMP  wchar_t* __cdecl  _wtempnam (const wchar_t*, const wchar_t*);
	   _CRTIMP  int __cdecl 	_wrename (const wchar_t*, const wchar_t*);
	   _CRTIMP   int __cdecl 	_wremove (const wchar_t*);
	   //  void __cdecl 	_wperror (const wchar_t*);
		_CRTIMP FILE* __cdecl 	_wpopen (const wchar_t*, const wchar_t*);
	#endif
}

*/
