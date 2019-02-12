
#skipContent
package  { 

	import GZ.Sys.ContextHandle;
	import GZ.Sys.Message.BlitComplete;
		
	public class Blit extends ThreadMsg {
		public var nPosX : Int = 4;
		public var nPosY : Int = 3;

		public function Blit():Void {

		}
		
		override public function fRun():Void {
			//Debug.fTrace1("MousePos!!! : " + nPosX);
			var _oHandle : ContextHandle = parent;
	
			
			if(_oHandle.oLink.bGpuDraw){
				_oHandle.fGpuBlit();
			}else{
				_oHandle.fBlit();
			}
			var _oBlitComplete : BlitComplete = new BlitComplete();
			_oHandle.oLink.gFrom.fSend(_oBlitComplete);
		}
		
		
	}
}