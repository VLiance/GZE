//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Face;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	/**
	 * @author Maeiky
	 */
	public class View extends Shape {
	

		public var oPtTL : PtA;
		public var oPtTR : PtA;
		public var oPtBR : PtA;
		public var oPtBL : PtA;
		

		public function View(  _nX: Float, _nY:Float, _nW: Float, _nH:Float):Void {
		
			Shape(parent, _nX , _nY, 4, false);
			hType = Root.eType.View;
			
			var _nCenterX :Float = 0;
			var _nCenterY :Float = 0;

			nWidth = _nW;
			nHeight = _nH;

			var _nBorder : Float = 0;


			var _oCenter  : Pt<Float> = new Pt<Float>(_nCenterX, _nCenterY);


			oPtTL = new PtA(0 - _nBorder, 0 -_nBorder);
			oPtTR = new PtA(nWidth  +_nBorder, 0 -_nBorder);
			oPtBR = new PtA(nWidth  +_nBorder, nHeight  +_nBorder);
			oPtBL = new PtA(0 -_nBorder, nHeight  +_nBorder);

			fAddPt(oPtTL, _oCenter);
			fAddPt(oPtTR, _oCenter);
			fAddPt(oPtBR, _oCenter);
			fAddPt(oPtBL, _oCenter);


			var _oPtSrc1 : Pt<Float> = new Pt<Float>( 0 , 0);
			var _oPtSrc2 : Pt<Float> = new Pt<Float>(nWidth  , 0);
			var _oPtSrc3 : Pt<Float> = new Pt<Float>( nWidth , nHeight );
			var _oPtSrc4 : Pt<Float> = new Pt<Float>(0 , nHeight);
			
			var _oSrc : Poly4 = new Poly4(_oPtSrc1, _oPtSrc2, _oPtSrc3, _oPtSrc4);

			fCreateFace(null, _oSrc);

		}


		public function fUpdate():Void {
			
		}



	}
}
