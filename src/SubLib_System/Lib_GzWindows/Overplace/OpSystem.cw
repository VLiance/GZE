package  { 


	import GZ.Sys.System;

	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	
	public class OpSystem overplace System  {
		
		public function OpSystem():Void{
			System();
		}
		 
		 function fSleep(_nMilliseconds : UInt = 1):Void {
			<cpp>
				//GZ_printf("\nSleep");
			    Sleep(_nMilliseconds);
			</cpp>
		}
/*
		static function fIni(_nInstance:UInt, _sCommandLine:String, _nShowCmd : UInt):Void{	
		}
*/
		
		 public function fDetectGpu():Bool {
			
			return true;
		}

		
		
		 function fExit():Void;
		
	}
}