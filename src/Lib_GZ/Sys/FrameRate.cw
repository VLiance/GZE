package  { 
	

	import GZ.Gfx.Root;
	import GZ.Gfx.GlobalData;
	import GZ.Gfx.Buffer;
	import GZ.Sys.Interface.Interface;
	import GZ.Sys.Timer;
	import GZ.Base.Math.Math;
	import GZ.Base.Thread.Thread;
	import GZ.Sys.Interface.Context;

	public extension FrameRate extends Buffer {
		
		public var nFps : UInt;
		
		public var bFrMax : Bool = true;
		public var bFpsInTitle : Bool = true;
		
		//public var bFrMax : Bool = true;
		public var bFrBasedOnTime : Bool = false;
		public var nFrBasedOnTime_MaxFPS : Int = 60;
		public var nFrBasedOnFrame_RenderAtEachFR : UInt = 1;
		
		private var nFrBasedOnFrame_Current : UInt = 0;
		public var nToFrameMilli : Float;
		
		public var oContext : Context;
		
		public var oTimer : Timer;
		public var nLastTime : Float;
		public var nFrame : UInt;
		public var nTotalFrameRended : UInt;
		public var nDeltaSecAcc : Float;
		public var nDeltaFpsAcc : Float;
		
		public function FrameRate( _oParent : Root, _nWidth : UInt, _nHeight : UInt):Void{
			Buffer(_oParent, _nWidth, _nHeight, true);
		}

		public function fStartProcess():Void {
			fIniProcess();
			oTimer = new Timer();
			oTimer.fStart();
		}	

		public function fQuit():Void;
		
		
		override function ThreadLoop():Void{
			
			var _nTime : Float = oTimer.fGet();
			var _nDeltaTime : Float = _nTime - nLastTime;
			nLastTime = _nTime;
			nDeltaSecAcc += _nDeltaTime;

			if(nDeltaSecAcc >= 1000.0){    //1 sec
				nDeltaSecAcc -= 1000.0;
				while(nDeltaSecAcc >= 1000.0){
					nDeltaSecAcc -= 1000.0;
				}
				
				nFps = nFrame;
				if(bFrMax){
					//Debug.fTrace("Fps: " + nFrame);
				}
				if(bFpsInTitle){
					oContext.fSetTitle( oContext.sName + " - " + nFrame);
				}
				nFrame = 0;
			}
			
			
			if(bFrMax){
				<cpp>
				thread->nSleepTime = 0;
				</cpp>
				fCreateFrame();
				
			}else{
				<cpp>
				if(thread->nSleepTime == 0){//Temp?
					thread->nSleepTime = 1;
				}
				</cpp>
				
				if(bFrBasedOnTime){
					nToFrameMilli = 1000.0 / nFrBasedOnTime_MaxFPS;
					nDeltaFpsAcc += _nDeltaTime;
					if(nDeltaFpsAcc >= nToFrameMilli ){
						nDeltaFpsAcc -= nToFrameMilli;
						//Perfome all missed frame --> set a limit?
						while(nDeltaFpsAcc >= nToFrameMilli){ 	
							nDeltaFpsAcc -= nToFrameMilli;
						//	fNewFrame(); //TODO , do only logic?
						}
						fCreateFrame();
					}
				}else{//FrBasedOnFrame
					//Debug.fTrace("NewFrame: " + nFrame);
					nFrBasedOnFrame_Current++;
					if(nFrBasedOnFrame_Current >= nFrBasedOnFrame_RenderAtEachFR){
						nFrBasedOnFrame_Current = 0;
						fCreateFrame();
					}
				}
			}
		}
		
		public function fCreateFrame():Void {
		
			fNewFrame();
			fBlit();

			nFrame++;
			nTotalFrameRended++;
			<cpp>
			//#define D_Render_100_Frames
			#ifdef D_Render_100_Frames
			</cpp>
			if(nTotalFrameRended > 300){
				Thread.bAppIsAlive = false;
			}
			<cpp>
			#endif
			</cpp>
		}
		
		
		
		//Overited
		public function fBlit():Void;
		
		
		//Overited
		public function fNewFrame():Void;

		//Overited
		public function fIniProcess():Void;

	

		
}