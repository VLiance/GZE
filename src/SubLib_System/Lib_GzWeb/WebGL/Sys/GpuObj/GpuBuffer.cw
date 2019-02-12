package  { 

	import GZ.Gfx.Shape;
	import GZ.Gfx.Buffer;
	import GZ.File.RcImg;
	
	public class GpuBuffer  {
	
		public function GpuBuffer( ):Void;
		public function fIni(_oObj:Buffer):Void;
		override public function fDraw( _oSource : Buffer, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;
		
	}
}