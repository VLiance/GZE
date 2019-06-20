//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Font.h"
#include "ImgPack.h"
#include "Lib_GZ/File/RcImg.h"
#include "Lib_GZ/File/RcFont.h"

#include "Lib_GZ/3rdparty/Image/stb_rect_pack.h"
#include "Lib_GZ/Base/Math/Math.h"
//#include "Lib_GZ/Sys/Debug.h"

namespace Lib_GZ{namespace File{namespace Font{
extern  stbtt_fontinfo font; //temp
extern  float fontscale; //temp
}
File::cRcFont* oRcFont;

namespace ImgPack{

gzArray< gzSp<uFontRange> > qaRange(true);


// stbrp_rect *  rects; //TODO


uCharData* rInvalidChar;

#define tSIZE 512




void fImgPack(File::cRcImg* _oRc){


/*
    if (FT_Load_Char(face, ' ', FT_LOAD_RENDER)){
        Debug::fError(gzStrL("ERROR::FREETYPE: Failed to load char"));
    }
    rInvalidChar  = (uCharData*)GZ_fMalloc(1, sizeof(uCharData));
    FT_Glyph_Metrics_* metrics = &face->glyph->metrics;
    rInvalidChar->nHoriAdvance =    metrics->horiAdvance;
    rInvalidChar->nHoriBeringX =    metrics->horiBearingX;
    rInvalidChar->nHoriBeringY =    metrics->horiBearingY;
    rInvalidChar->rRect = (uRectPack*)GZ_fCalloc(1 , sizeof(uRectPack) );
*/
/*

    uPackContext pc;
	 fPackBegin(&pc, aBmpPack[0], tSIZE, tSIZE, 0, 2, NULL);
    fAddFontRange(&pc, 12.0, 32, 95);

    int _nTotal;
	stbrp_rect* arects = fIniRectList(&pc, &_nTotal);
	fSetSquaresDim(&pc, arects);
	stbrp_pack_rects((stbrp_context *) pc.pack_info, arects, _nTotal); //do pack
	fDrawRect(&pc, arects);

    fPackEnd(&pc);

	//Final copy to

    gzInt BITMAP_W =  tSIZE;
    gzInt BITMAP_H =  tSIZE;

    char nBoder = 0;
    char nBoder_x2 = nBoder * 2;
    gzUInt nExtWidth = BITMAP_W + 0;
    gzUInt nExtHeight = BITMAP_H + 0;

    gzInt** p2DArray;
    p2DArray = new gzInt*[nExtHeight];

    gzInt* p1DArray = (gzInt *)GZ_fCalloc(nExtHeight * nExtWidth , sizeof(gzInt) );

    for (gzInt y = 0;  y < BITMAP_H;  y++){
           char* RowY = (char*)&aBmpPack[y][0];
             for (gzInt x = 0;  x < BITMAP_W;  x++){

                   gzUInt _nPixelFrame =  0;
                    gzUInt _nFrameAlpha = RowY[x];

                   gzUInt _nFrameBlue = _nPixelFrame;
                   gzUInt _nFrameGreen = _nPixelFrame;
                   gzUInt _nFrameRed = _nPixelFrame;

                    p1DArray[((y) *  nExtWidth) + (x) ]  = (_nFrameAlpha << 24) | (_nFrameRed << 16) | (_nFrameGreen << 8) | _nFrameBlue;
                    p2DArray[(y)] = &p1DArray[((y) *  nExtWidth)];
        }
    }

    oRcFont->aImg = p2DArray;
    oRcFont->nWidth = BITMAP_W-2;
    oRcFont->nHeight = BITMAP_H-2;*/
}



 void fPackEnd  (uPackContext *spc){

   GZ_fFree(spc->nodes    );
   GZ_fFree(spc->pack_info);
}


 stbrp_context*  fPackBegin(uPackContext *spc,  int pw, int ph, int stride_in_bytes, int padding, void *alloc_context)
{
   stbrp_context *context = (stbrp_context *) GZ_fMalloc(sizeof(*context)   ,1  );
   int            num_nodes = pw - padding;
   stbrp_node    *nodes   = (stbrp_node    *) GZ_fMalloc(sizeof(*nodes  ) , num_nodes);

   if (context == NULL || nodes == NULL) {
      if (context != NULL) GZ_fFree(context);
      if (nodes   != NULL) GZ_fFree(nodes );
      return 0;
   }

   spc->user_allocator_context = alloc_context;
   spc->width = pw;
   spc->height = ph;
   //spc->pixels = pixels;
   spc->pixels = 0;
   spc->pack_info = context;
   spc->nodes = nodes;
   spc->padding = padding;
   spc->stride_in_bytes = stride_in_bytes != 0 ? stride_in_bytes : pw;


   stbrp_init_target(context, pw-padding, ph-padding, nodes, num_nodes);

  // memset(pixels, 0, pw*ph); // background of 0 around pixels

   return context;
}


void fDeleteRange(GZ_FuncWrapD, void* _wRange){
    uFontRange* _rRange = (uFontRange*)_wRange;

    uCharData** aData  =_rRange->aData;
    for(gzUInt i = 0; i < _rRange->nNbChar ; i++){
       GZ_fFree(aData[i]);
    }
     GZ_fFree(_rRange->aData);
}



int fAddFontRange(uPackContext *spc, gzFloat _FontSize, gzUInt _nFirstChar, gzUInt _nNbChar){

   uCharData** aData  = (uCharData**)GZ_fMalloc(_nNbChar, sizeof(uCharData*));
    for(gzUInt i = 0; i < _nNbChar; i++){
        aData[i] = (uCharData*)GZ_fMalloc(1, sizeof(uCharData));
    }

  // uFontRange* rRange  = (uFontRange*)GZ_fMalloc(1, sizeof(uFontRange));
     gzSp<uFontRange> myArray =  gzSp<uFontRange>( new uFontRange());

   uFontRange* rRange  = myArray.get();

   rRange->nFirstChar = _nFirstChar;
   rRange->nNbChar          = _nNbChar;
   rRange->aData       = aData;
   rRange->nFontSize    = _FontSize;


    qaRange.fPush(myArray);
 //   qaRange.fPush(gzPodLinkOwn(rRange, &fDeleteRange));

 return 1;
  // return fPackFontRanges(spc, rRange, 1);
}






stbrp_rect* fIniRectList(uPackContext *spc, int* _nTotal){

	int _nNbRange = 1; //Temp
	
	
//gzSp<uFontRange> myRange = qaRange[0]; //Temp
// uFontRange* _aRanges  = myRange.get(); //Temp

 uFontRange* _aRanges  = qaRange[0].get(); //Temp
 

   stbrp_context *context = (stbrp_context *) spc->pack_info;
 //  stbrp_rect    *rects;

  int i,j,k,n, return_value = 1;
   // flag all characters as NOT packed
   for (i=0; i < _nNbRange; ++i){
      for (j=0; j < _aRanges[i].nNbChar; ++j){
         _aRanges[i].aData[j]->nX =
         _aRanges[i].aData[j]->nY =
         _aRanges[i].aData[j]->nW =
         _aRanges[i].aData[j]->nH = 0;

		 
	  }
		 
   }	 
		 
		 
		 

   n = 0;
   for (i=0; i < _nNbRange; ++i)
      n += _aRanges[i].nNbChar;

   stbrp_rect* _rects = (stbrp_rect *) GZ_fMalloc(sizeof(stbrp_rect) , n);
   *_nTotal = n;
   return _rects;

}





int fSetSquaresDim(uPackContext *spc, stbrp_rect* _rect){
	using namespace Font;

	int _nNbRange = 1; //Temp
	uFontRange *_aRanges = qaRange[0].get(); //Temp

  int i,j,k, return_value = 1;
   /////////////////////////////////////////////////////////////////////////////
   /////////////////////////////
   k=0;
   for (i=0; i < _nNbRange; ++i) {
      float fh = _aRanges[i].nFontSize;

      for (j=0; j < _aRanges[i].nNbChar; ++j) {
		  
		    uCharData* _rChar = _aRanges[i].aData[j];

            int advance,lsb,x0,y0,x1,y1;
           int xpos = 0;
            float x_shift = xpos - (float) floor(xpos);
            unsigned int _nLetter = _aRanges[i].nFirstChar + j;
            stbtt_GetCodepointHMetrics(&font, _nLetter, &advance, &lsb);
            stbtt_GetCodepointBitmapBoxSubpixel(&font, _nLetter, fontscale,fontscale,x_shift,0, &x0,&y0,&x1,&y1);

			// bitmap width is ix1-ix0, height is iy1-iy0, and location to place
			// the bitmap top left is (leftSideBearing*scale,iy0).
			
            _rect[k].w = x1 - x0 + 2.0;
			_rect[k].h = y1 - y0 + 2.0;
			
			_rChar->nHoriAdvance =  advance;
			_rChar->nHoriBeringX =  lsb * -1;
			_rChar->nHoriBeringY =  -y0 ;

		
//_rect[k].w = 10;
//_rect[k].h = 10;

			/* FREE_TYPE
		   if (FT_Load_Char(oFace,  _aRanges[i].nFirstChar + j,FT_LOAD_DEFAULT)){
				Debug::fError(gzStrL("ERROR::FREETYPE: Failed to load char"));
			}
			FT_Glyph_Metrics_* metrics = &oFace->glyph->metrics;
			rects[k].w = metrics->width/64.0 + 2.0;
			rects[k].h = metrics->height/64.0 + 2.0;
			*/


			 ++k;
      }
   }
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   return 1;
}



int fDrawRect(uPackContext *spc, unsigned char *pixels, stbrp_rect* _rect){
using namespace Font;
	int _nNbRange = 1; //Temp
	uFontRange *_aRanges = qaRange[0].get(); //Temp

	spc->pixels = pixels;

  int i,j,k, return_value = 1;

    //Draw in shorted square
   k = 0;
   for (i=0; i < _nNbRange; ++i) {
      float fh = _aRanges[i].nFontSize;
      for (j=0; j < _aRanges[i].nNbChar; ++j) {
         stbrp_rect *r = &_rect[k];
         if (r->was_packed) {
            uCharData* _rChar = _aRanges[i].aData[j];

			 unsigned char* aGlyph;
			int pitch;


			#define tSIZE 512
			unsigned int _nLetter = _aRanges[i].nFirstChar + j;
     //   stbtt_MakeCodepointBitmap(&font,   &spc->pixels[r->x + 1 + ((r->y + 1) * tSIZE) ]   , r->w - 2, r->h- 2, tSIZE, fontscale,fontscale, _nLetter);
        stbtt_MakeCodepointBitmap(&font,   &spc->pixels[r->x + 1 + ((r->y + 1) * tSIZE) ]   , r->w - 2, r->h- 2, tSIZE, fontscale,fontscale, _nLetter);
      //stbtt_MakeCodepointBitmapSubpixel(&font, &screen[baseline + y0][(int) xpos + x0], x1-x0,y1-y0, 79, scale,scale,x_shift,0, text[ch]);
//spc->width

		


			 /* FREE_TYPE
            if (FT_Load_Char(oFace,  _aRanges[i].nFirstChar + j,FT_LOAD_RENDER )){
                Debug::fError(gzStrL("ERROR::FREETYPE: Failed to load char"));
            }
            aGlyph = oFace->glyph->bitmap.buffer;
			   FT_Glyph_Metrics_* metrics = &oFace->glyph->metrics;
            //gzFloat scale = 24;
            _rChar->nHoriAdvance =    metrics->horiAdvance;
            _rChar->nHoriBeringX =    metrics->horiBearingX;
            _rChar->nHoriBeringY =    metrics->horiBearingY;
			pitch = oFace->glyph->bitmap.pitch;
			*/


/*
            for (gzUInt y = 0; y < r->h - 2; y ++){
                 for (gzUInt x = 0; x < r->w-2; x ++){
                    gzUInt _nX = r->x + x+1;
                    gzUInt _nY = r->y + y+1;
                   //  spc->pixels[spc->width * _nY +  _nX] = aGlyph[ ( pitch * y) + x];
                     spc->pixels[spc->width * _nY +  _nX] = 0xFFFFFFFF;
                }
            }
*/


            _rChar->rRect = (uRectPack*)r;


         } else {
            return_value = 0; // if any fail, report failure
         }

         ++k;
      }
   }

 //  GZ_fFree(rects); ****** HUDGE BUG ****
   return return_value;
}


/*

struct uCharData{
           unsigned short nX,nY,nW,nH; // coordinates of bbox in bitmap
           uRectPack* rRect;
            gzUInt16 nHoriAdvance;
            gzInt16 nHoriBeringX;
            gzInt16 nHoriBeringY;
          // float xoff,yoff,nHoriAdvance;
          // float xoff2,yoff2;
        };

*/


void fSetCharData(File::Font::cCharData* _oChar, uCharData* _rData){
	using namespace Font;
	  stbrp_rect *r = (stbrp_rect *)_rData->rRect; 
		  
		_oChar->nX = r->x;
		_oChar->nY = r->y;
		_oChar->nW = r->w;
		_oChar->nH = r->h;
	

	_oChar->nHoriAdvance = _rData->nHoriAdvance * fontscale;
	_oChar->nHoriBeringX = _rData->nHoriBeringX * fontscale;
	_oChar->nHoriBeringY = _rData->nHoriBeringY;
	
	
}



void fGetCharData(File::Font::cCharData* _oChar){
//uCharData* fGetCharData(gzUInt _nChar){

	gzUInt _nChar = _oChar->nChar;


    gzUInt nTotalRange = 1;
    gzUInt k = 0;
	for(gzUInt i = 0; i < qaRange.GnSize(); i++ ){

		uFontRange* _pRange = qaRange(i).get();

        if(_nChar >= _pRange->nFirstChar  && _nChar < _pRange->nFirstChar + _pRange->nNbChar){
            gzUInt _nIndex = _nChar - _pRange->nFirstChar;

					
            uCharData* _rRest = _pRange->aData[_nIndex];
			fSetCharData(_oChar, _rRest);
			return;
            //return (uCharData*)_pRange->aData[_nIndex];
			//_oChar->nX = q.x0;
			//_oChar->nY = q.y0;
        }
	}

	/*
    gzFOR_EACH_QArrayNew(qaRange, _qe_rRange, gzPod<uFontRange>){
		uFontRange* _pRange = _qe_rRange.val()->Val;
        if(_nChar >= _pRange->nFirstChar  && _nChar < _pRange->nFirstChar + _pRange->nNbChar){
            gzUInt _nIndex = _nChar - _pRange->nFirstChar;
            //uCharData* _sRest = _pRange->aData[_nIndex];
            return (uCharData*)_pRange->aData[_nIndex];
        }
   	gzEND_QArray(_qe_rRange)}
	*/
	
  fSetCharData(_oChar, qaRange(0).get()->aData[0]); ///Todo InvalidChar
	
  // return rInvalidChar;
}







gzInt fDelete(File::cRcFont* _oRc){


/*
    //free all
    gzInt32** _aPixelArray = _oRc->aImg;
    if(_aPixelArray != 0){

      GZ_fFree(_aPixelArray[0]);
        //Todo delete P2D array
    }*/

    return 0;
}



}
}
}//GZ






