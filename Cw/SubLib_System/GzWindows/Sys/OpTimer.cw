package  { 

	import GZ.Sys.Timer;
	import GZ.File.Resource;
	
	<cpp_h>
		#include "Lib_GZ_Platform/Windows/MainHeader.h"
	</cpp_h>
	
	
	public class OpTimer overplace Timer {
		
		
		public var nConterStart : UInt64;
		public var nPCFreq : Float; //Flaot64?
		
		
		public   function fStart() : Void { //Return the full path with exe name
			
			<cpp>
				LARGE_INTEGER li;
				if(!QueryPerformanceFrequency(&li)){
					//"QueryPerformanceFrequency failed!\n"
				}

				//PCFreq = double(li.QuadPart)/1000000.0;
				nPCFreq = float(li.QuadPart)/1000.0; //millisecond

				QueryPerformanceCounter(&li);
				nConterStart = li.QuadPart;
			</cpp>		
		}
		
			
		public   function fGet() : Float { //Return the full path with exe name
			
			<cpp>
				LARGE_INTEGER li;
				QueryPerformanceCounter(&li);
				return float(li.QuadPart-nConterStart)/nPCFreq;
			</cpp>
		}

		
	}
}

