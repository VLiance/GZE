package  { 

	//import GZ.SysGpuFunc;
	
	public overclass GpuInfo  {
		
		public static var nVersionMajor : UInt;
		public static var nVersionMinor : UInt;
		
		
		
		public function GpuInfo():Void {
			Debug.fTrace("--- GpuInfo Created!! ---");
		}
		
				
		public function fIniFunctions():Bool{
			Debug.fTrace("fIniFunctions: - fGetVersion Not Implemented -");
		}

		public function fGetVersion():Bool{
			Debug.fTrace("Gpu: - fGetVersion Not Implemented -");
		}
		


	}
}