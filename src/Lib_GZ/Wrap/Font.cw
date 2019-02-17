//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {
	
	import GZ.File.RcFont;
	import GZ.File.Font.CharData;
	
	public class Font  {
			
		public unit uRectPack {
			nId : Int;
			nW : Int16;
			nH : Int16;
			nX : Int16;
			nY : Int16;
			nWasPacked : Bool;
		} 
	
		public unit uCharData {
			nX : Int16;
			nY : Int16;
			nW : Int16;
			nH : Int16;
			rRect : uRectPack;
			nHoriAdvance : Int16;
            nHoriBeringX : Int16;
            nHoriBeringY : Int16;
		} 
		
		pure public function fGetCharData( _oCharData : CharData ):Void;
		pure public function fOpen(_oRc : RcFont): Int;
		pure public function fDelete(_oRc : RcFont): Void;
		pure public function fGetKernAdvance(_oRc : RcFont, _nCh1 : Int, _nCh2 : Int):Int;

	}
	
	
	
	
	

}