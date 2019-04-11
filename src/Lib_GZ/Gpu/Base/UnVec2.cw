package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec2;
	
	public overclass UnVec2  extends Uniform {
		
		public evar oVal : Vec2;
		

		/*
				public function UnVec2(_oProgram : ProgramShader, _sName : String):Void {
			Uniform(_oProgram, _sName);
		}
		*/
		
		
		override public function fLoad():Void {
			Debug.fTrace("aa");
		}
		
		
	}
}