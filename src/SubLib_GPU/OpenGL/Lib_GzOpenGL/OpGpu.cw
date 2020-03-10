package  { 

	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;

	import GZ.Gpu.ShaderModel.GzModel.GzShModel;


	public overclass OpGpu overplace Gpu  {
		
		public var oGzShModel : GzShModel;
		
		
		public function OpGpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
		
		}
		
		
		
		override function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			Debug.fTrace("OP fContextIni Not Implemented : " + _nHandleId);
			
		}
		
		
		override public function fIniRender():Void {
		}
		
		
		 override public function fBlit():Void {
		 }
		 
		
		 override public function fSetShader(_oGzShModel : GzShModel):Void {
		 }
		 
		 override public function fLoadDefaultShader():Bool {
		 }
		
		
		 override public function fClear():Void {
		 }
		

	}
}