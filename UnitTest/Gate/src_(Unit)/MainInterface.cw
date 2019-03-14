package  { 
	
	
	import GZ.Sys.Interface.Window;

	import GZ.Sys.Interface.Interface;
	

 
	import GZ.Base.Math.Math;
	
	import GZ.Base.Thread.Thread;
	import GZ.Sys.ThreadItf;
	
	import GZ.Base.Mat4x4;
	import GZ.Base.Perspective;
	

	public thread<ThreadItf> MainInterface extends Interface {
		
		use Window.eWinClick;
		use Window.eWinBorder;
		
//		public var oDemo : Clip;
	//	public var oFps : FpsCount;
		
//		public var oImg : Img;
		
	//	public evar mTest : Mat4x4;
//		public var oPersv : Perspective;
		
	
		public function MainInterface( _oThreadItf : ThreadItf ):Void {
			//!New thread started, this and subclass are isolated for thread safety
			//!Select rendering on GPU on CPU, default, true

			
		<cpp>
		printf("\n-- MainInterface -- %p , id: %d", thread, thread->nId);
		</cpp>
		
		
			Debug.fTrace("MainInterface!!!!");
			Debug.fInfo("MainInterface!!!!");
			
			bGpuDraw = false;
			
			//!Make window transparent (Render or CPU)
			var _bTranparent : Bool = false;
			_bTranparent = false;
			
						Debug.fInfo("MainInterface!!!! "  + _bTranparent);
			
			
			//Create a new windows
			Interface(_oThreadItf, "GroundZero", 800, 600, _bTranparent, 0xFFFFFFFF);
			//, eWinBorder.Normal, true, true, true, _bCpuGraphique);
		
	
			//fCreateInterface(300,100);
		}
		
		override public function fWinStart():Void {
			Debug.fPass(" ---- Interface C~ initialised ----");
			//!The windows was created
			//-------------------------------
			//! Select your demo
			var _nDemo : Int = 1;
			//-------------------------------
		
			Debug.fTrace("---WinStart");

		}
		
		
		override public function fUpdateChildToParent():Void {
			//!Updated each frame, parents before
		}
		
		
		override public function fUpdateParentToChild():Void {
			//!Updated each frame, childs before
		}
		
	}
}