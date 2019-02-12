package  { 


	
	
	import GZ.Gpu.GpuInfo;

	
	public overclass Gpu  {
	
		public var oGpuInfo : GpuInfo;
		
		public function Gpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
			//Debug.fTrace1("--- Gpu Created!! ---");
			oGpuInfo = new GpuInfo();
			
			fContextIni(_nHandleId, _bGlobalSharedContext);
			
			fBlit();
		}

		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void;
		
		
		public function fBlit():Void{
			Debug.fError("Gpu: fBlit: not implemented, unable to draw");
		}
		
		public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			Debug.fError("fContextIni: not implemented, unable to draw ");
		}
		
		public function fError(_sError : String):Bool{
			Debug.fError("Gpu error : " + _sError);
		}
		
		public function fFatal(_sError : String):Bool{
			Debug.fError("Gpu fatal : " + _sError);
		}
		
		public function fClear():Void {
			 Debug.fError("Gpu fClear not implemented " );
		}
		
		
	}
}