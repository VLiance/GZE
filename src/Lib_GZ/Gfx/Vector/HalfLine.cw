//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Triangle;
	import GZ.File.RcImg;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	import GZ.Sys.Interface.Context;

	/**
	 * @author Maeiky
	 */
	public class HalfLine extends Shape {

	///	use Shape.uPoint;
	//	use Triangle.uPoint3D;


		public var aFile : CArray<Int, 1>;

		//public var oImage : Image;
/*
		public var rPtTL : Mapped<uPoint3D>;
		public var rPtTR : Mapped<uPoint3D>;
		public var rPtBR : Mapped<uPoint3D>;
		public var rPtBL : Mapped<uPoint3D>;
*/
		
		public var nTest : Int;
		

		public var oPtTL : PtA;
		public var oPtTR : PtA;
		public var oPtBR : PtA;
		public var oPtBL : PtA;
		
		
		
		public var oPt1 : PtA;
		public var oPt2 : PtA;

		//public easeOut var nEase :Int;


		public function HalfLine( _oParent : Root, _oPt1 : PtA,  _oPt2 : PtA, _nSize : Float, _nAngle: Float):Void {
			Shape(_oParent, 0 , 0, 4, false);
			hType = Root.eType.Line;
			
			oPt1 = _oPt1;
			oPt2 = _oPt2;
			
			
			oRc = new RcImg("");
			nWidth = 100;
			nHeight = 100;
			
			
			var _nBorder : Float = 0;

/*
			if(_oSrcRegion == 0){

				rPtTL = addPoint(0 - _nBorder, 0 -_nBorder,                _nCenterX, _nCenterY);
				rPtTR = addPoint(nWidth  +_nBorder, 0 -_nBorder,         _nCenterX, _nCenterY);
				rPtBR = addPoint(nWidth  +_nBorder, nHeight  +_nBorder, _nCenterX, _nCenterY);
				rPtBL = addPoint(0 -_nBorder, nHeight  +_nBorder,        _nCenterX, _nCenterY);
			}else{

				rPtTL = addPoint(_oSrcRegion.oPt1.nX, _oSrcRegion.oPt1.nY,                0, 0);
				rPtTR = addPoint(_oSrcRegion.oPt2.nX, _oSrcRegion.oPt2.nY,         0, 0);
				rPtBR = addPoint(_oSrcRegion.oPt3.nX, _oSrcRegion.oPt3.nY,     0, 0);
				rPtBL = addPoint(_oSrcRegion.oPt4.nX, _oSrcRegion.oPt4.nY,        0, 0);
			}
*/

			var _oCenter  : Pt<Float> = new Pt<Float>(0, 0);
			
			
			oPtTL = oPt1;
			oPtTR = oPt2;
			oPtBR = new PtA(oPt2.vPt.nX, oPt2.vPt.nY);
			oPtBL = new PtA(oPt1.vPt.nX, oPt1.vPt.nY));
			 
			
		
			_nAngle += Math.nR90;

			oPtBR.vPt.fSetDist(oPtBR.vPt, _nAngle, _nSize);
			oPtBL.vPt.fSetDist(oPtBL.vPt, _nAngle, _nSize);

			
			
			fAddPt(oPtTL, _oCenter);
			fAddPt(oPtTR, _oCenter);
			fAddPt(oPtBR, _oCenter);
			fAddPt(oPtBL, _oCenter);
			
			var _oSrc : Poly4;
	
	
			var _nOff_X : Float = oRc.vOffset.nX; //TODO maybe calculate offset dynamicly after
			var _nOff_Y : Float = oRc.vOffset.nY; //TODO maybe calculate offset dynamicly after
			
		//	Debug.fWarning("_nOff_X: " + _nOff_X + "  _nOff_Y:"  +_nOff_Y );
			
			
			//_nOff_X = 30;
			//_nOff_Y = 0;
			

			var _oPtSrc1 : Pt<Float> = new Pt<Float>(_nOff_X + 0 - _nBorder     , _nOff_Y + 0 - _nBorder);
			var _oPtSrc2 : Pt<Float> = new Pt<Float>(_nOff_X + nWidth  +_nBorder, _nOff_Y + 0 -_nBorder);
			var _oPtSrc3 : Pt<Float> = new Pt<Float>(_nOff_X + nWidth  +_nBorder, _nOff_Y + nHeight +_nBorder);
			var _oPtSrc4 : Pt<Float> = new Pt<Float>(_nOff_X + 0 - _nBorder	    , _nOff_Y + nHeight  + _nBorder);								
							
			_oSrc  = new Poly4(_oPtSrc1, _oPtSrc2, _oPtSrc3, _oPtSrc4);

			
			
			
			fCreateFace(oRc, _oSrc);
			
			//fCreateLines();
			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, 0 - _nBorder, 0 - _nBorder,   nWidth  +_nBorder, 0 -_nBorder,  nWidth  +_nBorder, nHeight +_nBorder,  0 - _nBorder, nHeight  + _nBorder );
			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, 0 - _nBorder, 0 - _nBorder,   nWidth  +_nBorder, 0 -_nBorder,  nWidth  +_nBorder, nHeight +_nBorder,  0 - _nBorder, nHeight  + _nBorder );
			oFace.oGpuObj.fSetImg(oRc);

		}
		
			
		public function fSetCapL_Pos(_oLine : HalfLine):Void {
			oPtBL.vPt.nX = _oLine.oPtBR.vPt.nX;
			oPtBL.vPt.nY = _oLine.oPtBR.vPt.nY;
		}
		
			
		public function fSetCapL(_nAngle : Float, _nSize : Float ):Void {
			//oPtBR.vPt.fSetDist(oPt2.vPt, _nAngle, _nSize);
			oPtBL.vPt.fSetDist(oPt1.vPt, _nAngle, _nSize);
		}
		public function fSetCapR(_nAngle : Float, _nSize : Float ):Void {
			oPtBR.vPt.fSetDist(oPt2.vPt, _nAngle, _nSize);
			//oPtBL.vPt.fSetDist(oPt1.vPt, _nAngle, _nSize);
		}
		
		/*
		public function fSetPos(_oPt : PtA, _oPtFrom : PtA , _nAngle : Float, _nDistance : Float):Void {
			Debug.fWarning("Bef" +_oPt.vPt.nX);
			_oPt.vPt.nX = _oPtFrom.vPt.nX + Math.fCos(_nAngle) * _nDistance;
			_oPt.vPt.nY = _oPtFrom.vPt.nY + Math.fSin(_nAngle) * _nDistance;
			
			Debug.fWarning("aft" + _oPt.vPt.nX);
			Debug.fWarning(" Math.fSin(_nAngle)" +  Math.fSin(_nAngle));
			Debug.fWarning(" Math.fCos(_nAngle)" +  Math.fCos(_nAngle));
			Debug.fWarning("_nDistance" +  _nDistance);
		}
		*/


		override public function fUpdateChildToParent():Void {

			//fApplyPos();
		}
		




	}
}
