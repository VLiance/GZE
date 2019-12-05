//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Triangle;
	import GZ.File.RcImg;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	import GZ.Sys.Interface.Context;
	import GZ.Gfx.Vector.HalfLine;

	/**
	 * @author Maeiky
	 */
	public class Line extends Clip {

		public var nSize : Float;
		
		public var oPt1 : PtA;
		public var oPt2 : PtA;
		
		public var oHLine1 : HalfLine;
		public var oHLine2 : HalfLine;
		
		public var nAngle : Float;


		public function Line( _oParent : Root, _oPt1 : PtA,  _oPt2 : PtA, _nSize : Float = 1):Void {
				
			nSize = _nSize;
				
			Clip(_oParent, 0 , 0);
			
			oPt1 = _oPt1;
			oPt2 = _oPt2;
			
			nAngle = Math.fATan2(oPt1.vPt.nY - oPt2.vPt.nY, oPt1.vPt.nX - oPt2.vPt.nX);
			/*
			if(nAngle > 3.1416*2.0) {
				nAngle -=  3.1416*2.0;
			}
			if(nAngle < 0) {
				nAngle +=  3.1416*2.0;
			}
			*/
			
			oHLine1 = new HalfLine(this, oPt1, oPt2, nSize, nAngle);
			oHLine2 = new HalfLine(this, oPt1, oPt2, nSize * -1, nAngle);

		}
		
		
		public function fSetCapL_Pos(_oLine : Line):Void {
			oHLine1.fSetCapL_Pos( _oLine.oHLine1);
			oHLine2.fSetCapL_Pos( _oLine.oHLine2);
		}
		
		
		public function fSetCapL(_nAngle : Float):Void {
			oHLine1.fSetCapL( _nAngle + Math.nR90 , nSize);
			oHLine2.fSetCapL( _nAngle + Math.nR90, nSize * -1);
		}
		public function fSetCapR(_nAngle : Float):Void{
			oHLine1.fSetCapR( _nAngle + Math.nR90, nSize);
			oHLine2.fSetCapR( _nAngle + Math.nR90, nSize * -1);
		}
		
		
	
		override public function fUpdateChildToParent():Void {

			//fApplyPos();
		}
		




	}
}
