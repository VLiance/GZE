

package  { 


	import GZ.Sys.MainThreadPlatformMsg;
	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Base.Pt;
	import GZ.Base.Dim;
	import GZ.Base.Rect;
	import GZ.Sys.System;
	

	public overclass Context extends Window {
		

		public	var nHandleId : UIntX;
		public	var nWinHandleId : UIntX;
		//public atomic var gMainThreadGate : Gate<ThreadMsg>;
		
		
		public	var nResFacX : Int = 1;
		public	var nResFacY : Int = 1;
		
		
	//	public static var qaContext : QArray<Context, 1>;
		
		public var gContextGate : Gate<Context>; //Current thread
//		public var gHandleGate : Gate<ThreadMsg>; //Normaly in main thread
		
		
	//	public var bGpuDraw : Bool = true;
		
		public var aDrawZone2D : CArray<Int32, 2>;
		public var aDrawZone1D : CArray<Int32>;
		
		


		public var bLibSharedContext : Bool = false;
		public var bIniDrawZone : Bool = false;
		
		//public static var qaLinks : QArray<ContextLink, 1>;
	
		public var bBlitInProgress : Bool = false;
		//public wvar oItf : Interface;
		
		
		public function Context(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF): Void {
			
		//Window(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
					//Debug.fInfo("_sWindowName Name  "  + _sWindowName);
					//Debug.fInfo("_sWindowName Name  "  + _sWindowName);
					//var _sTest : String = "_sWindowName "  + _sWindowName;
					Debug.fInfo("_sWindowName "  + _sWindowName);
					
					
		}
		
		public function fCreate(  _nPosX : Int,  _nPosY : Int,  _nWinWidth : UInt, _nWinHeight : UInt,  _nStart : eWinState = eWinState.Normal,   _bGpuDraw : Bool = true, _bResizable : Bool = false, _bDragAndDrop: Bool = false, _bVisible : Bool = true):Void{
			
			//var _oPt : Pt<Float> = new Pt<Float>(_nPosX, _nPosY);
			//var _oDim : Dim = new Dim(_nWinWidth, _nWinHeight);
			
			

			bWinGPU = _bGpuDraw;

			Debug.fTrace("Create new Window from Context!!");
			//Debug.fTrace("vFrameW:" + vFrame.nWidth);
			//Debug.fTrace("vFrameW:" + vFrame.nWidth);
			
			
			//var _vPoint : Vec3 = new Vec3(3,2,5);
			//var _vPoint : Vec3<Float> = [3,2,5];
			

			//var _vRect : Rect = new Rect(678.874321,123.45678,_nWinWidth, _nWinHeight);
			var _vRect : Rect<Int> = new Rect<Int>(400,200,600, 600);
			Debug.fTrace("RECTx "  + _vRect.nX);
			//Debug.fTrace("vFrameW: "  + vFrame.nWidth);
			
			
			
			Debug.fInfo("Context Name  "  + sName);
	
		
			//MainThreadPlatformMsg.gMainThreadGate.fSend(null);
			MainThreadPlatformMsg.gMainThreadGate.fRegisterContext(gContextGate, this);
			
			
			
			//MainThread.MainThreadPlatformMsg.fCreateForm();
			
			/*
			var _oMsg : ContextLink = new ContextLink("MonMessage!", _oPt, _oDim, bWinGPU);
			_oMsg.gFrom = gContextGate;
			gMainThreadGate.fSend(_oMsg);
			*/
			
		}
		
		override public function fFrameStart():Void{
			//Debug.fTrace("FrameSTart");
			gContextGate.ExecuteAll();

		}
		
		
		 atomic function fContextRegistred(_nHandleId : UIntX, _nWinHandleId: UIntX):Void{
		 	Debug.fTrace("!!!fContextRegistred!!!! " + _nHandleId + ":" + _nWinHandleId);
			fCreateContext();
			
			nHandleId = _nHandleId;
			nWinHandleId = _nWinHandleId;
			
			aDrawZone1D = fIniPixelDrawZone();
			
			<cpp>
				aDrawZone2D = new gzInt*[nFrameHeight];
				for (gzInt y = 0; y < nFrameHeight; ++y){
					aDrawZone2D[y] =  (gzInt*)&aDrawZone1D[y * nFrameWidth];
				}
				aDrawZone2D[10][5] = 0xFFFFFFFF;
			</cpp>	
			if(bWinGPU){
				oGpu = new Gpu(_nHandleId, true);
			}
				
			bIniDrawZone = true;
//			Debug.fTrace("RECTx "  + vRect.nX);
			
			oItf.fRegistred();
		
			
		 }	
		
		public function fInitialised():Void {
		}
		
		
		public function fCreateContext():Void {
			Debug.fTrace("fCreateContext Not implemented");
		}

		private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage
		

		
		public function fSendData(_nOtherWinId : UInt):Void;
		  
        public function fIniPixelZone():Void;
        public function drawPixel():Void;
		
      
		
		public function fBlit():UIntX {
			Debug.fError("fBlit: not implemented, unable to draw");
			return 0;
		}

		
        public function fKeyIsDown(_nKeyVal : Int):Int;
		
        public function fClear():Void{

			if(bIniDrawZone){
				<cpp>
				int _nLength = nFrameHeight * nFrameWidth;
				#pragma unroll 8
				for(gzUInt i  = 0; i < _nLength; i++){
					aDrawZone1D[i] = 0;
				}
				</cpp>
				/*
				for(var y : UInt = 0; y < nFrameHeight; y++){
					for(var x : UInt = 0; x < nFrameWidth; x++){
						aDrawZone2D[y][x] = 0x000000;
					}
				}*/
			}
		}
		
        public function fCpuVSyncOnGpu():Void;
		
		public function fIsWindowReady():Bool;
		
		
		public function fIniRender():Void {
			if(bIniDrawZone == true){ // Or jsut registred
				if(bWinGPU ) {	
					oGpu.fIniRender();
				}
			}
		}


		public function fGetMousePosition():Void;
		public function fStartCaptureOutside():Void;
		public function fStopCaptureOutside():Void;
		
	
		
		public function fFrameEnd():Void;
		public function fGetPixelArray():CArray<Int, 2>;
		
		public function  fGetKey(_oKey : Key):Void;
		

		
		public function fIniPixelDrawZone(): CArray<Int32>{
			Debug.fError("fIniPixelDrawZone: not implemented, it require an initialised 1D pixel array");
		}
			 
	//	public function  fGetDrawZone():CArray<Int32, 2>;
		
	
		public function fGpuBlit():UIntX {
			if(bIniDrawZone == true){ // Or jsut registred
				if(bWinGPU ) {
					oGpu.fBlit();
				}
			}
			//Debug.fError("fGpuBlit: not implemented, unable to draw");
			return 0;
		}
		
		
		public function fBlitComplete(_nDrawZoneAdr : UIntX = 0):Void {
		/*
			//Debug.fTrace("fBlitComplete ");
			if(_nDrawZoneAdr != 0){
				aDrawZone2D = _nDrawZoneAdr;
			}
			bBlitInProgress = false;
			//*/
		}
		destructor {
			<cpp>
			//GZ_fFree(aDrawZone2D);
			delete[] aDrawZone2D;
			</cpp>
		}
		
	}
}