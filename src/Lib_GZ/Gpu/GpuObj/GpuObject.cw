package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	
	public class GpuObject  {
	

		public function GpuObject( ):Void;
		
		public function fIni(_oInterface : Interface):Void;
/*
		public function fIniRender():Void;
		public function fFinishRender():Void;
		
		static public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):UInt32;
		*/
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;
	}
}