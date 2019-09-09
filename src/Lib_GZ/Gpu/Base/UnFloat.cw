package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;

	
	public overclass UnFloat  extends Uniform {
		
		public var nVal : Float;
		 

		public function UnFloat(_oProgram : ProgramShader, _sName : String):Void {
		}

		
		
		override public function fLoad():Void {
			//Debug.fTrace("aa");
		}
		
		
	}
}