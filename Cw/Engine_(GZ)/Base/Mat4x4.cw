//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

#skipContent
package  {

	import GZ.Math;
	import GZ.Base.Vec4;
	import GZ.Base.Mat3x4;

	/**
	 * @author Maeiky
	 */
	public class Mat4x4 extends Mat3x4 {

		public evar v3 : Vec4;


		public function Mat4x4(_v0 : Vec4, _v1 : Vec4, _v2 : Vec4, _v3 : Vec4) : Void  {
			v0 = _v0;
			v1 = _v1;
			v2 = _v2;
			v3 = _v3;
		}
		
	
		
	}
}
