//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


//#include "GzMem.h"
#include "Utf8.h"
#include "GzMem.h"



//static const char UTF8_Tail[256] = {

/* returns length of next utf-8 sequence */
int u8_seqlen(char *s)
{
    return UTF8_Tail[(unsigned int)(unsigned char)s[0]] + 1;
}


static const int halfShift  = 10; /* used for shifting by 10 bits */

static const gzUInt32 halfBase = 0x0010000UL;
static const gzUInt32 halfMask = 0x3FFUL;
#define UNI_SUR_HIGH_START  (gzUInt32)0xD800
#define UNI_SUR_HIGH_END    (gzUInt32)0xDBFF
#define UNI_SUR_LOW_START   (gzUInt32)0xDC00
#define UNI_SUR_LOW_END     (gzUInt32)0xDFFF


gzUIntX fConvertUTF8toUTF16 ( const gzUInt8* source,   gzUIntX _sSourceSize, gzUInt16* target) {

    gzUIntX _sSize = 0;

	  while ( _sSourceSize > 0){

        gzUInt32 ch = 0;
        unsigned short extraBytesToRead = UTF8_Tail[*source];

		_sSourceSize -= extraBytesToRead + 1;

        switch (extraBytesToRead) {
            case 5: ch += *source++; ch <<= 6; //Not UTF-8
            case 4: ch += *source++; ch <<= 6; //Not UTF-8
            case 3: ch += *source++; ch <<= 6;
            case 2: ch += *source++; ch <<= 6;
            case 1: ch += *source++; ch <<= 6;
            case 0: ch += *source++;
        }
        ch -= offsetsFromUTF8[extraBytesToRead];

		_sSize +=2;

        if (ch <= UNI_MAX_BMP) { // Target is a character <= 0xFFFF
            if (ch >= UNI_SUR_HIGH_START && ch <= UNI_SUR_LOW_END) {
                *target++ = UNI_REPLACEMENT_CHAR; //Char Error
            } else {
                *target++ = (gzUInt16)ch; // Normal case
            }

        } else if (ch > UNI_MAX_UTF16) {
                *target++ = UNI_REPLACEMENT_CHAR; //Char Error
        } else {

            // target is a character in range 0xFFFF - 0x10FFFF. Have anoter char following
            ch -= halfBase;
            *target++ = (gzUInt16)((ch >> halfShift) + UNI_SUR_HIGH_START);
            *target++ = (gzUInt16)((ch & halfMask) + UNI_SUR_LOW_START);
			_sSize +=2;
        }
    }

    return _sSize;
}

gzUIntX fConvertUTF8toUTF32 (const gzUInt8* source, gzUIntX _sSourceSize,  gzUInt32* target) {
	//gzUIntX _sSize = _sSourceSize * 4; //FixedSize
	gzUIntX _sSize = 0;

	while ( _sSourceSize > 0){

		gzUInt32 ch = 0;
		unsigned short extraBytesToRead = UTF8_Tail[*source];
		_sSourceSize -= extraBytesToRead + 1;

		switch (extraBytesToRead) {
			case 5: ch += *source++; ch <<= 6;
			case 4: ch += *source++; ch <<= 6;
			case 3: ch += *source++; ch <<= 6;
			case 2: ch += *source++; ch <<= 6;
			case 1: ch += *source++; ch <<= 6;
			case 0: ch += *source++;
		}
		ch -= offsetsFromUTF8[extraBytesToRead];


		if (ch <= UNI_MAX_LEGAL_UTF32) {

			 // UTF-16 surrogate values are illegal in UTF-32, and anything over Plane 17 (> 0x10FFFF) is illegal.
			if (ch >= UNI_SUR_HIGH_START && ch <= UNI_SUR_LOW_END) {

				*target++ = UNI_REPLACEMENT_CHAR;
			} else {
			*target++ = ch;
			}
		} else { // i.e., ch > UNI_MAX_LEGAL_UTF32   //sourceIllegal;
			*target++ = UNI_REPLACEMENT_CHAR;
		}
		_sSize += 4;
    }
    return _sSize;
}



static const gzUInt8 firstByteMark[7] = { 0x00, 0x00, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC };
gzUIntX fConvertUTF16toUTF8 ( const gzUInt16* source, gzUIntX _sSourceSize, gzUInt8* target) {

    gzUIntX _sSize = 0;

	_sSourceSize = _sSourceSize >> 1;

	while ( _sSourceSize > 0){


        gzUInt32 ch = 0;

        unsigned short bytesToWrite = 0;
        const gzUInt32 byteMask = 0xBF;
        const gzUInt32 byteMark = 0x80;

        ch = *source++;
		  _sSourceSize--;
        /* If we have a surrogate pair, convert to UTF32 first. */
        if (ch >= UNI_SUR_HIGH_START && ch <= UNI_SUR_HIGH_END) {
            gzUInt32 ch2 = *source;
            /* If it's a low surrogate, convert to UTF32. */
            if (ch2 >= UNI_SUR_LOW_START && ch2 <= UNI_SUR_LOW_END) {
                ch = ((ch - UNI_SUR_HIGH_START) << halfShift)
                    + (ch2 - UNI_SUR_LOW_START) + halfBase;

                ++source;
			   _sSourceSize--;
            }
        }

        /* Figure out how many bytes the result will require */
        if (ch < (gzUInt32)0x80) {      bytesToWrite = 1;
        } else if (ch < (gzUInt32)0x800) {     bytesToWrite = 2;
        } else if (ch < (gzUInt32)0x10000) {   bytesToWrite = 3;
        } else if (ch < (gzUInt32)0x110000) {  bytesToWrite = 4;
        } else {                            bytesToWrite = 3;
           ch = UNI_REPLACEMENT_CHAR;
        }

		_sSize += bytesToWrite;

        target += bytesToWrite;

        switch (bytesToWrite) {
            case 4: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 3: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 2: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 1: *--target =  (gzUInt8)(ch | firstByteMark[bytesToWrite]);
        }
        target += bytesToWrite;
    }

    return _sSize;
}


gzUIntX fConvertUTF16toUTF32 (const gzUInt16* source, gzUIntX _sSourceSize,  gzUInt32* target) {

	_sSourceSize = _sSourceSize >> 1;
	//gzUIntX _sSize = _sSourceSize * 2; //FixedSize
	gzUIntX _sSize =0;
    gzUInt32 ch, ch2;

  while ( _sSourceSize > 0){

        ch = *source++;
		 _sSourceSize--;
        // If we have a surrogate pair, convert to UTF32 first.
        if (ch >= UNI_SUR_HIGH_START && ch <= UNI_SUR_HIGH_END) {
            // If the 16 bits following the high surrogate are in the source buffer...
			ch2 = *source;
			// If it's a low surrogate, convert to UTF32.
			if (ch2 >= UNI_SUR_LOW_START && ch2 <= UNI_SUR_LOW_END) {
				ch = ((ch - UNI_SUR_HIGH_START) << halfShift)
					+ (ch2 - UNI_SUR_LOW_START) + halfBase;
				++source;
				_sSourceSize--;
			}
        }
		_sSize += 4;
        *target++ = ch;
    }
    return _sSize;
}




gzUIntX fConvertUTF32toUTF16 (const gzUInt32* source, gzUIntX _sSourceSize,  gzUInt16* target) {
	_sSourceSize = _sSourceSize >> 2;
	gzUIntX _sSize = 0;

	while ( _sSourceSize > 0){
	  _sSourceSize--;
		gzUInt32 ch;
		ch = *source++;
		if (ch <= UNI_MAX_BMP) { // Target is a character <= 0xFFFF
			// UTF-16 surrogate values are illegal in UTF-32; 0xffff or 0xfffe are both reserved values
			if (ch >= UNI_SUR_HIGH_START && ch <= UNI_SUR_LOW_END) {
				   *target++ = UNI_REPLACEMENT_CHAR;
			} else {
				*target++ = (gzUInt16)ch; // normal case
			}
			_sSize +=2;

		} else if (ch > UNI_MAX_LEGAL_UTF32) {

			   *target++ = UNI_REPLACEMENT_CHAR;
			_sSize +=2;

		} else {

			ch -= halfBase;
			*target++ = (gzUInt16)((ch >> halfShift) + UNI_SUR_HIGH_START);
			*target++ = (gzUInt16)((ch & halfMask) + UNI_SUR_LOW_START);
			_sSize +=4;
		}
	}

    return _sSize;
}


gzUIntX fConvertUTF32toUTF8(const gzUInt32* source, gzUIntX _sSourceSize,  gzUInt8* target) {


	_sSourceSize = _sSourceSize >> 2;

	gzUIntX _sSize = 0;

	while ( _sSourceSize > 0){
	  _sSourceSize--;

        gzUInt32 ch;
        unsigned short bytesToWrite = 0;
        const gzUInt32 byteMask = 0xBF;
        const gzUInt32 byteMark = 0x80;
        ch = *source++;

         //Figure out how many bytes the result will require. Turn any illegally large UTF32 things (> Plane 17) into replacement chars.
        if (ch < (gzUInt32)0x80) {      bytesToWrite = 1;
        } else if (ch < (gzUInt32)0x800) {     bytesToWrite = 2;
        } else if (ch < (gzUInt32)0x10000) {   bytesToWrite = 3;
        } else if (ch <= UNI_MAX_LEGAL_UTF32) {  bytesToWrite = 4;
        } else {                            bytesToWrite = 3;
                                            ch = UNI_REPLACEMENT_CHAR;
        }

        target += bytesToWrite;

        switch (bytesToWrite) { // note: everything falls through.
            case 4: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 3: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 2: *--target = (gzUInt8)((ch | byteMark) & byteMask); ch >>= 6;
            case 1: *--target = (gzUInt8) (ch | firstByteMark[bytesToWrite]);
        }
        target += bytesToWrite;

		_sSize += bytesToWrite;
    }


    return _sSize;
}

gzInt32 u8_fGetChar(gzUInt8* _sSrc){

    gzUInt32 ch = 0;
    unsigned short extraBytesToRead = UTF8_Tail[*_sSrc];
    switch (extraBytesToRead) {
        case 0:
            ch += *_sSrc;
        break;
        case 1:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
        case 2:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
        case 3:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
        case 4:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
        case 5:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
        case 6:
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++; ch <<= 6;
            ch += *_sSrc++;
        break;
    }
    ch -= offsetsFromUTF8[extraBytesToRead];
    return ch;
}




/*
gzInt32 u8_nextchar(char *s, int *i)
{
    gzInt32 ch = 0;
    int sz = 0;

    do {
        ch <<= 6;
        ch += (unsigned char)s[(*i)++];
        sz++;
    } while (s[*i] && !isutf(s[*i]));
    ch -= offsetsFromUTF8[sz-1];

    return ch;
}
gzUInt8 u8_next(gzUInt8* _sSrc) {
    return UTF8_Tail[*_sSrc] + 1;
}
gzInt8 u8_prev(gzUInt8* _sSrc) {
    int i = 0;
    (void)(isutf(_sSrc[--i]) || isutf(_sSrc[--i]) ||
           isutf(_sSrc[--i]) || --i);
    return i;
}
void u8_inc(char *s, int *i)
{
    (void)(isutf(s[++(*i)]) || isutf(s[++(*i)]) ||
           isutf(s[++(*i)]) || ++(*i));
}
void u8_dec(char *s, int *i)
{
    (void)(isutf(s[--(*i)]) || isutf(s[--(*i)]) ||
           isutf(s[--(*i)]) || --(*i));
}
*/
