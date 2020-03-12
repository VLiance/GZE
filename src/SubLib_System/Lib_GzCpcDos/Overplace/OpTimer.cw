package  { 

	import GZ.Sys.Timer;
	import GZ.File.Resource;

	
	public class OpTimer overplace Timer {
		
		
		public var nConterStart : UInt64;
		public var nPCFreq : Float; //Flaot64?
		
		
		override   function fStart() : Void { //Return the full path with exe name
			
			Debug.fTrace("\nTimer Start ! \n");
			nConterStart = 0;
		}
		
			
		override   function fGet() : Float { //Return the full path with exe name
			
			Debug.fTrace("\nTimer Get ! \n");
			nConterStart+= 10000;
			return nConterStart;
		}

		
	}
}

