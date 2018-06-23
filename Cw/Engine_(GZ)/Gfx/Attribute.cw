//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Root;


	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		
		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			
			//hRotateOrder = eRotateOrder.YawPitchRoll;
			
			//oQuaternion = new Quaternion();
			//oCopyQuater = oQuaternion;
		}

		////////////////////////////////////////////////////////
		//////////////////// Position //////////////////////////
		////////////////////////////////////////////////////////

		//////////////// Wrap ////////////////
		public function WnX(_nVal : Float):Void {

		}
		public function WnY(_nVal : Float):Void {

		}
		public function WnZ(_nVal : Float):Void {

		}
		
		////////////////	////////////////

		//////////////////////////////
		public function fApplyColor():Void {

		}





		override public function  fApplyPos():Void {

		}

	}
}
