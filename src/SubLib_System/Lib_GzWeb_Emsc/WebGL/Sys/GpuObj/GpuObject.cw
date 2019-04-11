package  { 

	import GZ.Gfx.Shape;
	import GZ.Gfx.Object;
	import GZ.File.RcImg;
	
	public class GpuObject  {
	

		public function GpuObject( ):Void;

		public function fIniRender():Void;
		public function fFinishRender():Void;
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;
		static public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):UInt32;
		
	}
}