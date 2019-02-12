
#skipContent
package  { 

	import GZ.Sys.ContextHandle;
	import GZ.Sys.Context;
		
	public class BlitComplete extends ThreadMsg {
		
		public var nDrawZoneAdr : UIntX; //When bliting require flipping buffer, define new drawzone

		public function BlitComplete(_nDrawZoneAdr : UIntX = 0):Void { //0 = no change
			nDrawZoneAdr = _nDrawZoneAdr;
		}
		
		override public function fRun():Void {
			var _oContext : Context = parent;
		//	Debug.fTrace1("BlitComplete ");
			//_oContext.fAddLink();
			_oContext.fBlitComplete(nDrawZoneAdr);
		}
		
		
	}
}