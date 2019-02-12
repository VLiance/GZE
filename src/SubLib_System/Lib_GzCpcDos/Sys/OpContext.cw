package  { 

	import GZ.Gpu.Gpu;
	import GZ.Gfx.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Context;
	import GZ.Sys.Window;
	import GZ.Sys.System;

	
	public extension OpContext overplace Context {
		
		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF  ) : Void{
			Debug.fTrace1("---New OpWindows--");
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
		}
		 
		 override static public function fManageMessageOp():Void {
		 }
		
	}
}