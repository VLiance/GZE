package  { 

	//import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	//import GZ.Gfx.Object;
	import GZ.Gfx.Buffer;
	import GZ.File.RcImg;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Face;
	
	public overclass GpuFace  {
	
	
		public static var nCurrent : UInt;
		
		
		public wvar oFace : Face;
	
		public function GpuFace( _oFace :Face):Void{
			oFace = _oFace;
		}
		
		public function fIni(_oFace:Face):Void;

		override public function fDraw( _oSource : Buffer, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;

		public function fSetImg(_oRc : RcImg):Void;
		
		/*
		public function fGpuDraw():Void {
			
		}*/
		
	}
}