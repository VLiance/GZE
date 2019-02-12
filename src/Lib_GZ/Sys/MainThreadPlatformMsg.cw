
package  { 

	import GZ.Sys.Context;
	import GZ.Base.Rect;
	import GZ.Sys.Window;

	public overclass MainThreadPlatformMsg  {
	
		use Window.ePositioning;
	
		public atomic var gMainThreadGate : Gate<MainThreadPlatformMsg>;

		

		public function MainThreadPlatformMsg():Void {
			Debug.fTrace("MainThreadPlatformMsg!!!!!!!!!!!!!!!!!");
		}
		
		
		public function fManageMessage():Void {
			Debug.fError("fManageMessage: not implemented");
		}
		
		
		atomic function fRegisterContext(_gFrom : Gate<Context>, _vFrame : Rect<Int>, hPos : ePositioning):Void{
			Debug.fError("fCreateForm: not implemented");
		}

	}
}

