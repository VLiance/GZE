//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Gfx.Object;
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
	import GZ.Gfx.Vector.HalfLine;

	/**
	 * @author Maeiky
	 */
	public class Line extends Object {

		
		public var oPt1 : PtA;
		public var oPt2 : PtA;
		
		public var oHLine1 : HalfLine;
		public var oHLine2 : HalfLine;


		public function Line( _oParent : Root, _oPt1 : PtA,  _oPt2 : PtA):Void {
				
			Object(_oParent, 0 , 0);
			
			oPt1 = _oPt1;
			oPt2 = _oPt2;
			
			oHLine1 = new HalfLine(this, oPt1, oPt2);
		//	oHLine2 = new HalfLine(this, oPt1, oPt2);
	
			
			

		}
		
		
		
	
		override public function fUpdateChildToParent():Void {

			//fApplyPos();
		}
		




	}
}
