package  { 

	import GZ.Sys.Timer;
	import GZ.File.Resource;
	import GzCpcDos.Sys.OpContextHandle;
	

	public class OpTimer overplace Timer {
		
		
		public var nConterStart : UInt64;
		public var nPCFreq : Float; //Flaot64?
		
		
		public   function fStart() : Void { //Return the full path with exe name
			Debug.fTrace("\nTimer Start ! \n");
			nConterStart = 0;
		}
		
			
		public   function fGet() : Float { //Return the full path with exe name
			Debug.fTrace("\nTimer Get ! \n");
			nConterStart+= 10000;
			return nConterStart;
		}

		
	}
}

