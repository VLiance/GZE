
package  { 

	
	public class MousePos extends ThreadMsg {
		public var nPosX : Int = 4;
		public var nPosY : Int = 3;

		public function MousePos():Void {

		}
		
		override public function fRun():Void {
			//Debug.fTrace1("MousePos!!! : " + nPosX);
		}
		
		
	}
}