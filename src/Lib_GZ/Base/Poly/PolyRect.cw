//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;

	import GZ.Base.Pt;
	import GZ.Base.Vec2;
	import GZ.Base.Poly4;
	import GZ.Base.Dim;

	/**
	 * @author Maeiky
	 */
	public class Rect extends Poly4 {

		public function Rect(_oPos : Pt, _oDim : Dim):Void  {

			var _oTL : Pt = new Pt(_oPos.nX, _oPos.nY);
			var _oTR : Pt = new Pt(_oPos.nX + _oDim.nWidth, _oPos.nY);
			var _oBR : Pt = new Pt(_oPos.nX + _oDim.nWidth, _oPos.nY + _oDim.nHeight);
			var _oBL : Pt = new Pt(_oPos.nX, _oPos.nY + _oDim.nHeight);
			Poly4(_oTL, _oTR, _oBR, _oBL);
		}

		public function fFlipX():Void  {
			var _nTempX : Float = oPt1.nX;
			oPt1.nX = oPt2.nX;
			oPt2.nX = _nTempX;
			_nTempX = oPt4.nX;
			oPt4.nX = oPt3.nX;
			oPt3.nX = _nTempX;
		}
		public function fFlipY():Void  {
			var _nTempY : Float = oPt1.nY;
			oPt1.nY = oPt3.nY;
			oPt3.nY = _nTempY;
			_nTempY = oPt2.nY;
			oPt2.nY = oPt4.nY;
			oPt4.nY = _nTempY;
		}
		
		public function fFlipD():Void  {
			var _nTempX : Float = oPt1.nX;
			oPt1.nX = oPt1.nY;
			oPt1.nY = _nTempX;
			
			_nTempX = oPt2.nX;
			oPt2.nX = oPt2.nY;
			oPt2.nY = _nTempX;
			
			_nTempX = oPt3.nX;
			oPt3.nX = oPt3.nY;
			oPt3.nY = _nTempX;
			
			_nTempX = oPt4.nX;
			oPt4.nX = oPt4.nY;
			oPt4.nY = _nTempX;

		}
		
		
		/*
		public function fFlipRD():Void  {
			var _oTempPt : Pt = oPt2;
			oPt2 = oPt4;
			oPt4 = _oTempPt;
		}*/

	}
}
