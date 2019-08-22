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
	import GZ.File.Font.CharData;

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
		
		
		public pure function fGetTextWidth(_oRc : RcFont, _sText : String = ""):Float {
		
			_oRc.fCpuLoad(); //TODO Better way!
			
			var i : UInt = 0;

		    var _nCursorX : Float = 0;
			
			var _nLength : UInt = _sText.nSize;

			while(i < _nLength){
				
				//_nCursorX += oRc.fGetKernAdvance(_nPrevChar, _sText[i]);
				var _oChar : CharData = _oRc.fGetCharRect(_sText[i]); 
				_nCursorX += _oChar.nHoriAdvance;

				i++;
			}
			return _nCursorX;
		}
		
		
		public function fAdd(_sText : String = ""):Void {
			
			var i : UInt = 0;
			//_sText.fBegin();
			
			var _nLength : UInt = _sText.nSize;
			var _nPrevChar : UInt = 0;
			//while(_sText.fNext()){
			
			while(i < _nLength){
				
				//nCursorX += oRc.fGetKernAdvance(_nPrevChar, _sText.nChar);
				nCursorX += oRc.fGetKernAdvance(_nPrevChar, _sText[i]);
				
				var _nIntPosX : Int = nCursorX;
			///	var _oLetter : Letter =  new Letter(this, oRc, _nIntPosX, 0, _sText.nChar);
				var _oLetter : Letter =  new Letter(this, oRc, _nIntPosX, 0, _sText[i]);
				aLetter[i] = _oLetter;
				//_oLetter.vColor.nRed = 1.0;

				//_oLetter.WnRed(50);
				
				nCursorX += _oLetter.nAdvance;
				// _nPrevChar = _sText.nChar;
				 _nPrevChar =_sText[i];
				  /*
				  <cpp>
				  printf("\n %d ", _sText(i) );
				  </cpp>
				  */
				 //Debug.fTrace("Letter " +  _sText[i] );
				 
				 
				i++;
			}
		}
		
		public function fClear():Void {
			nCursorX = 0;
			aLetter.fClear();

			fClearChild();
		}
		
		
		
		
		
		
	}
}
