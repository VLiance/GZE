//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	
	import GZ.Base.Pt;
	import GZ.Base.Math.Math;


	/**
	 * @author Maeiky
	 */
	public class Poly4  {
		
		public var oPt1 : Pt<Float>;
		public var oPt2 : Pt<Float>;
		public var oPt3 : Pt<Float>;
		public var oPt4 : Pt<Float>;
		
		public function Poly4(_oPt1 : Pt<Float>, _oPt2 : Pt<Float>, _oPt3 : Pt<Float>, _oPt4 : Pt<Float>):Void  {
			oPt1 = _oPt1;
			oPt2 = _oPt2;
			oPt3 = _oPt3;
			oPt4 = _oPt4;
			
		}
	}
}
