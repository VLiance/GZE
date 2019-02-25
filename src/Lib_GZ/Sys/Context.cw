

package  { 


	import GZ.Sys.MainThreadPlatformMsg;
	import GZ.Gpu.Gpu;
	import GZ.Sys.Window;
	import GZ.Gfx.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Message.ContextCreated;
	import GZ.Sys.Message.ContextLink;
	import GZ.Sys.Message.MousePos;
	import GZ.Sys.Message.Blit;
	import GZ.Base.Pt;
	import GZ.Base.Dim;
	import GZ.Base.Rect;
	import GZ.Sys.System;
	

	public overclass Context extends Window {
		

		
		
		//public atomic var gMainThreadGate : Gate<ThreadMsg>;
		
		
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
		
		
		public function Context(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF): Void {
			//Window(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
					//Debug.fInfo("_sWindowName Name  "  + _sWindowName);
					//Debug.fInfo("_sWindowName Name  "  + _sWindowName);
					//var _sTest : String = "_sWindowName "  + _sWindowName;
					Debug.fInfo("_sWindowName "  + _sWindowName);
					
					
		}
		
		public function fCreate(  _nPosX : Int,  _nPosY : Int,  _nWinWidth : UInt, _nWinHeight : UInt,  _nStart : eWinState = eWinState.Normal,   _bGpuDraw : Bool = true, _bResizable : Bool = false, _bDragAndDrop: Bool = false, _bVisible : Bool = true):Void{
			
			var _oPt : Pt = new Pt(_nPosX, _nPosY);
			var _oDim : Dim = new Dim(_nWinWidth, _nWinHeight);
			
			bWinGPU = _bGpuDraw;
			nFrameWidth = _nWinWidth;
			nFrameHeight = _nWinHeight;
			
			
			Debug.fTrace("Create new Window from Context!!");
			
			
			//var _vPoint : Vec3 = new Vec3(3,2,5);
			//var _vPoint : Vec3<Float> = [3,2,5];
			

			//var _vRect : Rect = new Rect(678.874321,123.45678,_nWinWidth, _nWinHeight);
		//	vRect = new Rect<Int>(400,200,600, 600);

			//Debug.fTrace("RECTx "  + vRect.nX);
				Debug.fInfo("Context Name  "  + sName);
			sName = "assss";
		
			//MainThreadPlatformMsg.gMainThreadGate.fSend(null);
			MainThreadPlatformMsg.gMainThreadGate.fRegisterContext(gContextGate, sName, vFrame, ePositioning.Center);
			
			
			
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
		
		
		 atomic function fContextRegistred():Void{
		 	Debug.fTrace("!!!fContextRegistred!!!!");
//			Debug.fTrace("RECTx "  + vRect.nX);
			
			
		 }	
		

		public function fCreateNow():Void {
			Debug.fTrace("Create Now Not implemented");
		}

		private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage
		
		

		
		
		//Called in main thread
		//static public function fAddLink(_oLink : ContextLink):Void{
		 public function fAddLink(_oLink : ContextLink):Void{
			//qaLinks.fPush(_oLink);
		}
		
		//Called regulary from main thread
		//static public function fManageMessage():Void{
		public function fManageMessage():Void{
	
			/*
				Debug.fTrace("---New fManageMessage--");
				
			var  _oMsg  : ThreadMsg = gMainThreadGate.fReceive();
			if(_oMsg){
				Debug.fTrace("---fReceived message!!!!!-- : " );
				_oMsg.fRun();
			}
		
			forEach(var _oLink : ContextLink in qaLinks){
				_oLink.oHandle.fUpdate();
				var _oMsg : MousePos = new MousePos();
				//_oLink.fSendMsg(_oMsg);
			}
			Context.fManageMessageOp();*/
		}
		
		 public function fManageMessageOp():Void {
		//static public function fManageMessageOp():Void {
		}
	
		
		
		public function fSendData(_nOtherWinId : UInt):Void;
		  
        public function fIniPixelZone():Void;
        public function drawPixel():Void;
		
        public function fBlit():Void{
			/*
			
			if(bIniDrawZone || bWinGPU){
						
			//Debug.fTrace1("fBlitDrawZone ");
			
			//	Debug.fTrace1("aDrawZone ");
			//	aDrawZone2D[5][20] = 0xFFFFFFFF;
			//	aDrawZone2D[5][7] = 0xFFFFFFFF;
			
				bBlitInProgress = true;
				var _oMsgBlit : Blit = new Blit();
				gHandleGate.fSend(_oMsgBlit);
				
				
				
				//Wait for answer
				while(bBlitComplete == false){
					System.fSleep(1);
					var  _oMsg  : ThreadMsg = gContextGate.fReceive();
					if(_oMsg){
						_oMsg.fRun();
					}
				}
				bBlitComplete = false;
				Debug.fTrace1("Complete ");
			}*/
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
		public function fIniRender():Void;

		public function fGetMousePosition():Void;
		public function fStartCaptureOutside():Void;
		public function fStopCaptureOutside():Void;
		
	
		
		public function fFrameEnd():Void;
		public function fGetPixelArray():CArray<Int, 2>;
		
		public function  fGetKey(_oKey : Key):Void;
		
		
		public function fCompleteContext(_oInfo : ContextCreated) :Void {
		/*
			gHandleGate = _oInfo.gContextHandle;
			
			//aDrawZone2D = _oInfo.nDrawZoneAdr;
			<cpp>
			/*
			aDrawZone1D = (gzInt32*)(_oInfo->nDrawZoneAdr);
			//aDrawZone1D = _oInfo.nDrawZoneAdr; //Erroooor auto add "&" for GPU Handling XD 
			*/
			</cpp>
			/*
			if(_oInfo.bGpuDraw == false){
				if( aDrawZone1D == 0){
					Debug.fError("Error, no valid draw zone (pixel array of 1D) returned by fIniPixelDrawZone");
				}else{
					bIniDrawZone = true;
					//Debug.fTrace1("fSetaDrawZone ");*/
					<cpp>
					/*
					aDrawZone2D = new gzInt*[nFrameHeight];
					for (gzInt y = 0; y < nFrameHeight; ++y){
						aDrawZone2D[y] =  (gzInt*)&aDrawZone1D[y * nFrameWidth];
					}*/
					</cpp>/*
				}
			}*/
		}
		
		
		
		public function fBlitComplete(_nDrawZoneAdr : UIntX = 0):Void {
		/*
			//Debug.fTrace1("fBlitComplete ");
			if(_nDrawZoneAdr != 0){
				aDrawZone2D = _nDrawZoneAdr;
			}
			bBlitInProgress = false;
			//
		}*/

		
	}
}