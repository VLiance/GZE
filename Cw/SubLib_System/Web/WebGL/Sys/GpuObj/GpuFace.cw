package  { 

	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Object;
	import GZ.Gfx.Buffer;
	import GZ.File.RcImg;
	
	public class GpuFace  {
	

		public function GpuFace( ):Void;
		public function fIni(_oFace:Face):Void;

		override public function fDraw( _oSource : Buffer, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;

		public function fSetImg(_oRc : RcImg):Void;
		
	}
}