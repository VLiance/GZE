//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.PtA;
	import GZ.Base.Pod.Point;
	import GZ.Base.Pod.Rotation;
	import GZ.Base.Pod.Size;
	import GZ.Base.Pod.Color;

	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		public var oGblPt : PtA;
				
				
		public  var vGblColor : Color<Float>;		
		public  var vGblSize : Size<Float>;		
		public  var vGblRot : Rotation<Float>;	
		

	
		public  var vPos  : Point<EaseFloat>;
		public  var vRot  : Rotation<EaseFloat>;
		public  var vSize : Size<EaseFloat>;
		public  var vColor : Color<EaseFloat>;
		
		
		
		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			 oGblPt : PtA = new PtA();
			//hRotateOrder = eRotateOrder.YawPitchRoll;
			
			//oQuaternion = new Quaternion();
			//oCopyQuater = oQuaternion;
			
			vSize.nWidth = 1;
			vSize.nHeight = 1;
			vSize.nLength = 1;
			
			vColor.nAlpha = 1;
			vGblColor.nAlpha = 1;
			
			vGblSize.nWidth = 1;
			vGblSize.nHeight = 1;
			vGblSize.nLength = 1;
			

		}

		

		//////////////////////////////
		public function fApplyColor():Void {

		}



		override public function  fApplyPos():Void {
			
			vPos.fStep();
			vRot.fStep();
			vSize.fStep();
			vColor.fStep();
			
			oGblPt.nX = vPos.nX  * oParent.vGblSize.nWidth;
			oGblPt.nY = vPos.nY  * oParent.vGblSize.nHeight;
			oGblPt.nZ = vPos.nZ  * oParent.vGblSize.nLength;
			
		//	oGblPt.fRotate(oParent.oQuaternion);
			
			oGblPt.nX += oParent.oGblPt.nX;
			oGblPt.nY += oParent.oGblPt.nY;
			oGblPt.nZ += oParent.oGblPt.nZ;

			
			vGblRot =  vRot + oParent.vGblRot;
			
			//vGblSize = vSize * oParent.vGblSize;

			vGblSize = vSize * oParent.vGblSize;
	
			vGblColor.nRed  = vColor.nRed  + oParent.vGblColor.nRed;
			vGblColor.nGreen =  vColor.nGreen + oParent.vGblColor.nGreen ;
			vGblColor.nBlue =  vColor.nBlue + oParent.vGblColor.nBlue;
			
			vGblColor.nAlpha =  vColor.nAlpha * oParent.vGblColor.nAlpha;
			
		//	vGblColor = vGblColor * oParent.vGblColor;
			

		}
	}
}
