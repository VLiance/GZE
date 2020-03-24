package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.MainThreadPlatformMsg;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;
	import GZ.Base.Rect;
	//import GzWindows.Sys.Message.OpContextLink;
	


	public class OpMainThreadPlatformMsg overplace MainThreadPlatformMsg {
	
			use Window.ePositioning;

		
		public function OpMainThreadPlatformMsg() : Void{
		//	Debug.fTrace("--OpMainThreadPlatformMsg--");
			MainThreadPlatformMsg();
		}
		 
		 override public function fManageMessage():Void {
			gMainThreadGate.ExecuteAll();

		 }
		 
		override public function fRegisterContext(_gFrom : Gate<Context>, _oWindow : Window):Void {

			var _nHandleId : UIntX = 0;
			var _nWinHandleId : UIntX = 0;
	

			var _sName : String = _oWindow.sName;

			var _nX : UInt = _oWindow.vFrame.nX;
			var _nY : UInt = _oWindow.vFrame.nY;
			
			<cpp>
			_nHandleId = CpcDos->Create_Context(_oWindow->vFrame.nWidth, _oWindow->vFrame.nHeight);
			</cpp>

//			ThreadMsg.fSend(new MsgCreateWindow("MonMessage!"));
			Debug.fTrace("Finsish Create, ContextId: " + _nHandleId + " width: " + _oWindow.vFrame.nWidth + " height: " + _oWindow.vFrame.nHeight);

			_gFrom.fContextRegistred(_nHandleId, _nWinHandleId);
		}
		
	
		
	}
}