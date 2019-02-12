//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Object;
	import GZ.Gpu.GpuObj.GpuFace;
	import GZ.Base.Math.Math;
	import GZ.File.RcImg;
	import GZ.Base.PtA;
	import GZ.Base.Poly4;
	
	public class Face  {
	
		use Triangle.uPoint3D;
		use Shape.uPoint;
		
		public const var nFocal : Float = 1.0/270.0;
/*
		public var rPt1 : Mapped<uPoint3D>;
		public var rPt2 : Mapped<uPoint3D>;
		public var rPt3 : Mapped<uPoint3D>;
		public var rPt4 : Mapped<uPoint3D>;
*/
		

		public var oPt1 : PtA;
		public var oPt2 : PtA;
		public var oPt3 : PtA;
		public var oPt4 : PtA;



		public var nPt1 : UInt;
		public var nPt2 : UInt;
		public var nPt3 : UInt;
		public var nPt4 : UInt;
		
				
		public var oGpuObj : GpuFace;
		
		public var oRc : RcImg;
		public wvar oShape : Shape;
		
		public var aPtSource : CArray<Float, 1, 8>;
		public var aPoint2D : CArray<Float, 1>;
		public var rPtS1 : Mapped<uPoint3D>;
		public var rPtS2 : Mapped<uPoint3D>;
		public var rPtS3 : Mapped<uPoint3D>;
		public var rPtS4 : Mapped<uPoint3D>;

		
		public var aPixelArray : CArray<Int32, 2>;
		
		//public static const var nBorder : Float = 1; //Must be same ase png.h
		public const var nBorder : Float = 0.5; //Must be same ase png.h  1- 0.5 ajust
		
		
		//public function Face( _oShape : Shape, _oRc : RcImg,    _oPt1 : PtA,  _oPt2 : PtA, _oPt3 : PtA, _oPt4 : PtA,         _aPoint2D : CArray<Float, 1>, _nPtS1x:Float, _nPtS1y:Float, _nPtS2x:Float, _nPtS2y:Float, _nPtS3x:Float, _nPtS3y:Float, _nPtS4x:Float, _nPtS4y:Float):Void {
		public function Face( _oShape : Shape, _oRc : RcImg,    _oPt1 : PtA,  _oPt2 : PtA, _oPt3 : PtA, _oPt4 : PtA,         _aPoint2D : CArray<Float, 1>, _oSrc : Poly4):Void {
			
			
			
			oShape = _oShape;
			oRc = 	_oRc;
			aPoint2D = _aPoint2D;
			
			 oPt1 = _oPt1;
			 oPt2 = _oPt2;
			 oPt3 = _oPt3;
			 oPt4 = _oPt4;

			oShape.oItf.nTotalFaces++;
			
			nPt1 = 0;
			nPt2 = 3;
			nPt3 = 6;
			nPt4 = 9;
			
			/*
			rPt1 = _aPoint2D[0];
			rPt2 = _aPoint2D[3];
			rPt3 = _aPoint2D[6];
			rPt4 = _aPoint2D[9];
			*/
			
			aPtSource[0] = _oSrc.oPt1.nX + nBorder;
			aPtSource[1] = _oSrc.oPt1.nY + nBorder;
			aPtSource[2] = _oSrc.oPt2.nX + nBorder;
			aPtSource[3] = _oSrc.oPt2.nY + nBorder;
			aPtSource[4] = _oSrc.oPt3.nX + nBorder;
			aPtSource[5] = _oSrc.oPt3.nY + nBorder;
			aPtSource[6] = _oSrc.oPt4.nX + nBorder;
			aPtSource[7] = _oSrc.oPt4.nY + nBorder;
			
			rPtS1 = aPtSource[0];
			rPtS2 = aPtSource[2];
			rPtS3 = aPtSource[4];
			rPtS4 = aPtSource[6];
			
			oGpuObj = new GpuFace();
			oGpuObj.fIni(this);
		}
		
		public function fGpuDraw( ):Bool {
			oGpuObj.fDraw( oShape.oDstBuff, 0, 0 , 0 , 0);
		}
	

		public function fCpuDraw( _oDest : Object,  _nPosX: Int,  _nPosY: Int, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int, _nRsAlpha: UInt , _nRsBrRed: UInt , _nRsBrGreen: UInt   , _nRsBrBlue: UInt , _nRsRevRed: UInt , _nRsRevBlue: UInt , _nRsRevGreen: UInt , _nOfRevRed: UInt , _nOfRevBlue: UInt , _nOfRevGreen: UInt):Bool {
			
			//Triangle.fDraw(aPoint2D[nPt1], aPoint2D[nPt2], aPoint2D[nPt4],  rPtS1, rPtS2, rPtS4,  _nPosX, _nPosY, oRc.aImg, oRc.nWidth, oRc.nHeight,  _oDest , _nX_Start , _nX_End , _nY_Start , _nY_End,  _nRsAlpha, _nRsBrRed, _nRsBrGreen , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen);
			//Triangle.fDraw(aPoint2D[nPt4], aPoint2D[nPt2], aPoint2D[nPt3],  rPtS4, rPtS2, rPtS3,  _nPosX, _nPosY, oRc.aImg, oRc.nWidth, oRc.nHeight,  _oDest , _nX_Start , _nX_End , _nY_Start , _nY_End,  _nRsAlpha, _nRsBrRed, _nRsBrGreen , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen, true);
			
			Triangle.fDraw(oPt1.o2d, oPt2.o2d, oPt4.o2d,  rPtS1, rPtS2, rPtS4,  _nPosX, _nPosY, oRc.aImg, oRc.nWidth, oRc.nHeight,  _oDest , _nX_Start , _nX_End , _nY_Start , _nY_End,  _nRsAlpha, _nRsBrRed, _nRsBrGreen , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen);
			Triangle.fDraw(oPt4.o2d, oPt2.o2d, oPt3.o2d,  rPtS4, rPtS2, rPtS3,  _nPosX, _nPosY, oRc.aImg, oRc.nWidth, oRc.nHeight,  _oDest , _nX_Start , _nX_End , _nY_Start , _nY_End,  _nRsAlpha, _nRsBrRed, _nRsBrGreen , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen, true);
		
		}
		
		
		destructor {
			oShape.oItf.nTotalFaces--;
		}
		
		
		
	}
}