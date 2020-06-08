package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	
	import GZ.Gpu.GpuObj.GpuRcImg;
		
	public class TileView  {
			
		public wvar oItf : Interface;
		public var oImg : RcImg;
		public var nWidth : UInt;
		public var nHeight : UInt;
		public var aArray : CArray<Int32, 1, 320000>;//800x800
		
		public function TileView(_oItf : Interface):Void {
			oItf = _oItf;
		}
		
		
		public function fIni():Void {
		
			oImg = new RcImg("");
			oImg.aImg1D = aArray;
			oImg.hPixFormat = GpuRcImg.ePixFormat.R16UI;
			oImg.nWidth = 800;
			oImg.nHeight = 800;
			oImg.bBorder = false;
			
			oImg.fSetGpuTexLayer(Attribute_Quad.oTexture);
			//	public var aKeyRelease : CArray<Bool, 1, 256>
		
			//oImg.aImg1D
			
			oImg.fGpuLoad();
			
			
		}

		public function fBuild_Array():Void {
			
		}
		
		


		
		
	}
}

