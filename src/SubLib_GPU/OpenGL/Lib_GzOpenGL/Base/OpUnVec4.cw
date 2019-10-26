package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec4;
	
	import GZ.Gpu.Base.UnVec4;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpUnVec4 overplace UnVec4 {
		
		
		
		public function OpUnVec4(_oProgram : ProgramShader, _sName : String):Void {
		}
		

		override public function fLoad():Void {
			Debug.fTrace("--- OpShUniform Created!! ---");
			nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			
			bValid = true; //Todo
			/*
			if(nId >= 0){
				Debug.fWarning(" *** bValid ---- " );
				bValid = true;
				
			}else{
				//TODO GetActiveUniform to get is type
				
				//  if(glProgramIsAttribInactive(...))
				//Inactive attribute.
				// else
				//Name mismatch.

				Debug.fWarning("Gpu: Uniform not found/used: " + sName);
			}*/
			
		}
		
		
		override public function fSend():Void {
			OpenGL.fUniform4f(nId, vVal.nX, vVal.nY, vVal.nZ, vVal.nW);
		}
		
		
	}
}