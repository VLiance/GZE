//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Attribute;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Clip.Letter;
	import GZ.Gfx.Clip.TextRange;
	import GZ.File.RcFont;

	/**
	 * @author Maeiky
	 */

	public class Text extends Clip {

		public var oRc : RcFont;
		public var aRange : Array<TextRange>;
		public var oCurrRange : TextRange;

		public function Text(_oParent : Root, _oRc : RcFont, _nX: Float, _nY:Float, _sText : String = ""):Void {
			var _nSnapPosX : Int = _nX;
			var _nSnapPosY : Int = _nY;
			
			Object(_oParent, _nSnapPosX , _nSnapPosY);
			oRc = _oRc;
			
			
		
			oCurrRange =  new TextRange(this, _oRc, 0, 0, _sText);
			aRange.fPush(oCurrRange);
			
			
		}
		
		public function fAdd(_sText : String = ""):Void {
			oCurrRange.fAdd(_sText);
		}
		
		
		
	}
}
