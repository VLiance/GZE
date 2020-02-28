package  { 
	

	import GZ.Debug.Debug;

	public class OpDebug overplace Debug  {

		public function OpDebug():Void{
			Debug();
		}
		
		public override  function fTrace(_sValue:String):Void {
			<cpp>
			    printf("T:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
		

		public override  function fInfo(_sValue:String):Void {
			<cpp>
			    printf("I:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
		
		public override  function fWarning(_sValue:String):Void{
			<cpp>
			    printf("W:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public override  function fError(_sValue:String):Void{
			<cpp>
			    printf("E:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public	override  function fPass(_sValue:String):Void{
			<cpp>
			    printf("P:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		public override  function fFatal(_sValue:String):Void{
			<cpp>
			    printf("F:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>>
		}

		
}