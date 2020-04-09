package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.Base.Uniform;
	import GZ.Base.Vec4;
	
	import GZ.Gpu.Base.UaVec4;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpUaVec4 overplace UaVec4 {
		
		
		
		public function OpUaVec4(_oProgram : ProgramShader, _sName : String):Void {
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
			if( aVal.nSize > 0){
				OpenGL.fUniform4fv(nId, aVal.nSize, aVal);
			}
		}
		
		
	}
}