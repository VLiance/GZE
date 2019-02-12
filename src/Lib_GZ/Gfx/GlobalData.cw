//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.
#skipContent

package  { 
	
//	import GZ.Lib;
	
	/**
	 * @author Maeiky
	 */	
	public class GlobalData {
		
		//use Global.uScreen;
		
		//Cast Large shape only onsed in CPP
		typedef tLS;  
		
		
		/*
		////TEMP/////TODO : use Global.uScreen;
		public unit uScreen {
			rScreen :  uScreen; // For linked list ONLY CPP Interpret
			nFreq : Int;
		}	
		////TEMP/////
		*/
		
		//public static var rFirstScreen : uScreen;
		
		private static var nID : Int = 0;
		private static var nTotalScreen : Int = 0;
		private static var nTest : Int;
		
		
		public function GlobalData() : Void {
			
		}
		
		
		public static function fGetId() : Void {	
			nID++;
			
			//Debug.fTrace3("Global Data : " +  nID )
			//return String(nID);
			
			
		}
		
		public static function fIni() : Void {	
			/*
			Debug.fTrace3("Global Data Ini " );
			rFirstScreen = Global.get_Monitor();
			//Debug.fTrace3("FirstFreq : " + rFirstScreen.nFreq );
			var _rNextScreen : uScreen = rFirstScreen;
			while (_rNextScreen != null) {
			
				Debug.fTrace2("--- Mon " + nTotalScreen + " ----");
				Debug.fTrace2("Freq : " + _rNextScreen.nFreq );
				Debug.fTrace2("-------------------");
				nTotalScreen++;
				_rNextScreen = _rNextScreen.rNext;
			}
			Debug.fTrace3("TotalScreen : " + nTotalScreen );
			*/
		}

		
	}
}