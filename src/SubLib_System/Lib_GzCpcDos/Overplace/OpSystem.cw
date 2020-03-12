package  { 


	import GZ.Sys.System;

	
	public class OpSystem overplace System  {
		
		public function OpSystem():Void{
			System();
		}
		 
		override function fSleep(_nMilliseconds : UInt = 1):Void {
			
		}

		
		 override function fDetectGpu():Bool {
			
			return false;
		}

		
		
		override function fExit():Void;
		
	}
}