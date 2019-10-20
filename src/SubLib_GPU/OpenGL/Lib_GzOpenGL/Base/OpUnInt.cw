package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec2;
	
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpUnInt overplace UnInt {
		
		
		
		public function OpUnInt(_oProgram : ProgramShader, _sName : String):Void {
		}
		

		override public function fLoad():Void {
			nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			bValid = true; //Todo
		}
		
		
		override public function fSend():Void {
			OpenGL.fUniform1i(nId, nVal);
		}
		
		
	}
}