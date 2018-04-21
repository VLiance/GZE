package  { 


	import GZ.Sys.System;
		

	<cpp>
	#include "Lib_GZ/SysUtils/EmscHeader.h"
	</cpp>
/*
	<cpp_static_h>
	val oWindow = val::global("Null");
	</cpp_static_h>
*/
	
	public extension OpSystem overplace System  {
		
		
		
		
		public function OpSystem():Void{
			System();
		}
		
		static function fSleep(_nMilliseconds : UInt = 1):Void {
		}

		static function fIni(_nInstance:UInt, _sCommandLine:String, _nShowCmd : UInt):Void{

			
		}

	

		
		
		static function fExit():Void;
		
	}
}