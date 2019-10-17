//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	//import GZ.Base.Math.Math;
	import GZ.Base.Pt;
	import GZ.Base.Vec3;

	/**
	 * @author Maeiky
	 */
	//public class PtA extends Pt  {
	
	public class PtA   {

		public var oTf : Pt<Float>;
		public var o2d : Pt<Float>;
		
		//union public var vPt : Pt<Float>;
		public var vPt : Pt<Float>;
		
		/*
		//public var vPt : Pt<Float>;
		public var nX : Float;
		public var nY : Float;
		public var nZ : Float;
		*/

		public function PtA(_nX : Float = 0, _nY : Float = 0, _nZ : Float = 0):Void  {
				vPt.nX = _nX;
				vPt.nY = _nY;
				vPt.nZ = _nZ;
				
			//oTf = new Pt<Float>();
			//o2d = new Pt<Float>();
			
			
			//Pt(_nX, _nY, _nZ);
			
		}

		public function fCopyToTf():Void  {
			oTf.nX = vPt.nX;
			oTf.nY = vPt.nY;
			oTf.nZ = vPt.nZ;
		}


	}
}
