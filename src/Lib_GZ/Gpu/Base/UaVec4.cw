package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec4;
	
	public overclass UaVec4  extends Uniform {
		
		public var aVal : Array<Vec4<Float>>;
		

		public function UaVec4(_oProgram : ProgramShader, _sName : String):Void {
		}

		
		
		override public function fLoad():Void {
			//Debug.fTrace("aa");
		}
		
		
	}
}