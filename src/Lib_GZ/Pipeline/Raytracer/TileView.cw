package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	
	public class TileView  {
			
		public wvar oItf : Interface;
		public var oImg : RcImg;
		public var nWidth : UInt;
		public var nHeight : UInt;

		
		public function TileView(_oItf : Interface):Void {
			oItf = _oItf;
		}
		
		
		public function fIni():Void {
		
			oImg = new RcImg("");
			nWidth = 800;
			nHeight = 800;
			
			//	public var aKeyRelease : CArray<Bool, 1, 256>
			var _aArray : CArray<UInt8, 1, 800>
			//oImg.aImg1D
			
			//oImg.fGpuLoad();
			
		}

		public function fBuild_Array():Void {
			
		}
		
		


		
		
	}
}

