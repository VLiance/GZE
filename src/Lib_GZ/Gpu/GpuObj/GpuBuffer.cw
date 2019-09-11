package  { 

	
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.GpuObj.GpuObject;
	import GZ.Sys.Interface.Interface;
	import GZ.Gfx.Object;
	import GZ.Gfx.Buffer;
	
	
	public overclass GpuBuffer extends GpuObject  {
		

		public wvar oProgram : ProgramShader;
		
				
		//public var nBuffWidth : UInt = 0;
		//public var nBuffHeight : UInt = 0;
		
		public var nId : Int = -1;
		public var bAutoClear : Bool;
		public wvar oBuffer : Buffer;
		

		
		public function GpuBuffer(_oBuffer : Buffer, _bAutoClear: Bool = true ):Void {
			bAutoClear = _bAutoClear;
			oBuffer = _oBuffer;
		}
		
	
		override public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		
		}
		
		
		public function  fUnload():Void {
			
		}
		public function  fIni():Void {
			
		}
		

		
	}
}