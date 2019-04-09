package  { 
	

	import GZ.Gfx.Root;
	import GZ.Gfx.GlobalData;
	import GZ.Gfx.Buffer;
	import GZ.Sys.Interface.Interface;
	import GZ.Sys.Timer;
	import GZ.Base.Math.Math;


	public extension FrameRate extends Buffer {
		
		public var nFps : UInt;
		
		public var nMaxFramePerSecond : Int = 60;
		public var nToFrameMilli : Float;
		
		
		public var oTimer : Timer;
		public var nLastTime : Float;
		public var nFrame : UInt;
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
		
		
		public function ThreadLoop():Void{
			
			var _nTime : Float = oTimer.fGet();
			var _nDeltaTime : Float = _nTime - nLastTime;
			nLastTime = _nTime;
			
			//Debug.fTrace("_nDeltaTime: " + _nDeltaTime);
		
			nDeltaSecAcc += _nDeltaTime;

			if(nDeltaSecAcc >= 1000.0){    //1 sec
				nDeltaSecAcc -= 1000.0;
				while(nDeltaSecAcc >= 1000.0){
					nDeltaSecAcc -= 1000.0;
				}
				
				nFps = nFrame;
				Debug.fTrace("Fps: " + nFrame);
				
				nFrame = 0;
			}
			
			
			nToFrameMilli = 1000.0 / nMaxFramePerSecond;
			
			nDeltaFpsAcc += _nDeltaTime;
			if(nDeltaFpsAcc >= nToFrameMilli ){
				nDeltaFpsAcc -= nToFrameMilli;
				
				//Perfome all missed frame --> set a limit?
				while(nDeltaFpsAcc >= nToFrameMilli){ 	
					nDeltaFpsAcc -= nToFrameMilli;
					fNewFrame();
				}
				
				
				fNewFrame();
				fBlit();
				nFrame++;
				//	Debug.fTrace1("Frame : " + nFrame);
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