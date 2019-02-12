//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Pt;
	import GZ.Base.Vec3;

	/**
	 * @author Maeiky
	 */
	public class PtA extends Pt  {

		public evar oTf : Pt;
		public evar o2d : Pt;

		public function PtA(_nX : Float = 0, _nY : Float = 0, _nZ : Float = 0):Void  {
			Pt(_nX, _nY, _nZ);
		}

		public function fCopyToTf():Void  {
			oTf.nX = nX;
			oTf.nY = nY;
			oTf.nZ = nZ;
		}


	}
}
