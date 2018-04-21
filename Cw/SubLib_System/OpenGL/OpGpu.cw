package  { 

	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;


	public overclass OpGpu overplace Gpu  {
		
		public var oGzShModel : GzShModel;
		
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace1("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			Debug.fTrace1("OP fContextIni Not Implemented : " + _nHandleId);
			
		}
		
		 override public function fBlit():Void {
		 }
		
		
		 public function fLoadDefaultShader():Bool {
		
		 }
		
		
		 override public function fClear():Void {
		 }
		

	}
}