
package  { 

	import GZ.Sys.Interface.Context;
	import GZ.Base.Rect;
	import GZ.Sys.Interface.Window;

	public overclass MainThreadPlatformMsg  {
	
		use Window.ePositioning;
	
		public atomic var gMainThreadGate : Gate<MainThreadPlatformMsg>;

		

		public function MainThreadPlatformMsg():Void {
			Debug.fTrace("MainThreadPlatformMsg!!!!!!!!!!!!!!!!!");
		}
		
		
		public function fManageMessage():Void {
			Debug.fError("fManageMessage: not implemented");
		}
		
		
		atomic function fRegisterContext(_gFrom : Gate<Context>, _oWindow : Window):Void{
			Debug.fError("fCreateForm: not implemented");
		}

	}
}

