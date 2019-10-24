package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec4;
	
	public overclass UnVec4  extends Uniform {
		
		public var vVal : Vec4<Float>;
		

		public function UnVec4(_oProgram : ProgramShader, _sName : String):Void {
		}

		
		
		override public function fLoad():Void {
			//Debug.fTrace("aa");
		}
		
		
	}
}