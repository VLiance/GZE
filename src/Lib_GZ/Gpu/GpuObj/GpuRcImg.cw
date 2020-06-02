package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.Base.Texture;
		
	public overclass GpuRcImg  {
	
	
		public enum eImgFormat : Int {	//Follow OGL spec
			Default 					   = 0; 
			RGB                            = 0x1907;
			RGBA                           = 0x1908;
			RedUInt						   ;
		} 


		public var oGpuTexLayer : Texture;
	
		public function GpuRcImg( ):Void;

		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture, _hFormat : eImgFormat, _bBorder : Bool = true):Val;

	}
}