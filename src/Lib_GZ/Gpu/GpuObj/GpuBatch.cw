package  { 

	import GZ.Gfx.Face;
	import GZ.Gfx.Buffer;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	
	
	public overclass GpuBatch  {
		public wvar oShModel : GzShModel;
		
		public function GpuBatch( _oShModel : GzShModel ):Void{
			oShModel = _oShModel
		}


		public function fDraw():Void {
			
		}
		
	}
}