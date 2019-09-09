//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.
#skipContent
package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Vec4;
	import GZ.Base.Mat4x4;


	/**
	 * @author Maeiky
	 */
	public class Perspective  {

	//	public evar mProj : Mat4x4;
		
		public var nWidth : Float = 100;//800
		public var nHeight : Float = 600;
		
		
		public var nRatio : Float;
		public var nNear : Float;
		public var nFar : Float;
		public var nRange: Float;
		public var nFov: Float = 90;
		public var nTanHalfFov: Float;
		
		

		public function Perspective():Void  {
			/*
			nRatio = nWidth / nHeight;
			nNear = 1;
			nFar = 1000;
			nRange = nNear - nFar;
			
			nTanHalfFov= Math.fTan(Math.fToRadian(nFov / 2.0));
			

			mProj.v0 = new Vec4(1.0 / (nTanHalfFov * nRatio), 0.0, 0.0, 0.0);
			mProj.v1 = new Vec4(0.0, 1.0 / nTanHalfFov, 0.0, 0.0);
			mProj.v2 = new Vec4(0.0, 0.0, (nNear * -1 - nFar) / nRange,  2 * nFar * nNear / nRange);
			mProj.v3 = new Vec4(0.0, 0.0, 1.0, 0.0);
			*/

			
		}
		
	
		
	}
}
