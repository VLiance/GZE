package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.Base.Texture;
		
	public overclass GpuRcImg  {

		public var oGpuTexLayer : Texture;
	
		public function GpuRcImg( ):Void;

		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture):Val;

	}
}