package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public extension GzShModel  {
		
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUvMouse : UnVec2;
		
		public function GzShModel():Void {
			fLoad();
		}
		
		public function fLoad():Bool {	
		}
		

		public function fDraw():Void {
		
		}
		
		
	}
}