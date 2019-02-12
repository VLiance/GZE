//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import flash.display.InteractiveObject;
	import GZ.Sys.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Object;
	import GZ.Gfx.File.FilesImg;
	import GZ.Base.Math.Math;

	
	
	public class BaseForm extends Object {
	
		
		public var aFile : CArray<Int, 1>;
		
		public var oImage : FilesImg;
		
		public var aPoint : CArray<Float, 1, 9>;
		public var aPtSource: CArray<Float, 1, 6>;
	
		private var rPtHT : CArray<Float, 1>;
		private var rPtHL : CArray<Float, 1>;
		private var rPtHR : CArray<Float, 1>;
		private var rPtHB : CArray<Float, 1>;
		
		
		public var oTriangle1 : Triangle;
		
		
		public function BaseForm( _oParent : Root, _nX: Float, _nY:Float, _sPath:String, _bCenter:Bool = true, _nCenterX:Int = 0, _nCenterY:Int = 0, _bSmoothBorder:Bool = true, _bDrawLine:Bool = false):Void {
			Object(_oParent, _nX , _nY);

			oImage = new Image();
			oImage.fOpen(_sPath);
			//oPng.fOpenFromMemory(aFile, 512000);
			aPixelArray = oImage.fGetImage();
			
			
			nWidth = oImage.fGetWidth();
			nHeight = oImage.fGetHeight();
			sPath = _sPath;
			

			oGpuObj.fSetImg(aPixelArray[0], nWidth, nHeight);
	
		
			
			
			//Embed.fCreateImg(this);
			
			if (_bCenter) {
				_nCenterX = nWidth / 2;
				_nCenterY = nHeight / 2;
			}
			
			var _nBorder : Float =  2;
			
			//////////////////////////
		
			aPoint[0] = (nWidth-1) / 2;
			aPoint[1] = (nHeight-1) / 2;
			aPoint[2] = 0;
			
			aPoint[3] = nWidth -1;
			aPoint[4] = 0;
			aPoint[5] = 0;
			
			aPoint[6] = nWidth -1;
			aPoint[7] = nHeight -1;
			aPoint[8] = 0;
			

			//////////////////////////
			
			
			
			aPtSource[0] = (nWidth-1) / 2;
			aPtSource[1] = (nHeight-1) / 2;
			
			aPtSource[2] = nWidth - 1;
			aPtSource[3] = 0;
			
			aPtSource[4] = nWidth - 1;
			aPtSource[5] = nHeight - 1;
			
			
			//////////////////
			
			aPoint[0] -= _nCenterX;
			aPoint[1] -= _nCenterY;
			
			aPoint[3] -= _nCenterX;
			aPoint[4] -= _nCenterY;
			
			aPoint[6] -= _nCenterX;
			aPoint[7] -= _nCenterY;
			
			aPtSource[0] += _nBorder;
			aPtSource[1] += _nBorder;
			
			aPtSource[2] += _nBorder;
			aPtSource[3] += _nBorder;
			
			aPtSource[4] += _nBorder;
			aPtSource[5] += _nBorder;
			//////////////////
			
			oTriangle1 = new Triangle(aPoint[0], aPoint[3], aPoint[6],    aPtSource[0], aPtSource[2], aPtSource[4] );
			
			oGpuObj.fIniTriangle(aPtSource[0], 	aPtSource[1], 	aPtSource[2], 	aPtSource[3], 	aPtSource[4],	aPtSource[5]);
			
			fSetRectangleBorderCorner();
			
		}
		
	
		override public function fFinalUpdate():Void {
			oTriangle1.fUpdateSegment();
			oGpuObj.fUpdateTriangle(aPoint[0] + nX, 	aPoint[1] + nY, 	aPoint[3]  + nX, 	aPoint[4] + nY, 	aPoint[6]  + nX,	aPoint[7] + nY);
			
		}
		
		//All HighPos Val must be get
		public function fSetRectangleBorderCorner():Void {
			/*
			nBorderT = rPtHT[1];
			nBorderB = rPtHB[1];
			
			nBorderR = rPtHR[0];
			nBorderL = rPtHL[0];
			*/
			
			
			nLimT =  Math.fITronc(-500.0* Math.nPrec + Math.nPrec/2);
			nLimB =  Math.fITronc(500.0 * Math.nPrec + Math.nPrec/2);
			nLimR =  Math.fITronc(500.0 * Math.nPrec + Math.nPrec/2);
			nLimL =  Math.fITronc(-500.0 * Math.nPrec + Math.nPrec / 2);
			
			/*
			nLimT =  Math.fITronc(rPtHT[1] * Math.nPrec + Math.nPrec/2);
			nLimB =  Math.fITronc(rPtHB[1] * Math.nPrec + Math.nPrec/2);
			nLimR =  Math.fITronc(rPtHR[0] * Math.nPrec + Math.nPrec/2);
			nLimL =  Math.fITronc(rPtHL[0] * Math.nPrec + Math.nPrec / 2);
			*/
			
		}
		
		
		override public function fDrawObject( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void {
			
			oGpuObj.fDrawTriangle(_oSource);
			oTriangle1.fDraw(nPosX, nPosY,  aPixelArray,  _oSource , _nX_Start , _nX_End , _nY_Start , _nY_End,  nRsAlpha, nRsBrRed, nRsBrGreen  , nRsBrBlue, nRsRevRed, nRsRevBlue, nRsRevGreen, nOfRevRed, nOfRevBlue, nOfRevGreen);
		
			
		}
		
	
		
		
		
		
	}
}