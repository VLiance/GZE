package  { 
	

	import GZ.Debug.Debug;

	public class OpDebug overplace Debug  {

		public function OpDebug():Void{
			Debug();
		}
		
		override  function fTrace(_sValue:String):Void {
			<cpp>
			    printf("T:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
		

		override  function fInfo(_sValue:String):Void {
			<cpp>
			    printf("I:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
		
		override  function fWarning(_sValue:String):Void{
			<cpp>
			    printf("W:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override  function fError(_sValue:String):Void{
			<cpp>
			    printf("E:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override  function fPass(_sValue:String):Void{
			<cpp>
			    printf("P:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override  function fFatal(_sValue:String):Void{
			<cpp>
			    printf("F:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>>
		}

		
}