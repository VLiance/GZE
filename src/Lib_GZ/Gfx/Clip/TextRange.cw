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
	import GZ.File.RcFont;

	/**
	 * @author Maeiky
	 */

	public class TextRange extends Clip {

		public var oRc : RcFont;
		public var aLetter : Array<Letter>;
		public var nCursorX : Float = 0;

		public function TextRange(_oParent : Root, _oRc : RcFont, _nX: Float, _nY:Float, _sText : String = ""):Void {
			Clip(_oParent, _nX , _nY);

			oRc = _oRc;


			fAdd(_sText);
		}
		
		public function fAdd(_sText : String = ""):Void {
			/*
			var i : UInt = 0;
			_sText.fBegin();
			var _nPrevChar : UInt = 0;
			while(_sText.fNext()){
				
				nCursorX += oRc.fGetKernAdvance(_nPrevChar, _sText.nChar);
				
				var _nIntPosX : Int = nCursorX;
				var _oLetter : Letter =  new Letter(this, oRc, _nIntPosX, 0, _sText.nChar);
				aLetter[i] = _oLetter;
				_oLetter.WnRed(50);
				
				nCursorX += _oLetter.nAdvance;
				 _nPrevChar = _sText.nChar;
				  
				 
				 
				i++;
			}*/
		}
		
		public function fClear():Void {
			nCursorX = 0;
			aLetter.fClear();

			fClearChild();
		}
		
		
		
		
		
		
	}
}
