package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public extension GpuObject  {
	

		public function GpuObject( ):Void;
		
		public function fIni(_oProgram : ProgramShader):Void;

		public function fIniRender():Void;
		public function fFinishRender():Void;
		
		
		public static function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Int;
		
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void;
	}
}