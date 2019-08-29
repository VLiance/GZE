//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Vec4;

	/**
	 * @author Maeiky
	 */
	public vector Quaternion extends Vec4 {
	
			public var nTest : Number; //teemp

		public function Quaternion():Void  {
			Vec4(0,0,0,1);
		}

		public function fReset():Void {
			nX = 0;
			nY = 0;
			nZ = 0;
			nW = 1;
		}

		public function fRoll(_nAngle : Float):Void {
					
			var _nResW : Float = Math.fCos(0.5 * _nAngle) ;
			var _nResZ : Float = Math.fSin(0.5 * _nAngle);

			var _nTempX : Float = (nX * _nResW)  - (nY * _nResZ);
			var _nTempZ : Float = (nZ * _nResW)  + (nW * _nResZ);
			nY 			        = (nY * _nResW)  + (nX * _nResZ);
			nW 			        = (nW * _nResW)  - (nZ * _nResZ);

			nX = _nTempX;
			nZ = _nTempZ;
		}
	
	
		public function fYaw(_nAngle : Float):Void {
				
			var _nResW : Float =  Math.fCos(0.5 * _nAngle) ;
			var _nResY : Float =  Math.fSin(0.5 * _nAngle);

			var _nTempX : Float = (nX * _nResW) + (nZ * _nResY);
			var _nTempY : Float = (nY * _nResW) + (nW * _nResY);
			nZ 			        = (nZ * _nResW) - (nX * _nResY);
			nW 			        = (nW * _nResW) - (nY * _nResY);

			nX = _nTempX;
			nY = _nTempY;
		}
		public function fPitch(_nAngle : Float):Void {
			var _nResW : Float =  Math.fCos(0.5 * _nAngle);
			var _nResX : Float  = Math.fSin(0.5 * _nAngle);

			var _nTempX : Float = (nX * _nResW) + (nW * _nResX);
			var _nTempY : Float = (nY * _nResW) - (nZ * _nResX);
			nZ 			        = (nZ * _nResW) + (nY * _nResX);
			nW 		            = (nW * _nResW) - (nX * _nResX);

			nX = _nTempX;
			nY = _nTempY;
		}
		

		public function fCombine(_oOther : Quaternion<Number> ):Void {
		
			var _nTempX : Float = (nX * _oOther.nW) + (nW * _oOther.nX) + (nZ * _oOther.nY) - (nY * _oOther.nZ);
			var _nTempY : Float = (nY * _oOther.nW) + (nW * _oOther.nY) + (nX * _oOther.nZ) - (nZ * _oOther.nX);
			var _nTempZ : Float = (nZ * _oOther.nW) + (nW * _oOther.nZ) + (nY * _oOther.nX) - (nX * _oOther.nY);
			nW 				    = (nW * _oOther.nW) - (nX * _oOther.nX) - (nY * _oOther.nY) - (nZ * _oOther.nZ);
			
			nX = _nTempX;
			nY = _nTempY;
			nZ = _nTempZ;
		}
		
		
		
		
	}
}
