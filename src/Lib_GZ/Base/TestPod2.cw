//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Base.TestPod;

	/**
	 * @author Maeiky
	 */
	public pod TestPod2 extends TestPod{
		
		
		
		public var nZ : Float;
		public var nW : Float;

		public function TestPod2(_nX : Float = 0, _nY : Float = 0, _nZ : Float = 0, _nW : Float = 0):Void  {
			
			nX = _nX;
			nY = _nY;
			
			nZ = _nZ;
			nW = _nW;
		}
		
		
	}
}
