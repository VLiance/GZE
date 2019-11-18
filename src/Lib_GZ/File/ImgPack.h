//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef tHDef_GZ_WrapFont
#define tHDef_GZ_WrapFont

#include "Lib_GZ/GZ.h"
#include "Lib_GZ/3rdparty/Image/stb_rect_pack.h"

//#include "Lib_GZ/Lib/SFF/stb_truetype.h"
#include "Lib_GZ/File/Font/CharData.h"

struct stbrp_rect;




namespace Lib_GZ{

namespace File{class cRcFont;class cRcImg;}


    namespace File{

		class cFont;
	
	
    namespace ImgPack{



		void fGetCharData(File::cFont* _oFont, File::Font::cCharData* _oChar);





         class uFontRange;

        struct uRectPack{
           // reserved for your use:
           gzInt       nId;
           gzUInt16    nW;
           gzUInt16    nH;
           gzUInt16    nX;
           gzUInt16    nY;
           gzInt       was_packed;  // non-zero if valid packing
        }; // 16 bytes, nominally


        struct uCharData{
           unsigned short nX,nY,nW,nH; // coordinates of bbox in bitmap
           uRectPack* rRect;
            gzUInt16 nHoriAdvance;
            gzInt16 nHoriBeringX;
            gzInt16 nHoriBeringY;
          // float xoff,yoff,nHoriAdvance;
          // float xoff2,yoff2;
        };

         class  uFontRange : public ::Lib_GZ::Base::cClass  {  //Extend cClass!? {
		 public:
           gzFloat nFontSize;
           gzUInt  nFirstChar;
           int nNbChar;
           uCharData** aData;
		   
		   ~uFontRange();
		   
        } ;


        struct uPackContext {
           void *user_allocator_context;
           void *pack_info;
           int   width;
           int   height;
           int   stride_in_bytes;
           int   padding;

           unsigned char *pixels;
           void  *nodes;
        };



			int fDrawRect(File::cFont* _oFont, uPackContext *spc,  unsigned char *pixels, stbrp_rect* _rect);
			int fSetSquaresDim(File::cFont* _oFont, uPackContext *spc, stbrp_rect* _rect);
			stbrp_rect* fIniRectList(File::cFont* _oFont, uPackContext *spc, int* _nTotal);
			int fAddFontRange(File::cFont* _oFont, uPackContext *spc, gzFloat _FontSize, gzUInt _nFirstChar, gzUInt _nNbChar);
			stbrp_context* fPackBegin(File::cFont* _oFont, uPackContext *spc, int pw, int ph, int stride_in_bytes, int padding, void *alloc_context);
			void fPackEnd  (File::cFont* _oFont, uPackContext *spc);

    }
	
	/*
    namespace pFont{

        gzInt fOpen(File::cRcFont* _oRc);
        gzInt fDelete(File::cRcFont* _oRc);
        Font::uCharData* fGetCharData(gzUInt _nChar);
    }
class cFont {

    public:

    private:
};
*/

}}

#endif

