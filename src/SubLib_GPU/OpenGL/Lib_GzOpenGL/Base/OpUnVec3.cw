package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec3;
	
	import GZ.Gpu.Base.UnVec3;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpUnVec3 overplace UnVec3 {
		
		
		
		public function OpUnVec3(_oProgram : ProgramShader, _sName : String):Void {
		}
		

		override public function fLoad():Void {
			//Debug.fTrace("--- OpShUniform Created!! ---");
			nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			
			bValid = true; //Todo

			<cpp>
			if(nId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find Uniform (or optimised out): " + sName );
				bValid = false
				return;
			<cpp>
			}
			</cpp>

		}
		
		
		override public function fSend():Void {
			OpenGL.fUniform3f(nId, vVal.nX, vVal.nY, vVal.nZ);
		}
		
		
	}
}