//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.PtA;

	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		public var oGblPt : PtA;
				
				
		public var nGAttRed  : Float;
		public var nGAttGreen : Float;
		public var nGAttBlue : Float;
		public var nGAttAlpha : Float = 1.0;
	
	
		public var nGAttRoll : Float;
		public var nGAttYaw : Float;
		public var nGAttPitch : Float;
		

		public var nGAttWidth  : Float = 1.0;
		public var nGAttHeight : Float = 1.0;
		public var nGAttLength : Float = 1.0;
		public var nGAttType : Float = 1.0;

		
		
		private  var nAttX : Float;
		private  var nAttY : Float;
		private  var nAttZ : Float;
		//
		private  var nAttRoll : Float;
		private  var nAttYaw : Float;
		private  var nAttPitch : Float;
		//
		private  var nAttWidth : Float = 1;
		private  var nAttHeight : Float = 1;
		private  var nAttLength : Float=  1;
		//
		private  var nAttRed : Float;
		private  var nAttGreen : Float;
		private  var nAttBlue : Float;
		private  var nAttAlpha : Float = 1.0;

		
		
		
		
		
		
		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			 oGblPt : PtA = new PtA();
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

		
	nAttX = 50;
	nAttY = 50;
	nAttZ = 0;
	
			oGblPt.nX = nAttX * oParent.nGAttWidth;
			oGblPt.nY = nAttY * oParent.nGAttHeight;
			oGblPt.nZ = nAttZ * oParent.nGAttLength;
			
		//	oGblPt.fRotate(oParent.oQuaternion);
			
			oGblPt.nX += oParent.oGblPt.nX;
			oGblPt.nY += oParent.oGblPt.nY;
			oGblPt.nZ += oParent.oGblPt.nZ;
			

			nGAttRoll = nAttRoll + oParent.nGAttRoll;
			nGAttYaw = nAttYaw + oParent.nGAttYaw;
			nGAttPitch = nAttPitch + oParent.nGAttPitch;

			nGAttRed  = nAttRed  + oParent.nGAttRed;
			nGAttGreen = nAttGreen + oParent.nGAttGreen;
			nGAttBlue = nAttBlue + oParent.nGAttBlue;

			nGAttWidth = nAttWidth * oParent.nGAttWidth;
			nGAttHeight = nAttHeight * oParent.nGAttHeight;
			nGAttLength = nAttLength * oParent.nGAttLength;

			nGAttAlpha = nAttAlpha * oParent.nGAttAlpha;

		}

	}
}
