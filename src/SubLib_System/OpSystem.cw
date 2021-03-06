﻿package  { 


	import GZ.Sys.System;

	<cpp>
		#include <windows.h>
	</cpp>

	public extension OpSystem overplace System  {
		
		public function OpSystem():Void{
			System();
		}
		
		static function fSleep(_nMilliseconds : UInt = 1):Void {
			<cpp>
			    Sleep(_nMilliseconds);
			</cpp>
		}

		static function fIni(_nInstance:UInt, _sCommandLine:String, _nShowCmd : UInt):Void{

			
		}

		
		static public function fDetectGpu():Bool {
			
			return true;
		}

		
		
		static function fExit():Void;
		
	}
}