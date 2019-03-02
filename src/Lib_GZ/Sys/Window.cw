package  { 

	import GZ.Gpu.Gpu;
	import GZ.Gfx.Interface;
	import GZ.Input.Key;
	import GZ.Base.Rect;
	import GZ.Sys.System;

	public extension Window  {
	
	
		//define var nPosCenter : Int;
		public const var nPosCenter : Int = -1;
		
		public var bGlobalSharedContext : Bool;
		public var bReady : Bool;
		
		
		public var oGpu : Gpu;
		
		public enum ePositioning : Int {
			Manual;
			Parent;
			Center;
			Hidden; 
		}
				
		public enum eWinState : Int {
			Normal;
			Minimised;
			Maximised;
			Hidden; 
		}
		
		public enum eWinBorder : Int {
			Normal;
			NormalDouble;
			None;
			BorderOnly;  
			BorderOnlyDouble;  
			Title;
			TitleDouble;
		}
		
		public enum eWinClick : Int {
			None;
			Close;
			Maximize; 
			Minimize; 
		}
		
		
		public var hBorder : eWinBorder;
		

		public var dInterProcessMessage : Delegate<fReceiveMessage>;
		
		public var hWinClick : eWinClick;
		public var bWinGPU : Bool;
		public var nMouseX : Float;
		public var nMouseY : Float;
		public var nHandleId : UInt;
		public var nLastMouseX : Float;
		public var nLastMouseY : Float;
		public static var bMouseDrag : Bool;
		public static var bFirstMouseOver : Bool;
		
		
		public var vFrame : Rect<Int>;
		
		public var nPosX : Float;
		public var nPosY : Float;
		
		public var nFrameWidth : Int;
		public var nFrameHeight : Int;
		
		public var sName : String;
	
		//Functions
		
		public function Window(_oInterface : Interface, _sName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF): Void{
				vFrame = new Rect<Int>(0,0,800, 600); //Default
					Debug.fInfo(_sName);
				sName = _sName;
	
		}
		//, _nBorder : eWinBorder = eWinBorder.Normal, _bMinimizeBox: Bool = true, _bMaximizeBox: Bool = true, _bCloseBox: Bool = true, _bWinGPU:Bool = true, _bNoManager: Bool  = true ) : Void;
		
		
		private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage
		public function fCreate(  _nPosX : Int,  _nPosY : Int,  _nWinWidth : UInt, _nWinHeight : UInt,  _nStart : eWinState = eWinState.Normal,  _bResizable : Bool = false, _bDragAndDrop: Bool = false, _bVisible : Bool = true):Void{
				Debug.fTrace("---fCreate Not Implemented--");
				
			if(hBorder == eWinBorder.Normal){
				 
			 }
				
		}
		
		public function fFrameStart():Void{
			Debug.fTrace("fFrameStart");
		}
		
		
		
		public function fMove( _nPosX : Int, _nPosY : Int):Void;
        public function fMoveAndSize(_nPosX : Int, _nPosY : Int, _nWidth : Int, _nHeight: Int):Void;
        public function fShow(_bActive : Bool = true):Void;
        public function fHide():Void;
		public function fIniProcess():Void;
        public function fMinimize():Void;
        public function fMaximize():Void;
        public function fRestore():Void;
        public function fDisable():Void;
		

		 public function fSendData(_nOtherWinId : UInt):Void;
		  
        public function fIniPixelZone():Void;
        public function drawPixel():Void;
        public function fBlit():Void;
        public function fKeyIsDown(_nKeyVal : Int):Int;
        public function fClear():Void;
        public function fCpuVSyncOnGpu():Void;
		
		public function fIsWindowReady():Bool;
		public function fIniRender():Void;

		public function fGetMousePosition():Void;
		public function fStartCaptureOutside():Void;
		public function fStopCaptureOutside():Void;
		
	
		
		public function fFrameEnd():Void;
		public function fGetPixelArray():CArray<Int, 2>{
			Debug.fTrace("ss");
			
		}
		
			
		 public function fTest():Void{
			Debug.fTrace("TEST!");
		}
		
		public function  fGetKey(_oKey : Key):Void;
		

	}
}