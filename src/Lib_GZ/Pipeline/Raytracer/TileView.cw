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
	//	public var aArray : CArray<Int16, 1, 625>;//800x800 => (25x25 / 32x32) = 
		public var aArray : CArray<Int16, 1, 625>;//800x800 => (25x25 / 32x32) = 
		public var bLoaded : Bool = false;
		public var nOffset : Int;
		
		public function TileView(_oItf : Interface):Void {
			oItf = _oItf;
			
			for(var i:Int = 0; i < 625; i++;){
				aArray[i] = i;
				//aArray[i] = 0xFFFFFFFF;
			}
			
			oImg = new RcImg("");
			
			//TODO autocast
			//oImg.aImg1D = aArray;
			<cpp>
				oImg->aImg1D = (gzInt32 *)(/*|LineArray|*/aArray);
			</cpp>		
			
			
			oImg.hPixFormat = GpuRcImg.ePixFormat.R16UI;
		//	oImg.hPixFormat = GpuRcImg.ePixFormat.R8UI;
			//oImg.hPixFormat = GpuRcImg.ePixFormat.Default;
			oImg.nWidth =  800/32;
			oImg.nHeight = 800/32;
			oImg.bBorder = false;
		}
		
		public function fIni():Void {
			
			
			
			nOffset += 1;
			for(var i:Int = 0; i < 625; i++;){
				aArray[i] = i  + nOffset;
				//aArray[i] = 0xFFFFFFFF;
			}
			if(nOffset > 625){
				nOffset = 0;
			}
			
			<cpp>
				oImg->aImg1D = (gzInt32 *)(/*|LineArray|*/aArray);
			</cpp>		
			//if(bLoaded == false){
			//	bLoaded = true;
				//oImg.fSetGpuTexLayer(Attribute_Quad.oTexture);
				oImg.fSetGpuTexLayer(Attribute_Quad.oITexID);
				//	public var aKeyRelease : CArray<Bool, 1, 256>
				

				oImg.fGpuLoad(true);
			//}
		}

		public function fBuild_Array():Void {
			
		}
		
		
		
		
	}
}

