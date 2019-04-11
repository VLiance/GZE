package  { 
	

	import GZ.Sys.Debug;

	public extension OpDebug overplace Debug  {

		
		public function OpDebug():Void{
			Debug();
		}
			
	
		public function fTrace(_sValue:String):Void {
			<cpp>
			    printf("1:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
			
		public function fTrace2(_sValue:String):Void{
			<cpp>
			    printf("2:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		
		public function fTrace3(_sValue:String):Void{
			<cpp>
			    printf("3:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}

		public function fWarning(_sValue:String):Void{
			<cpp>
			    printf("W:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public function fError(_sValue:String):Void{
			<cpp>
			    printf("E:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public function fPass(_sValue:String):Void{
			<cpp>
			    printf("P:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public function fFatal(_sValue:String):Void{
			<cpp>
			    printf("F:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
}