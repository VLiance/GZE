
package  { 

	import GZ.Sys.Context;
	import GZ.Sys.Window;
	import GZ.Sys.ContextHandle;
	import GZ.Base.Dim;
	import GZ.Base.Pt;
	
	public class ContextCreated extends ThreadMsg {
				
		public var nHandleId : UIntX;
		public var nDrawZoneAdr : UIntX;
		public var bGpuDraw : Bool;
		public var gContextHandle : Gate<ThreadMsg>;
		
		
		public function ContextCreated(_nHandleId : UInt, _gContextHandle: Gate<ThreadMsg>, _nDrawZoneAdr : UIntX, _bGpuDraw : Bool = false):Void {
			nHandleId = _nHandleId;
			gContextHandle = _gContextHandle;
			nDrawZoneAdr = _nDrawZoneAdr;
			bGpuDraw = _bGpuDraw;
		}
		
		override public function fRun():Void {
		
			var _oContext : Context = parent;
			_oContext.fCompleteContext(this);
		}
		
		
		
	}
}