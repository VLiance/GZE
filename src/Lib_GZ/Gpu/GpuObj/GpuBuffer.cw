package  { 

	
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.GpuObj.GpuObject;
	import GZ.Sys.Interface.Interface;
	import GZ.Gfx.Object;
	
	public overclass GpuBuffer extends GpuObject  {
		

		public wvar oProgram : ProgramShader;
		
		public var nId : Int = -1;
		public var bAutoClear : Bool;
		public wvar oItf : Interface;
		

		
		public function GpuBuffer(_oInterface : Interface, _bAutoClear: Bool = true ):Void {
			bAutoClear = _bAutoClear;
			oItf = _oInterface;
		}
		
	
		override public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		
		}
		
		
		public function  fUnload():Void {
			
		}
		public function  fIni():Void {
			
		}
		

		
	}
}