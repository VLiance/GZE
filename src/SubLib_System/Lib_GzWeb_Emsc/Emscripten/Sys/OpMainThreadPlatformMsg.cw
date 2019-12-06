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
	
	<cpp_h>
		#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	</cpp_h>
	
	

	public class OpMainThreadPlatformMsg overplace MainThreadPlatformMsg {
	
			use Window.ePositioning;

		
		public function OpMainThreadPlatformMsg() : Void{
			//Debug.fTrace("--OpMainThreadPlatformMsg--");
			MainThreadPlatformMsg();
		}
		 
		 override public function fManageMessage():Void {
			gMainThreadGate.ExecuteAll();
		 }
		 
		override public function fRegisterContext(_gFrom : Gate<Context>, _oWindow : Window):Void {
			/*
			Debug.fTrace("RECTxxxx "  + _oWindow.vFrame.nX);
			Debug.fTrace("RECTyyyy"  + _oWindow.vFrame.nY);
			Debug.fTrace("RECTwww"  + _oWindow.vFrame.nWidth);
			Debug.fTrace("RECThhh"  + _oWindow.vFrame.nHeight);
		*/
			
		

//			ThreadMsg.fSend(new MsgCreateWindow("MonMessage!"));
			Debug.fTrace("Finsish CreateEmsc " );

			_gFrom.fContextRegistred(0, 0);
			///Debug.fTrace("Fok " );
		}
		
	
		
	}
}