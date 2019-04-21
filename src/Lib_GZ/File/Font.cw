//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {
	
	import GZ.File.RcFont;
	import GZ.File.Font.CharData;
	
	<cpp>
	#include "Lib_GZ/3rdparty/Font/stb_truetype.h"
	#include "Lib_GZ/File/ImgPack.h"
	
	#define nBitmap_H 512
	#define nBitmap_W 512
	</cpp>
	
	<cpp_namespace>
	    stbtt_fontinfo font;
       float fontscale;
	   
	   void fCreateImage(File::cRcFont* _oRc, gzUInt8* _bmpData) {

			//unsigned char* test = &temp_bitmap[0][0];

			char nBORDER = 1;
			char nBORDER_x2 = nBORDER * 2;
			gzUInt nExtWidth = nBitmap_W + nBORDER_x2;
			gzUInt nExtHeight = nExtWidth;

			gzInt** p2DArray;
			p2DArray = new gzInt*[nExtWidth];
				gzInt* p1DArray = (gzInt *)GZ_fCalloc(nExtHeight * nExtWidth , sizeof(gzInt) );

				p2DArray[0] = p1DArray;
				p2DArray[nExtHeight - 1] = &p1DArray[ nExtWidth * (nBitmap_H + nBORDER)];


			for (gzInt y = 0;  y < nBitmap_H;  y++){

				//	p2DArray[y+nBORDER] = (gzInt *)fCalloc(sizeof(gzInt), nExtWidth); //Or set border to 0 manualy
					//Reverse Red && blue  and premultiply
						char* RowY = (char*)&_bmpData[y * nBitmap_W];

					 for (gzInt x = 0;  x < nBitmap_W;  x++){

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
			 _oRc->nWidth = nBitmap_W;
			 _oRc->nHeight = nBitmap_H;
		}
	   
	</cpp_namespace>
	
	public overclass Font  {
			
		public unit uRectPack {
			nId : Int;
			nW : Int16;
			nH : Int16;
			nX : Int16;
			nY : Int16;
			nWasPacked : Bool;
		} 
	
		public unit uCharData {
			nX : Int16;
			nY : Int16;
			nW : Int16;
			nH : Int16;
			rRect : uRectPack;
			nHoriAdvance : Int16;
            nHoriBeringX : Int16;
            nHoriBeringY : Int16;
		} 
		
		
		//public var nBitmap_H : Int = 512;
		//public var nBitmap_W : Int = 512;
		
		
		overable static function fGetCharData( _oCharData : CharData ):Void{
				Debug.fTrace("Test");
		}
		
		overable static function fOpen(_oRc : RcFont): Int {
			Debug.fWarning("Open");
			if(_oRc.aSrcMemData == 0){
				Debug.fTrace("Font LOAD FAIL: Nothing in memory for: " + _oRc.sVDrive +  _oRc.sPath  );
				return 0;
			}
			
			//Debug.fWarning("YEEEEEEEEEEEEEEEEEEEEEEEEE");
			<cpp>
			 stbtt_InitFont(&font, (const unsigned char*)_oRc->aSrcMemData, 0);
			//fontscale = stbtt_ScaleForPixelHeight(&font, 13); //13 for ProggyClean!!
			//fontscale = stbtt_ScaleForPixelHeight(&font, 10); //10 for ProggyTiny!!
			fontscale = stbtt_ScaleForPixelHeight(&font, _oRc->nDefaultScale); //10 for ProggyTiny!!
			
			using namespace ImgPack;
			
			uPackContext pc;
			fPackBegin(&pc, nBitmap_W, nBitmap_H, 0, 2, NULL);
			fAddFontRange(&pc, 12.0, 32, 95);
			
printf("\nfSetSquaresDim");
    int _nTotal;
	stbrp_rect*  myrects = fIniRectList(&pc, &_nTotal);
	fSetSquaresDim(&pc, myrects);
	
	stbrp_pack_rects((stbrp_context *) pc.pack_info, myrects, _nTotal); //do pack
	
	
	unsigned char aBmpPack[nBitmap_H][nBitmap_W] = { {0}};
	printf("\nffDrawRect");
	fDrawRect(&pc,aBmpPack[0],myrects );
    fPackEnd(&pc);

printf("\nfCreateImage");
    fCreateImage(_oRc, (gzUInt8*) &aBmpPack[0][0] );

	
			</cpp>
			Debug.fPass("FINISH FONT!!!");
		
		}
		
		overable static function fDelete(_oRc : RcFont): Void;
		overable static function fGetKernAdvance(_oRc : RcFont, _nCh1 : Int, _nCh2 : Int):Int;

	}
	
	
	
	
	

}