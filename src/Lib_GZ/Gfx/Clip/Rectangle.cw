//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Face;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	/**
	 * @author Maeiky
	 */
	public class Rectangle extends Shape {

	//	use Triangle.uPoint3D;


		public var nSetColor1 : UInt;
		public var nSetColor2 : UInt;
		public var nGoColor1 : UInt;
		public var nGoColor2 : UInt;

		private var nS1Red : Int;
		private var nS1Blue : Int;
		private var nS1Green : Int;

		private var nG1Red : Int;
		private var nG1Blue : Int;
		private var nG1Green : Int;

		private var nC1Red : UInt;
		private var nC1Blue : UInt;
		private var nC1Green : UInt;

		private var nC2Red : UInt;
		private var nC2Blue : UInt;
		private var nC2Green : UInt;
		private var bSolid : Bool;
/*
		public var rPtTL : Mapped<uPoint3D>;
		public var rPtTR : Mapped<uPoint3D>;
		public var rPtBR : Mapped<uPoint3D>;
		public var rPtBL : Mapped<uPoint3D>;
*/


		public var oPtTL : PtA;
		public var oPtTR : PtA;
		public var oPtBR : PtA;
		public var oPtBL : PtA;


		public function Rectangle( _oParent : Root, _nX: Float, _nY:Float, _nW: Float, _nH:Float, _nColor1:UInt, _nColor2:UInt = 0):Void {
		

		//Object(_oParent, _nX , _nY);
			Shape(_oParent, _nX , _nY, 4, false);

			
			nGAttType = 2.0; //No texture form

			var _nCenterX :Int = 0;
			var _nCenterY :Int = 0;

			nWidth = _nW;
			nHeight = _nH;

			var _nBorder : Float = 0;


			var _oCenter  : Pt = new Pt(_nCenterX, _nCenterY);


			oPtTL = new PtA(0 - _nBorder, 0 -_nBorder);
			oPtTR = new PtA(nWidth  +_nBorder, 0 -_nBorder);
			oPtBR = new PtA(nWidth  +_nBorder, nHeight  +_nBorder);
			oPtBL = new PtA(0 -_nBorder, nHeight  +_nBorder);

			fAddPt(oPtTL, _oCenter);
			fAddPt(oPtTR, _oCenter);
			fAddPt(oPtBR, _oCenter);
			fAddPt(oPtBL, _oCenter);


			var _oPtSrc1 : Pt = new Pt( 0 , 0);
			var _oPtSrc2 : Pt = new Pt(nWidth  , 0);
			var _oPtSrc3 : Pt = new Pt( nWidth , nHeight );
			var _oPtSrc4 : Pt = new Pt(0 , nHeight);
			
			var _oSrc : Poly4 = new Poly4(_oPtSrc1, _oPtSrc2, _oPtSrc3, _oPtSrc4);

			fCreateFace(null, _oSrc);




			//nLimT = 0;
			//nLimL = 0;
			//nLimR = nWidth *  Math.nPrec;
			//nLimB = nHeight *  Math.nPrec;

			nSetColor1 = _nColor1;
			nSetColor2 = _nColor2;
			nGoColor1 = _nColor1;
			nGoColor2 = _nColor2;




			if (nSetColor2 == 0) {
				bSolid = true;
			}else {
				bSolid = false;
			}

			nC1Red = ( nSetColor1 >> 16 ) & 0xFF;
			nC1Blue = ( nSetColor1 >> 8 ) & 0xFF;
			nC1Green =  nSetColor1  & 0xFF;

			nC2Red = ( nSetColor2 >> 16 ) & 0xFF;
			nC2Blue = ( nSetColor2 >> 8 ) & 0xFF;
			nC2Green =  nSetColor2  & 0xFF;


			fSetColor1(nSetColor1);
			//One Color test
			nG1Red = nS1Red;
			nG1Blue = nS1Blue;
			nG1Green = nS1Green;
			


		}


		override public function fUpdate():Void {
			//nPosX++;

			//nGoColor1 += (nSetColor1 - nGoColor1) / 6;
			nG1Red +=  (nS1Red - nG1Red) / 6;
			nG1Blue +=  (nS1Blue - nG1Blue) / 6;
			nG1Green +=  (nS1Green - nG1Green) / 6;

			nGoColor1 = (0xFF << 24 ) | (nG1Red & 0x00FF0000 ) | ((nG1Blue & 0x00FF0000) >> 8 ) | ((nG1Green & 0x00FF0000) >> 16);

			//nGoColor1 = (0xFF << 24 ) | (nG1Red << 16 ) | ( nG1Blue << 8 ) | nG1Green;


		}


		override public function fGpuDraw():Bool {
			/*
			var _nRed : Float = ((nGoColor1 >> 16) & 0xFF)/255.0;
			var _nGreen : Float = ((nGoColor1 >> 8) & 0xFF)/255.0;
			var _nBlue : Float = (nGoColor1 & 0xFF)/255.0;

			nGAttRed  += _nRed;
			nGAttGreen += _nGreen;
			nGAttBlue += _nBlue;

			oFace.fGpuDraw();*/
		}


		//overrided!!
		override public function fCpuDraw(_nPosX: Int, _nPosY:Int, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Bool {
		
			
			var _nX : Int = 0;
			var _nY : Int = 0;

			_nX_Start = _nX_Start / Math.nPrec;
			_nX_End = _nX_End /  Math.nPrec;
			_nY_Start = _nY_Start /  Math.nPrec;
			_nY_End = _nY_End /  Math.nPrec;

			//var _nAbsPosX : Float = (nPosX + nParentX)/ Math.nPrec;
			//var _nAbsPosY : Float = (nPosY + nParentY) / Math.nPrec;
			var _nAbsPosX : Float = 0;
			var _nAbsPosY : Float = 0;

			var _nPixelFrame : UInt = 0;
			var _nPixelClip : UInt = 0;

			var _nFrameAlpha : UInt = 0;
			var _nFrameRed : UInt = 0;
			var _nFrameBlue : UInt = 0;
			var _nFrameGreen : UInt = 0;

			var _nClipAlpha : UInt = 0;
			var _nClipRed : UInt = 0;
			var _nClipBlue : UInt = 0;
			var _nClipGreen : UInt = 0;

			aSourcePixel = oDstBuff.aPixelArray;

			for (var y:Int = _nY_Start; y <= _nY_End; y++) {

				_nY = y + _nAbsPosY;

				for (var x:Int = _nX_Start; x <= _nX_End ; x++) {

					_nX = x + _nAbsPosX;
					//Pixel.fCopyPixelToDest(aSourcePixel, nGoColor1, _nX, _nY );




					_nPixelFrame = aSourcePixel[_nY][_nX];
					if(_nPixelFrame == 0){ //No pixel
						if (bSolid) {
							_nPixelFrame = nGoColor1; //Solid
						}else{
							_nPixelFrame = fGetPixel(x, y);
						}
					}else {
	
						//Test if it is with alpha
						_nFrameAlpha = ( _nPixelFrame >> 24 ) & 0xFF;
						if (_nFrameAlpha != 255) {

							if (bSolid) {
								_nPixelClip = nGoColor1; //Solid
							}else{
								_nPixelClip = fGetPixel(x, y);
							}
							/////////////ADDITIONNE COLOR//////////////////
							_nClipAlpha = ( _nPixelClip >> 24 ) & 0xFF;
							if(_nClipAlpha != 0){ //Not transparent

								//Mix pixel
								_nFrameRed = ( _nPixelFrame >> 16 ) & 0xFF;
								_nFrameBlue = ( _nPixelFrame >> 8 ) & 0xFF;
								_nFrameGreen =  _nPixelFrame  & 0xFF;


								_nClipRed = ( _nPixelClip >> 16 ) & 0xFF;
								_nClipBlue = ( _nPixelClip >> 8 ) & 0xFF;
								_nClipGreen =  _nPixelClip  & 0xFF;


							var _nAlphaRev:UInt = 255-_nFrameAlpha;
							var _nResClipAlpha:UInt = _nFrameAlpha + _nClipAlpha * _nAlphaRev /256;
							_nClipRed = _nFrameRed +    _nClipRed * _nAlphaRev  /256;
							_nClipBlue = _nFrameBlue  + _nClipBlue * _nAlphaRev  /256;
							_nClipGreen = _nFrameGreen  + _nClipGreen  * _nAlphaRev /256;


								_nPixelFrame =  (_nResClipAlpha << 24 ) | (_nClipRed << 16 ) | ( _nClipBlue << 8 ) | _nClipGreen
							}
							//////////////////////////////////////////////////////////////////////////
						}

					}

					aSourcePixel[_nY][_nX] = _nPixelFrame;

				}
			}

			
			
		}


		private function fGetPixel(x:Int, y:Int):UInt {

			var _nCRed : UInt;
			var _nCBlue : UInt;
			var _nCGreen : UInt;

			_nCRed = nC1Red + (nC2Red - nC1Red) * x / nWidth;
			_nCBlue = 25;
			_nCGreen = 55;
			return  (0xFF << 24 ) | (_nCRed << 16 ) | ( _nCBlue << 8 ) | _nCGreen;
			 // 0xFF878BA6   Color2
		}

		public function fSetColor1(_nColor:UInt):Void {
			nS1Red =  _nColor  & 0x00FF0000;
			nS1Blue = (_nColor  & 0x0000FF00) << 8;
			nS1Green = (_nColor & 0x000000FF) << 16;

			/*
			nS1Red = ( _nColor >> 16 ) & 0xFF;
			nS1Blue = ( _nColor >> 8 ) & 0xFF;
			nS1Green =  _nColor  & 0xFF;
			*/
		}



		override public function fUpdateLimits():Void {
			/*
			nLimT = 0;
			nLimL = 0;
			nLimB = nHeight * Math.nPrec;
			nLimR = nWidth *  Math.nPrec;
			*/
		}


	}
}
