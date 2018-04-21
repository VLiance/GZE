//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.GFX.Shape;
	import GZ.GFX.Root;
	import GZ.File.Image;
	import GZ.Math;
	
	/**
	 * @author Maeiky
	 */	
	public class Sprite extends Shape {
		
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
		
		
		public function Sprite( _oParent : Root, _nX: Int, _nY:Int, _sPath:String, _bCenter:Bool = true, _nCenterX:Int = 0, _nCenterY:Int = 0, _bSmoothBorder:Bool = true, _bDrawLine:Bool = false):Void {
			Shape(_oParent, _nX , _nY, 4, _bSmoothBorder);
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
			
			oGpuObj.fSetImg(aPixelArray[0], nWidth, nHeight);
			oGpuObjTest.fSetImg(aPixelArray[0], nWidth, nHeight);
			
			
			//Embed.fCreateImg(this);
			
			if (_bCenter) {
				_nCenterX = nWidth / 2;
				_nCenterY = nHeight / 2;
			}

			//Alerady extruded todo made fonction for this
			// 4 points
			
			rPtTL = addPoint(0, 0,                _nCenterX, _nCenterY);
			rPtTR = addPoint(nWidth -1, 0,         _nCenterX, _nCenterY);
			rPtBR = addPoint(nWidth -1, nHeight -1, _nCenterX, _nCenterY);
			rPtBL = addPoint(0, nHeight -1,        _nCenterX, _nCenterY);
			
	
			/*
			//Reverse X
			rPt1 = addPoint(nWidth -1, 0,                _nCenterX, _nCenterY);
			rPt2 = addPoint(0, 0,         _nCenterX, _nCenterY);
			rPt3 = addPoint(0, nHeight -1, _nCenterX, _nCenterY);
			rPt4 = addPoint(nWidth -1, nHeight -1,        _nCenterX, _nCenterY);
			*/
			
			/*
			//Reverse Y
			rPt1 = addPoint(0, nHeight -1,                _nCenterX, _nCenterY);
			rPt2 = addPoint(nWidth -1,  nHeight -1,         _nCenterX, _nCenterY);
			rPt3 = addPoint(nWidth -1, 0, _nCenterX, _nCenterY);
			rPt4 = addPoint(0, 0,        _nCenterX, _nCenterY);
			*/
			
			/*
			//Reverse XY
			rPt1 = addPoint(nWidth -1, nHeight -1,                _nCenterX, _nCenterY);
			rPt2 = addPoint(0,  nHeight -1,         _nCenterX, _nCenterY);
			rPt3 = addPoint(0, 0, _nCenterX, _nCenterY);
			rPt4 = addPoint(nWidth -1, 0,        _nCenterX, _nCenterY);
			*/
			
			 //4 source associate point
			addSourcePt(0, 0, rPtTL);
			addSourcePt(nWidth - 1, 0, rPtTR);
			addSourcePt(nWidth - 1, nHeight - 1, rPtBR);
			addSourcePt( 0, nHeight - 1, rPtBL);
			
			//fCreateLines();
			//fApplyPos();
			
			aPoint3D[0] = rPtTL.nX; 
			aPoint3D[1] = rPtTL.nY; 
			aPoint3D[2] = rPtTL.nZ; 
			
			aPoint3D[3] = rPtTR.nX; 
			aPoint3D[4] = rPtTR.nY; 
			aPoint3D[5] = rPtTR.nZ; 
			
			aPoint3D[6] = rPtBR.nX; 
			aPoint3D[7] = rPtBR.nY; 
			aPoint3D[8] = rPtBR.nZ; 
			
			aPoint3D[9] = rPtBL.nX; 
			aPoint3D[10] = rPtBL.nY; 
			aPoint3D[11] = rPtBL.nZ; 
			
			//oGpuObjTest.fIniTest(this);
		
		}
		
		
		override public function fUpdateChildToParent():Void {
			
			//fApplyPos();
		}
		
		
		
		
	}
}