//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.GFX.Shape;
	import GZ.GFX.Root;
	import GZ.GFX.Triangle;
	import GZ.File.Image;
	import GZ.Math;
	
	/**
	 * @author Maeiky
	 */	
	public class TriangleClip extends Shape {
		
		use Shape.uPoint;
		
		public var aFile : CArray<Int, 1);
		
		public var oImage : Image;
		
		public var rPtTL : uPoint;
		public var rPtTR : uPoint;	
		public var rPtBR : uPoint;		
		public var rPtBL : uPoint;
		public var nTest : Int;
	//	public var sPath : String;
		
		//public easeOut var nEase :Int;
		
		public var aPoint : CArray<Float, 1, 9);
		
		
		public function TriangleClip( _oParent : Root, _nX: Float, _nY:Float, _sPath:String, _bCenter:Bool = true, _nCenterX:Int = 0, _nCenterY:Int = 0, _bSmoothBorder:Bool = true, _bDrawLine:Bool = false):Void {
			Shape(_oParent, _nX , _nY, _bSmoothBorder, _bDrawLine);
			bTri = false;
			
			
			//nEase = 5;
			//nEase.to(10);
			//nEase.speed(5);
			
			
			oImage = new Image();
			oImage.fOpen(_sPath);
			//oPng.fOpenFromMemory(aFile, 512000);
			aPixelArray = oImage.fGetImage();
	
			
			nWidth = oImage.fGetWidth();
			nHeight = oImage.fGetHeight();
			sPath = _sPath;
			
			oGpuObj.fSetImg(aPixelArray[3], nWidth, nHeight);
			
			
			//Embed.fCreateImg(this);
			
			if (_bCenter) {
				_nCenterX = nWidth / 2;
				_nCenterY = nHeight / 2;
			}


			rPtTL = addPoint(nWidth/2, nHeight/2,                _nCenterX, _nCenterY);
			rPtTR = addPoint(nWidth -1, 0,         _nCenterX, _nCenterY);
			rPtBR = addPoint(nWidth -1, nHeight -1, _nCenterX, _nCenterY);
			rPtBL = addPoint(nWidth/2, nHeight/2 ,        _nCenterX, _nCenterY);
			
			
			 //4 source associate point
			addSourcePt(nWidth/2, nHeight/2, rPtTL);
			addSourcePt(nWidth - 1, 0, rPtTR);
			addSourcePt(nWidth - 1, nHeight - 1, rPtBR);
			addSourcePt( nWidth/2, nHeight/2 , rPtBL);
			
			
			//fCreateLines();
			//fApplyPos();
			
			/*
			aPoint[0] = nWidth / 2;
			aPoint[1] = nHeight / 2;
			aPoint[2] = 0;
			
			aPoint[3] = nWidth -1;
			aPoint[4] = 0;
			aPoint[5] = 0;
			
			aPoint[6] = nWidth -1;
			aPoint[7] = nHeight -1;
			aPoint[8] = 0;
			
			
			aPoint[0] -= _nCenterX;
			aPoint[1] -= _nCenterY;
			
			aPoint[3] -= _nCenterX;
			aPoint[4] -= _nCenterY;
			
			aPoint[6] -= _nCenterX;
			aPoint[7] -= _nCenterY;
			
			*/
			
		}
		
		
		override public function fUpdateChildToParent():Void {
			
			//fApplyPos();
		}
		
		
		
		
	}
}