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
	import GZ.Gfx.Vector.Line;
	import GZ.Gfx.Vector.VectorShape;

	/**
	 * @author Maeiky
	 */
	public class Box extends VectorShape {

		//public var nSize : Float;
	//	public var oShape : Shape;
	//	public var aLine : Array<Line>;

		
//		public var oLine : Line;

		public function Box( _nX : Float, _nY: Float,  _nWidth : Float, _nHeight: Float, _nLineSize : Float = 1):Void {
			<cpp>
			oItf = ((cRoot*)parent.get())->oItf;
			</cpp>
			vPos.nX = _nX;
			vPos.nY = _nY;
			

			var _oCenter  : Pt<Float> = new Pt<Float>(_nWidth/2, _nHeight/2);
			var _oShape:Shape = new Shape(this, 0,0,0,false);
		
			var _oPtTL : PtA = new PtA(0 , 0 );
			var _oPtTR : PtA = new PtA(_nWidth, 0 );
			var _oPtBR : PtA = new PtA(_nWidth , _nHeight );
			var _oPtBL : PtA = new PtA(0, _nHeight );
			
			_oShape.fAddPt(_oPtTL, _oCenter);
			_oShape.fAddPt(_oPtTR, _oCenter);
			_oShape.fAddPt(_oPtBR, _oCenter);
			_oShape.fAddPt(_oPtBL, _oCenter);
		
			VectorShape(parent, _nLineSize,_oShape );
			//VectorShape(parent, _nLineSize );
		}
		
	
			
		

	}
}
