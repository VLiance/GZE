#skipContent
package  { 

	import GZ.Sys.Message.ContextLink;
	import GZ.Gpu.Gpu;

	
	public overclass ContextHandle {
		
		public wvar oLink : ContextLink;
		
		public var aHandleDrawZone : CArray<Int32>;
		public var gAction : Gate<ThreadMsg>;
		
		public var nFrameWidth : UInt;
		public var nFrameHeight : UInt;
		
		public var nHandleId : UIntX;
		public var nWinHandleId : UIntX;
		
		public var oGpu : Gpu;
		
		
		public function ContextHandle(_oLink : ContextLink): Void {
			oLink = _oLink;
						
			nFrameWidth =  oLink.oDim.nWidth;
			nFrameHeight = oLink.oDim.nHeight;
			
			fCreateContextHandle();
			aHandleDrawZone = fIniPixelDrawZone();
			
			if(nHandleId == 0){
				Debug.fError("Error, ContextHandle ID not initialised");
			}
			
			
			if(oLink.bGpuDraw){
				Debug.fTrace("--- bGpuDraw--");
				oGpu = new Gpu(nHandleId, false);
			
			}	
		}
		
		public function  fUpdate():Void {
			var  _oMsg  : ThreadMsg = gAction.fReceive();
			if(_oMsg){
				_oMsg.fRun();
			}
		}
		
		
		public function fCreateContextHandle():Bool{
			Debug.fError("fCreateContextHandle: not implemented ");
		}
			
		public function fIniPixelDrawZone(): CArray<Int32>{
			Debug.fError("fIniPixelDrawZone: not implemented, it require an initialised 1D pixel array");
		}
			 
	//	public function  fGetDrawZone():CArray<Int32, 2>;
		
		public function fBlit():UIntX {
			Debug.fError("fBlit: not implemented, unable to draw");
			return 0;
		}

		public function fGpuBlit():UIntX {
			oGpu.fBlit();
			//Debug.fError("fGpuBlit: not implemented, unable to draw");
			return 0;
		}
		
		
	}
}