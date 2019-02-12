//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Object;
	import GZ.Sys.GpuObj.GpuFace;
	import GZ.Base.Math.Math;
	//import GZ.File.Embed;
	import GZ.File.RcImg;
	
	public class Face  {
	
		use Triangle.uPoint3D;
		use Shape.uPoint;
		
		public var rPtS1 : Mapped<uPoint3D>;
		public var rPtS2 : Mapped<uPoint3D>;
		public var rPtS3 : Mapped<uPoint3D>;
		public var rPtS4 : Mapped<uPoint3D>;
		
		public var oRc : RcImg;
		public var aPtSource : CArray<Float, 1, 8>;

		
		public function Face(_oRc : RcImg, _nPtS1x:Float, _nPtS1y:Float, _nPtS2x:Float, _nPtS2y:Float, _nPtS3x:Float, _nPtS3y:Float, _nPtS4x:Float, _nPtS4y:Float):Void {
			
			oRc = 	_oRc;
			aPoint2D = _aPoint2D;
			
			aPtSource[0] = _nPtS1x + 0.5;
			aPtSource[1] = _nPtS1y + 0.5;
			aPtSource[2] = _nPtS2x + 0.5;
			aPtSource[3] = _nPtS2y + 0.5;
			aPtSource[4] = _nPtS3x + 0.5;
			aPtSource[5] = _nPtS3y + 0.5;
			aPtSource[6] = _nPtS4x + 0.5;
			aPtSource[7] = _nPtS4y + 0.5;
			
			rPtS1 = aPtSource[0];
			rPtS2 = aPtSource[2];
			rPtS3 = aPtSource[4];
			rPtS4 = aPtSource[6];
			
		}
	
	
		
		
	}
}