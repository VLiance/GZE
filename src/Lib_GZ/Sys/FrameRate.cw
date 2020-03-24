package  { 
	

	import GZ.Gfx.Root;
	import GZ.Gfx.GlobalData;
	import GZ.Gfx.Buffer;
	import GZ.Sys.Interface.Interface;
	import GZ.Sys.Timer;
	import GZ.Base.Math.Math;
	import GZ.Base.Thread.Thread;

	public extension FrameRate extends Buffer {
		
		public var nFps : UInt;
		
		public var nMaxFramePerSecond : Int = 60;
		public var nToFrameMilli : Float;
		
		
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
			//Debug.fTrace("1: ");
			//Debug.fWarning("***********_nDeltaTime: " + _nDeltaTime);
		
			nDeltaSecAcc += _nDeltaTime;

			if(nDeltaSecAcc >= 1000.0){    //1 sec
				nDeltaSecAcc -= 1000.0;
				while(nDeltaSecAcc >= 1000.0){
					nDeltaSecAcc -= 1000.0;
				}
				
				nFps = nFrame;
				//Debug.fTrace("Fps: " + nFrame);
				
				nFrame = 0;
			}
				//Debug.fTrace("2: ");
			
			nToFrameMilli = 1000.0 / nMaxFramePerSecond;
			
			nDeltaFpsAcc += _nDeltaTime;
			if(nDeltaFpsAcc >= nToFrameMilli ){
				nDeltaFpsAcc -= nToFrameMilli;
				
				//Debug.fTrace("3: ");
				//Perfome all missed frame --> set a limit?
				while(nDeltaFpsAcc >= nToFrameMilli){ 	
					nDeltaFpsAcc -= nToFrameMilli;
				//	fNewFrame(); //TODO , do only logic?
				}
				//Debug.fTrace("4: ");

				fNewFrame();
				
				//Debug.fTrace("5: ");
				fBlit();
				//Debug.fTrace("6: ");
						
				nFrame++;
				nTotalFrameRended++;
				
				<cpp>
				#ifdef D_Render_100_Frames
				</cpp>
				if(nTotalFrameRended > 100){
					Thread.bAppIsAlive = false;
				}
				<cpp>
				#endif
				</cpp>
				//	Debug.fTrace("Frame : " + nFrame);
			}
			
			//fNewFrame();
			//if(){
				
			//}
			
		}
		
		
		//Overited
		public function fBlit():Void;
		
		
		//Overited
		public function fNewFrame():Void;

		//Overited
		public function fIniProcess():Void;

	

		
}