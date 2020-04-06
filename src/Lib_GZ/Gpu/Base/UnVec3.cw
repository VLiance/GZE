package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec3;
	
	public overclass UnVec3  extends Uniform {
		
		public var vVal : Vec3<Float>;
		

		public function UnVec3(_oProgram : ProgramShader, _sName : String):Void {
		}

		
		
		override public function fLoad():Void {
			//Debug.fTrace("aa");
		}
		
		
	}
}