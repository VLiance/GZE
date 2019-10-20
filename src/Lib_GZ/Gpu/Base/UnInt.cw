package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	import GZ.Gpu.Base.Uniform;

	
	public overclass UnInt  extends Uniform {
		
		public var nVal : Int;
		 

		public function UnInt(_oProgram : ProgramShader, _sName : String):Void {
		}

		
		
		override public function fLoad():Void {
			//Debug.fTrace("aa");
		}
		
		
	}
}