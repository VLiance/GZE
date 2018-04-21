//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Math;
	import GZ.Gfx.Pixel;
	import GZ.Base.Quaternion;
	import GZ.Base.PtA;


	//import GZ.image.Png;

	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		public unit uColor {
			nA : Float;
			nR : Float;
			nG : Float;
			nB : Float;
		}
		
		public enum eRotateOrder : UInt8 {
			RollYawPitch;
			YawPitchRoll;
		}
		
		public var hRotateOrder: eRotateOrder;

		

		public var nGAttX : Float;
		public var nGAttY : Float;
		public var nGAttZ : Float;
		
		
		public evar oGblPt : PtA;
		

		public var nGAttRoll : Float;
		public var nGAttYaw : Float;
		public var nGAttPitch : Float;
		

		public var nGAttWidth  : Float = 1.0;
		public var nGAttHeight : Float = 1.0;
		public var nGAttLength : Float = 1.0;
		public var nGAttType : Float = 1.0;


		public evar oQuaternion : Quaternion;
		//public var oCopyQuater : Quaternion;
		
		

		public var nGAttRed  : Float;
		public var nGAttGreen : Float;
		public var nGAttBlue : Float;
		public var nGAttAlpha : Float = 1.0;

		private ease var nAttX : Float;
		private ease var nAttY : Float;
		private ease var nAttZ : Float;
		//
		private ease var nAttRoll : Float;
		private ease var nAttYaw : Float;
		private ease var nAttPitch : Float;
		//
		private ease var nAttWidth : Float = 1;
		private ease var nAttHeight : Float = 1;
		private ease var nAttLength : Float=  1;
		//
		private ease var nAttRed : Float;
		private ease var nAttGreen : Float;
		private ease var nAttBlue : Float;
		private ease var nAttAlpha : Float = 1.0;

		private var nAttWrap : UInt;
		private var nAttMove : UInt;

		public var bUpdateOneTimeColor :Bool = false;
		public var bUpdateEasing :Bool = false;

		public ease var nAlpha :Int = 0;

		public ease var nBrRed :Int =  0;
		public ease var nBrBlue :Int = 0;
		public ease var nBrGreen :Int = 0;

		public var nRsBrRed :Int =  0;
		public var nRsBrBlue :Int = 0;
		public var nRsBrGreen :Int = 0;
		public var nRsAlpha :Int = 256;

		private var dRotationOrder : Delegate<fRotationOrder1> = fRotationOrder1;


		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			
			hRotateOrder = eRotateOrder.YawPitchRoll;
			
			//oQuaternion = new Quaternion();
			//oCopyQuater = oQuaternion;
		}

		////////////////////////////////////////////////////////
		//////////////////// Position //////////////////////////
		////////////////////////////////////////////////////////

		//////////////// Wrap ////////////////
		public function WnX(_nVal : Float):Void {
			nAttX = _nVal;
			nAttX.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << 0);
		}
		public function WnY(_nVal : Float):Void {
			nAttY = _nVal;
			nAttY.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << 1);
		}
		public function WnZ(_nVal : Float):Void {
			nAttZ = _nVal;
			nAttZ.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << 2);
		}
		//////////////// TO	////////////////
		public function TnX(_nVal : Float):Void {
			nAttX.fTo(_nVal);
			nAttMove = nAttMove | (1 << 0);
		}
		public function TnY(_nVal : Float):Void {
			nAttY.fTo(_nVal);
			nAttMove = nAttMove | (1 << 1);
		}
		public function TnZ(_nVal : Float):Void {
			nAttZ.fTo(_nVal);
			nAttMove = nAttMove | (1 << 2);
		}
		//////////////// Move	////////////////
		public function MnX(_nVal : Float):Void {
			nAttX.fTo(nAttX + _nVal);
			nAttMove = nAttMove | (1 << 0);
		}
		public function MnY(_nVal : Float):Void {
			nAttY.fTo(nAttY + _nVal);
			nAttMove = nAttMove | (1 << 1);
		}
		public function MnZ(_nVal : Float):Void {
			nAttZ.fTo(nAttZ + _nVal);
			nAttMove = nAttMove | (1 << 2);
		}
		//////////////// Limit	////////////////
		public function LnX(_nVal : Float):Void {
			nAttX.fLimit(_nVal);
		}
		public function LnY(_nVal : Float):Void {
			nAttY.fLimit(_nVal);
		}
		public function LnZ(_nVal : Float):Void {
			nAttZ.fLimit(_nVal);
		}
		//////////////// Ease ////////////////
		public function EnX(_nSpeed : Float):Void {
			nAttX.fSpeed(_nSpeed);
		}
		public function EnY(_nSpeed : Float):Void {
			nAttY.fSpeed(_nSpeed);
		}
		public function EnZ(_nSpeed : Float):Void {
			nAttZ.fSpeed(_nSpeed);
		}
		//////////////// Get	////////////////
		public function GnX():Float {
			return nAttX;
		}
		public function GnY():Float {
			return nAttY;
		}
		public function GnZ():Float {
			return nAttZ;
		}



		public function fRotationOrder1():Void {

		}
		
		public function fRotationOrder2():Void {

		}

		public function fRotationOrder3():Void {

		}

		////////////////////////////////////////////////////////
		////////////////////   Size   //////////////////////////
		////////////////////////////////////////////////////////

		private ease var nAttWidth : Float;
		private ease var nAttHeight : Float;
		private ease var nAttLength : Float;

		//////////////// Wrap ////////////////
		public function WnWidth(_nVal : Float):Void {
			nAttWidth = _nVal;
			nAttWidth.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (0 + 3));
		}
		public function WnHeight(_nVal : Float):Void {
			nAttHeight = _nVal;
			nAttHeight.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (1 + 3));
		}
		public function WnLength(_nVal : Float):Void {
			nAttLength = _nVal;
			nAttLength.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (2 + 3));
		}
		//////////////// TO	////////////////
		public function TnWidth(_nVal : Float):Void {
			nAttWidth.fTo(_nVal);
			nAttMove = nAttMove | (1 << (0 + 3));
		}
		public function TnHeight(_nVal : Float):Void {
			nAttHeight.fTo(_nVal);
			nAttMove = nAttMove | (1 << (1 + 3));
		}
		public function TnLength(_nVal : Float):Void {
			nAttLength.fTo(_nVal);
			nAttMove = nAttMove | (1 << (2 + 3));
		}

		//////////////// Move	////////////////
		public function MnWidth(_nVal : Float):Void {
			nAttWidth.fTo(nAttWidth + _nVal);
			nAttMove = nAttMove | (1 << 0);
		}
		public function MnHeight(_nVal : Float):Void {
			nAttHeight.fTo(nAttHeight + _nVal);
			nAttMove = nAttMove | (1 << 1);
		}
		public function MnLength(_nVal : Float):Void {
			nAttLength.fTo(nAttLength + _nVal);
			nAttMove = nAttMove | (1 << 2);
		}
		//////////////// Limit	////////////////
		public function LnWidth(_nVal : Float):Void {
			nAttWidth.fLimit(_nVal);
		}
		public function LnHeight(_nVal : Float):Void {
			nAttHeight.fLimit(_nVal);
		}
		public function LnLength(_nVal : Float):Void {
			nAttLength.fLimit(_nVal);
		}

		//////////////// Ease ////////////////
		public function EnWidth(_nSpeed : Float):Void {
			nAttWidth.fSpeed(_nSpeed);
		}
		public function EnHeight(_nSpeed : Float):Void {
			nAttHeight.fSpeed(_nSpeed);
		}
		public function EnLength(_nSpeed : Float):Void {
			nAttLength.fSpeed(_nSpeed);
		}
		//////////////// Global	////////////////
		public function GnWidth():Float {
			return nAttWidth;
		}
		public function GnHeight():Float {
			return nAttHeight;
		}
		public function GnLength():Float {
			return nAttLength;
		}


		////////////////////////////////////////////////////////
		//////////////////// Rotation //////////////////////////
		////////////////////////////////////////////////////////

		//////////////// Wrap ////////////////
		public function WnRoll(_nVal : Float):Void {
			nAttRoll = _nVal;
			nAttRoll.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (0 + 6));
		}
		public function WnPitch(_nVal : Float):Void {
			nAttPitch = _nVal;
			nAttPitch.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (1 + 6));
		}
		public function WnYaw(_nVal : Float):Void {
			nAttYaw = _nVal;
			nAttYaw.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (2 + 6));
		}
		//////////////// TO	////////////////
		public function TnRoll(_nVal : Float):Void {
			nAttRoll.fTo(_nVal);


			nAttMove = nAttMove | (1 << (0 + 6));
		}
		public function TnPitch(_nVal : Float):Void {
			nAttPitch.fTo(_nVal);
			nAttMove = nAttMove | (1 << (1 + 6));
		}
		public function TnYaw(_nVal : Float):Void {
			nAttYaw.fTo(_nVal);
			nAttMove = nAttMove | (1 << (2 + 6));
		}

		//////////////// Move	////////////////
		public function MnRoll(_nVal : Float):Void {
			nAttRoll.fTo(nAttRoll + _nVal);
			nAttMove = nAttMove | (1 << 0);
		//	oQuaternion.fRoll(nAttRoll);
		}
		public function MnPitch(_nVal : Float):Void {
			nAttPitch.fTo(nAttPitch + _nVal);
			nAttMove = nAttMove | (1 << 1);
		//	oQuaternion.fYaw(nAttPitch);
		}
		public function MnYaw(_nVal : Float):Void {
			nAttYaw.fTo(nAttYaw + _nVal);
			nAttMove = nAttMove | (1 << 2);
		//	oQuaternion.fYaw(nAttYaw);
		}
		//////////////// Limit	////////////////
		public function LnRoll(_nVal : Float):Void {
			nAttRoll.fLimit(_nVal);
		}
		public function LnPitch(_nVal : Float):Void {
			nAttPitch.fLimit(_nVal);
		}
		public function LnYaw(_nVal : Float):Void {
			nAttYaw.fLimit(_nVal);
		}
		//////////////// Ease ////////////////
		public function EnRoll(_nSpeed : Float):Void {
			nAttRoll.fSpeed(_nSpeed);
		}
		public function EnPitch(_nSpeed : Float):Void {
			nAttPitch.fSpeed(_nSpeed);
		}
		public function EnYaw(_nSpeed : Float):Void {
			nAttYaw.fSpeed(_nSpeed);
		}
		//////////////// Global	////////////////
		public function GnRoll():Float {
			return nAttRoll;
		}
		public function GnPitch():Float {
			return nAttPitch;
		}
		public function GnYaw():Float {
			return nAttYaw;
		}



		////////////////////////////////////////////////////////
		/////////////////// Brightness /////////////////////////
		////////////////////////////////////////////////////////

		//////////////// Wrap ////////////////
		public function WnRed(_nVal : Float):Void {
			nAttRed = _nVal;
			nAttRed.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (0 + 9));
		}
		public function WnBlue(_nVal : Float):Void {
			nAttBlue = _nVal;
			nAttBlue.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (1 + 9));
		}
		public function WnGreen(_nVal : Float):Void {
			nAttGreen = _nVal;
			nAttGreen.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (2 + 9));
		}
		public function WnAlpha(_nVal : Float):Void {
			nAttAlpha = _nVal;
			nAttAlpha.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (3 + 9));
		}
		/*
		public function WnBright(_nVal : Float):Void {
			nAttBright = _nVal;
			nAttBright.fTo(_nVal);
			nAttWrap = nAttWrap | (1 << (4 + 9));
		}*/

		//////////////// TO	////////////////
		public function TnRed(_nVal : Float):Void {
			nAttRed.fTo(_nVal);
			nAttMove = nAttMove | (1 << (0 + 9));
		}
		public function TnBlue(_nVal : Float):Void {
			nAttBlue.fTo(_nVal);
			nAttMove = nAttMove | (1 << (1 + 9));
		}
		public function TnGreen(_nVal : Float):Void {
			nAttGreen.fTo(_nVal);
			nAttMove = nAttMove | (1 << (2 + 9));
		}
		public function TnAlpha(_nVal : Float):Void {
			nAttAlpha.fTo(_nVal);
			nAttMove = nAttMove | (1 << (2 + 9));
		}
		/*
		public function TnBright(_nVal : Float):Void {
			nAttBright.fTo(_nVal);
			nAttMove = nAttMove | (1 << (2 + 9));
		}*/
		//////////////// Ease ////////////////
		public function EnRed(_nSpeed : Float):Void {
			nAttRed.fSpeed(_nSpeed);
		}
		public function EnBlue(_nSpeed : Float):Void {
			nAttBlue.fSpeed(_nSpeed);
		}
		public function EnGreen(_nSpeed : Float):Void {
			nAttGreen.fSpeed(_nSpeed);
		}
		public function EnAlpha(_nSpeed : Float):Void {
			nAttAlpha.fSpeed(_nSpeed);
		}
		/*
		public function EnBright(_nSpeed : Float):Void {
			nAttBright.fSpeed(_nSpeed);
		}*/

		//////////////// Global	////////////////
		public function GnRed():Float {
			return nAttRed;
		}
		public function GnBlue():Float {
			return nAttBlue;
		}
		public function GnGreen():Float {
			return nAttGreen;
		}
		public function GnAlpha():Float {
			return nAttAlpha;
		}

		////////////////	////////////////

		//////////////////////////////
		public function fApplyColor():Void {

				nAttX.fStep();
				nAttY.fStep();
				nAttZ.fStep();

				nAttWidth.fStep();
				nAttHeight.fStep();
				nAttLength.fStep();

				nAttRed.fStep();
				nAttGreen.fStep();
				nAttBlue.fStep();
				nAttAlpha.fStep();

				nAttRoll.fStep();
				nAttYaw.fStep();
				nAttPitch.fStep();
				
				
				oQuaternion.fReset();

				if(hRotateOrder == eRotateOrder.RollYawPitch){
					oQuaternion.fRoll(nAttRoll);
					oQuaternion.fYaw(nAttYaw);
					oQuaternion.fPitch(nAttPitch * -1)
				}else{
					oQuaternion.fYaw(nAttYaw);
					oQuaternion.fPitch(nAttPitch * -1)
					oQuaternion.fRoll(nAttRoll);
				}
				

				
				oQuaternion.fCombine(oParent.oQuaternion);
				
				
				
				
				// GZ::Attribute::Dlg_fRotationOrder1_r_void_p_No::Dlg(this, &GZ::cAttribute::wRotationOrder2);
				//dRotationOrder = fRotationOrder2;
				
				///dRotationOrder();
		}





		override public function  fApplyPos():Void {

			/*
			nGAttX = nAttX;
			nGAttY = nAttY ;
			nGAttZ = nAttZ ;
			var x : Float = nGAttX * oParent.nGAttWidth;
			var y : Float = nGAttY * oParent.nGAttHeight;
			var z : Float = nGAttZ * oParent.nGAttLength;
			var _nYaw : Float = oParent.nGAttYaw;
			var _nPitch : Float =  oParent.nGAttPitch;
			var _nRoll : Float = oParent.nGAttRoll;
			//////// Rotation /////////
			var _nTx : Float = (x * Math.fCos(_nYaw)) - (z * Math.fSin(_nYaw));
			var _nTz : Float = (x * Math.fSin(_nYaw)) + (z * Math.fCos(_nYaw));
			var _nTy : Float = (y * Math.fCos(_nPitch)) - (_nTz * Math.fSin(_nPitch));
			z = (y * Math.fSin(_nPitch) * -1) - (_nTz * Math.fCos(_nPitch));
			x = (_nTx * Math.fCos(_nRoll)) - (_nTy * Math.fSin(_nRoll));
			y = (_nTx * Math.fSin(_nRoll)) + (_nTy * Math.fCos(_nRoll));
			///////////////////////
			nGAttX = x + oParent.nGAttX;
			nGAttY = y + oParent.nGAttY;
			nGAttZ = z + oParent.nGAttZ;
			*/
			
			
			oGblPt.nX = nAttX * oParent.nGAttWidth;
			oGblPt.nY = nAttY * oParent.nGAttHeight;
			oGblPt.nZ = nAttZ * oParent.nGAttLength;
			
			oGblPt.fRotate(oParent.oQuaternion);
			
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
			//nGAttBright = nAttBright + oParent.nGAttBright;
		}

	}
}
