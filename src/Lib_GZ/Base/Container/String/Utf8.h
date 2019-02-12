//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_UTF8)
#define tHDef_Lib_GZ_UTF8


#include "Lib_GZ/Base/GzTypes.h"

/* is c the start of a utf8 sequence? */
#define isutf(c) (((c)&0xC0)!=0x80)

/* Some fundamental constants */
#define UNI_REPLACEMENT_CHAR (gzUInt32)0x0000FFFD
#define UNI_MAX_BMP (gzUInt32)0x0000FFFF
#define UNI_MAX_UTF16 (gzUInt32)0x0010FFFF
#define UNI_MAX_UTF32 (gzUInt32)0x7FFFFFFF
#define UNI_MAX_LEGAL_UTF32 (gzUInt32)0x0010FFFF


gzUIntX fConvertUTF8toUTF16 ( const gzUInt8* source,   gzUIntX _sSourceSize, gzUInt16* target) ;
gzUIntX fConvertUTF8toUTF32 (const gzUInt8* source, gzUIntX _sSourceSize,  gzUInt32* target);
gzUIntX fConvertUTF16toUTF8 ( const gzUInt16* source, gzUIntX _sSourceSize, gzUInt8* target);
gzUIntX fConvertUTF16toUTF32 (const gzUInt16* source, gzUIntX _sSourceSize,  gzUInt32* target);
gzUIntX fConvertUTF32toUTF16 (const gzUInt32* source, gzUIntX _sSourceSize,  gzUInt16* target);
gzUIntX fConvertUTF32toUTF8(const gzUInt32* source, gzUIntX _sSourceSize,  gzUInt8* target);

gzInt32 u8_fGetChar(gzUInt8* _sSrc);

static const gzUInt32 offsetsFromUTF8[6] = {
    0x00000000UL, 0x00003080UL, 0x000E2080UL,
    0x03C82080UL, 0xFA082080UL, 0x82082080UL
};


 static const char UTF8_Tail[] = {
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5
};



#endif