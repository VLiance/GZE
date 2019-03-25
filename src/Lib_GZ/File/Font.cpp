//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "Font.h"
#include "Lib_GZ/File/RcImg.h"
#include "Lib_GZ/Lib/Utils/stb_rect_pack.h"
#include "Math.h"

#include "Lib_GZ/File/Font/CharData.h"
#include "Lib_GZ/Wrap/ImgPack.h"

#include "Lib_GZ/Sys/Debug.h"


    stbtt_fontinfo font;
       float fontscale;




namespace Lib_GZ{


	gzSp<File::cRcImg> oFontBitmap;



namespace Wrap{

	#define tSIZE 512
	
	/*
namespace ImgPack{
extern unsigned char aBmpPack[tSIZE][tSIZE] ;
}*/

namespace pFont{


	#define BITMAP_W 512
#define BITMAP_H 512
//float scale[2] = { 14.0, 30.0f };
//stbtt_packedchar chardata[6][128];

//unsigned char ttf_buffer[1 << 25];


//unsigned char temp_bitmap[BITMAP_W][BITMAP_H];



void load_fonts(File::cRcFont* _oRc) ;
void fCreateImage(File::cRcFont* _oRc, gzUInt8* ) ;



//unsigned char* ttf_buffer;

//char buffer[24<<20];
//unsigned char screen[20][79];




gzInt fOpen(File::cRcFont* _oRc) {
	using namespace File;

 //    ttf_buffer =  ( unsigned char*)_oRc->aSrcMemData;

 	if(_oRc->aSrcMemData == 0){
			Sys::pDebug::fConsole(gzStrL("Font LOAD FAIL: Nothing in memory for: ") + _oRc->sVDrive +  _oRc->sPath  );
			return 0;
	}
 
 
printf("\nOk load font now.... %p", _oRc->aSrcMemData);


 stbtt_InitFont(&font, (const unsigned char*)_oRc->aSrcMemData, 0);
//fontscale = stbtt_ScaleForPixelHeight(&font, 13); //13 for ProggyClean!!
//fontscale = stbtt_ScaleForPixelHeight(&font, 10); //10 for ProggyTiny!!
fontscale = stbtt_ScaleForPixelHeight(&font, _oRc->nDefaultScale); //10 for ProggyTiny!!

//fontscale = stbtt_ScaleForPixelHeight(&font, 15);


//	 load_fonts(_oRc);


/*
	stbtt_pack_context pc;
   int i;

   stbtt_PackBegin(&pc, temp_bitmap[0], BITMAP_W, BITMAP_H, 0, 2, NULL);
   for (i=0; i < 1; ++i) {

      stbtt_PackSetOversampling(&pc, 1, 1);
      stbtt_PackFontRange(&pc, ttf_buffer, 0, scale[i], 32, 95, chardata[i*3+0]+32);

   }
   stbtt_PackEnd(&pc);
	 */

	 using namespace ImgPack;





    uPackContext pc;
	 fPackBegin(&pc, tSIZE, tSIZE, 0, 2, NULL);
    fAddFontRange(&pc, 12.0, 32, 95);
	
printf("\nfSetSquaresDim");
    int _nTotal;
	stbrp_rect*  myrects = fIniRectList(&pc, &_nTotal);
	fSetSquaresDim(&pc, myrects);
	
	stbrp_pack_rects((stbrp_context *) pc.pack_info, myrects, _nTotal); //do pack
	
	
	unsigned char aBmpPack[tSIZE][tSIZE] = { {0}};
	
printf("\nffDrawRect");
	fDrawRect(&pc,aBmpPack[0],myrects );

    fPackEnd(&pc);

printf("\nfCreateImage");
    fCreateImage(_oRc, (gzUInt8*) &aBmpPack[0][0] );




//   fCreateImage(_oRc, (gzUInt8*) &temp_bitmap[0][0] );




	 	/*
    stbtt_fontinfo font;
   int i,j,ascent,baseline,ch=0;
   float scale, xpos=2; // leave a little padding in case the character extends left
   const char *text = "Heljo World!"; // intentionally misspelled to show 'lj' brokenness

  // fread(buffer, 1, 1000000, fopen("c:/windows/fonts/arial.ttf", "rb"));
  // stbtt_InitFont(&font, (const unsigned char*)buffer, 0);


  // stbtt_InitFont(&font, ( unsigned char*)ttf_buffer, 0);


   scale = stbtt_ScaleForPixelHeight(&font, 15);
   stbtt_GetFontVMetrics(&font, &ascent,0,0);
   baseline = (int) (ascent*scale);


   while (text[ch]) {
      int advance,lsb,x0,y0,x1,y1;
      float x_shift = xpos - (float) floor(xpos);
      stbtt_GetCodepointHMetrics(&font, text[ch], &advance, &lsb);
      stbtt_GetCodepointBitmapBoxSubpixel(&font, text[ch], scale,scale,x_shift,0, &x0,&y0,&x1,&y1);
      stbtt_MakeCodepointBitmapSubpixel(&font, &screen[baseline + y0][(int) xpos + x0], x1-x0,y1-y0, 79, scale,scale,x_shift,0, text[ch]);
      // note that this stomps the old data, so where character boxes overlap (e.g. 'lj') it's wrong
      // because this API is really for baking character bitmaps into textures. if you want to render
      // a sequence of characters, you really need to render each bitmap to a temp buffer, then
      // "alpha blend" that into the working buffer
      xpos += (advance * scale);
      if (text[ch+1])
         xpos += scale*stbtt_GetCodepointKernAdvance(&font, text[ch],text[ch+1]);
      ++ch;
   }

*/



	return 0;
}




void load_fonts(File::cRcFont* _oRc) {



}

void fCreateImage(File::cRcFont* _oRc, gzUInt8* _bmpData) {

	//unsigned char* test = &temp_bitmap[0][0];

	char nBORDER = 1;
	char nBORDER_x2 = nBORDER * 2;
	gzUInt nExtWidth = BITMAP_W + nBORDER_x2;
	gzUInt nExtHeight = nExtWidth;

	gzInt** p2DArray;
	p2DArray = new gzInt*[nExtWidth];
		gzInt* p1DArray = (gzInt *)GZ_fCalloc(nExtHeight * nExtWidth , sizeof(gzInt) );

		p2DArray[0] = p1DArray;
		p2DArray[nExtHeight - 1] = &p1DArray[ nExtWidth * (BITMAP_H + nBORDER)];


	for (gzInt y = 0;  y < BITMAP_H;  y++){

		//	p2DArray[y+nBORDER] = (gzInt *)fCalloc(sizeof(gzInt), nExtWidth); //Or set border to 0 manualy
			//Reverse Red && blue  and premultiply
				char* RowY = (char*)&_bmpData[y * BITMAP_W];

			 for (gzInt x = 0;  x < BITMAP_W;  x++){

				  // gzUInt _nPixelFrame =  255 - RowY[x];
				   gzUInt _nPixelFrame = 0;
					gzUInt _nFrameAlpha = RowY[x];

				   gzUInt _nFrameBlue = _nPixelFrame;
				   gzUInt _nFrameGreen = _nPixelFrame;
				   gzUInt _nFrameRed = _nPixelFrame;

					//p2DArray[y+nBORDER][x+nBORDER] = (_nFrameAlpha << 24) | (_nFrameRed << 16) | (_nFrameGreen << 8) | _nFrameBlue;
					p1DArray[((y+nBORDER) *  nExtWidth) + (x+nBORDER) ]  = (_nFrameAlpha << 24) | (_nFrameRed << 16) | (_nFrameGreen << 8) | _nFrameBlue;
					//p2DArray[y+nBORDER][x+nBORDER] = (_nFrameAlpha << 24) | (_nFrameRed << 16) | (_nFrameGreen << 8) | _nFrameBlue;
					p2DArray[(y+nBORDER)] = &p1DArray[((y+nBORDER) *  nExtWidth)];

		}
	}


	 _oRc->aImg = p2DArray;
	 _oRc->nWidth = BITMAP_W;
	 _oRc->nHeight = BITMAP_H;

}




/*

typedef struct
{
   unsigned short x0,y0,x1,y1; // coordinates of bbox in bitmap
   float xoff,yoff,xadvance;
   float xoff2,yoff2;
} stbtt_packedchar;
*/
/*
typedef struct
{
   float x0,y0,s0,t0; // top-left
   float x1,y1,s1,t1; // bottom-right
} stbtt_aligned_quad;
*/

int fGetKernAdvance(File::cRcFont* _oRc, gzInt ch1, gzInt ch2){
	

	return fontscale*stbtt_GetCodepointKernAdvance(&font, ch1,ch2);
			
}



void fGetCharData(File::Font::cCharData* _oChar){

//	stbtt_packedchar myPack;
	//printf("\n _oChar->nChar: %d",  _oChar->nChar);
	
	
	ImgPack::fGetCharData(_oChar);
/*
	float x = 0;
	float y = 0;

	
	 stbtt_aligned_quad q;
  //   stbtt_GetPackedQuad(&myPack, BITMAP_W, BITMAP_H, *text++, &x, &y, &q, font ? 0 : integer_align);
     stbtt_GetPackedQuad(chardata[0], BITMAP_W, BITMAP_H, _oChar->nChar, &x, &y, &q, 0);


	 	printf("\n x0: %f", q.x0);
	 	printf("\n y0: %f", q.y0);

		 	printf("\n x1: %f", q.x1);
	 	printf("\n y1: %f", q.y1);


	 	printf("\n AA x0: %d", chardata[0][35].x0);
	 	printf("\nAA  y0: %d", chardata[0][35].y0);

	 _oChar->nX = q.x0;
	 _oChar->nY = q.y0;
	 
	 
	 */

   //   drawBoxTC(q.x0,q.y0,q.x1,q.y1, q.s0,q.t0,q.s1,q.t1);

}



gzInt fDelete(File::cRcFont* _oRc) {
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
