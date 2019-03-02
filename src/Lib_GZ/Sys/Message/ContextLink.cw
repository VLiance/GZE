
#skipContent
package  { 

	import GZ.Sys.Context;
	import GZ.Sys.Window;
	import GZ.Sys.ContextHandle;
	import GZ.Sys.Message.ContextCreated;
	import GZ.Base.Dim;
	import GZ.Base.Pt;
	
	public overclass ContextLink extends ThreadMsg {
				
		public var bGpuDraw : Bool = false;
		
		public var sName : String;
		public var bTransparent : Bool = false;
		public var bBorder : Bool = false;
		public var hBorder : Window.eWinBorder;
		
		public var oHandle : ContextHandle;
		
		public var oDim : Dim;
		public var oPos : Pt;
		
		public var gFrom : Gate<ThreadMsg>;
		
		
		public var sIcon : String = "Test";
		public var bCloseBox : Bool = true;
		
		public var nHandleId : UIntX;
		
		public function ContextLink(_sName : String, _oPos : Pt, _oDimention : Dim, _bGpuDraw : Bool = false):Void {
			sName = _sName;
			oPos = _oPos;
			oDim = _oDimention;
			bGpuDraw = _bGpuDraw;
		}
		
		
		override public function fRun():Void {
			Context.fAddLink(this);
			oHandle = new ContextHandle(this);
			
			//fCreateContext();
			//fIniDrawZone();
			//Debug.fTrace1("Send !!! :oHandle.aDrawZone " );
			var _oContextCreated : ContextCreated = new ContextCreated(nHandleId, oHandle.gAction, oHandle.aHandleDrawZone, bGpuDraw);
			fSendMsg(_oContextCreated);
		}
		
		public function fCreateContext():Void {
			Debug.fTrace("Not Implemented!!! : " );
		}
		
		public function fIniDrawZone():Void {
			Debug.fTrace("fIniDrawZone Implemented!!! : " );
		}
		

		public function fSendMsg(_oMsg : ThreadMsg):Void {
			gFrom.fSend(_oMsg);
		}
		 
		
	}
}