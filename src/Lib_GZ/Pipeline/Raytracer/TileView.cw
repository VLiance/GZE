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
		//public var aArray : CArray<Int32, 1, 320000>;//800x800
		public var aArray : CArray<Int32, 1, 640000>;//800x800
		public var bLoaded : Bool = false;
		
		public function TileView(_oItf : Interface):Void {
			oItf = _oItf;
			
			for(var i:Int = 0; i < 20000; i++;){
				aArray[i] = 0xFFFFFFFF;
			}
			
		
			
			oImg = new RcImg("");
			oImg.aImg1D = aArray;
			//oImg.hPixFormat = GpuRcImg.ePixFormat.R16UI;
			oImg.hPixFormat = GpuRcImg.ePixFormat.R8UI;
			oImg.nWidth = 800;
			oImg.nHeight = 800;
			oImg.bBorder = false;
			
			
			
		}
		
		
		public function fIni():Void {
		
			if(bLoaded == false){
				bLoaded = true;
				oImg.fSetGpuTexLayer(Attribute_Quad.oITexID);
				//	public var aKeyRelease : CArray<Bool, 1, 256>
				

				oImg.fGpuLoad();
			}
			
		}

		public function fBuild_Array():Void {
			
		}
		
		


		
		
	}
}

