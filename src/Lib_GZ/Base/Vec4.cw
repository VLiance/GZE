//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Vec3;

	/**
	 * @author Maeiky
	 */
	public vector Vec4 extends Vec3 {

		public var nW : Number;

		public function Vec4(_nX: Number = 0, _nY: Number = 0, _nZ: Number = 0, _nW: Number = 0):Void  {
			Vec3(_nX, _nY, _nZ);
			nW = _nW;
		}
		
	
		
	}
}
