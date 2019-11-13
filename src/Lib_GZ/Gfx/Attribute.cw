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
	import GZ.Base.Quaternion;

	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		public var oGblPt : PtA;
				
				
		public  var vGblColor : Color<Float>;		
		public  var vGblSize : Size<Float>;		
		public  var vGblRot : Rotation<Float>;	
		
		public  var vQuaternion : Quaternion<Float>;	
	
		public  var vPos  : Point<EaseFloat>;
		public  var vRot  : Rotation<EaseFloat>;
		public  var vSize : Size<EaseFloat>;
		public  var vColor : Color<EaseFloat>;
		
		
		public enum eRotateOrder : Int {
			RollYawPitch;
			YawPitchRoll;
		}
		
		public var hRotateOrder : eRotateOrder;
		
		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			 oGblPt : PtA = new PtA();
			hRotateOrder = eRotateOrder.YawPitchRoll;
			
			vQuaternion = new Quaternion<Float>();
			vQuaternion.fReset();
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
			/*
			
			GZ_uEase_fStep(&(ua_nAttX));
	GZ_uEase_fStep(&(ua_nAttY));
	GZ_uEase_fStep(&(ua_nAttZ));
	GZ_uEase_fStep(&(ua_nAttWidth));
	GZ_uEase_fStep(&(ua_nAttHeight));
	GZ_uEase_fStep(&(ua_nAttLength));
	GZ_uEase_fStep(&(ua_nAttRed));
	GZ_uEase_fStep(&(ua_nAttGreen));
	GZ_uEase_fStep(&(ua_nAttBlue));
	GZ_uEase_fStep(&(ua_nAttAlpha));
	GZ_uEase_fStep(&(ua_nAttRoll));
	GZ_uEase_fStep(&(ua_nAttYaw));
	GZ_uEase_fStep(&(ua_nAttPitch));
	oQuaternion->fReset();
	if (gzInt(hRotateOrder) == ::GZ::GFX::Attribute::eRotateOrder::RollYawPitch){
		oQuaternion->fRoll(nAttRoll);
		oQuaternion->fYaw(nAttYaw);
		oQuaternion->fPitch(nAttPitch * gzFloat(-1));
	}else{
		oQuaternion->fYaw(nAttYaw);
		oQuaternion->fPitch(nAttPitch * gzFloat(-1));
		oQuaternion->fRoll(nAttRoll);
	}
	oQuaternion->fCombine((::GZ::Base::cQuaternion*)(oParent->oQuaternion.get()));
	*/
	
		
	
		//	Debug.fTrace("vSetQuaternion:[" + vQuaternion.nX + ", " + vQuaternion.nY + ", " + vQuaternion.nZ + ", " + vQuaternion.nW + "]");
				
		}



		override public function  fApplyPos():Void {
		
		
			vPos.fStep();
			vRot.fStep();
			vSize.fStep();
			vColor.fStep();
			
			vQuaternion.fReset();
			
			if(hRotateOrder == eRotateOrder.RollYawPitch){
				vQuaternion.fRoll(vRot.nRoll);
				vQuaternion.fYaw(vRot.nYaw);
				vQuaternion.fPitch(vRot.nPitch * -1)
			}else{ //YawPitchRoll
				vQuaternion.fYaw(vRot.nYaw);
				vQuaternion.fPitch(vRot.nPitch * -1)
				vQuaternion.fRoll(vRot.nRoll);
			}

			vQuaternion.fCombine(oParent.vQuaternion);		
			
			
			
			oGblPt.vPt.nX = vPos.nX  * oParent.vGblSize.nWidth;
			oGblPt.vPt.nY = vPos.nY  * oParent.vGblSize.nHeight;
			oGblPt.vPt.nZ = vPos.nZ  * oParent.vGblSize.nLength;
			
			//oGblPt->fRotate((::GZ::Base::cQuaternion*)(oParent->oQuaternion.get()));
			oGblPt.vPt.fRotate(oParent.vQuaternion);
			
			oGblPt.vPt.nX += oParent.oGblPt.vPt.nX;
			oGblPt.vPt.nY += oParent.oGblPt.vPt.nY;
			oGblPt.vPt.nZ += oParent.oGblPt.vPt.nZ;

			
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
