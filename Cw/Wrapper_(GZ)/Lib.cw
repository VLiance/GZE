//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 

	public class Lib  {
			
		public unit uScreen {
			rNext :  uScreen; // For linked list ONLY CPP Interpret
			nFreq : Int;
			
		}	
			
		public static var sDirExe: String;
        public static var sExeName: String;
        public static var sExeExt: String;
        public static var sExe: String;
        public static var sRcDir: String;

        public static var sDirRcFiles: String;
        public static var sDirRcEmbed: String;
	
		
		public function get():Int;
		
		static function get_Monitor():uScreen;
	}
}

