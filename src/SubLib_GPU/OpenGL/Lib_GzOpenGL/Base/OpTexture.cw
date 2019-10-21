package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpTexture overplace Texture {

		
		public function OpTexture(_oProgram : ProgramShader, _sName : String):Void {
		
		}
		
		override public function fLoad():Void {
		
				   // printf("%s" , (gzInt8*)(_sName.sStr->array + 1));
	//		GL_fUniform1i(GL_fGetUniformLocation(nId, _sName.fcStr() ), _nSlot);
			Debug.fTrace("--- Texture Created!! ---");
			nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			bValid = true; //Todo
			
			// _nSlot + GL_TEXTURE0;
		
		}
		
		override public function fSend(_nSlot : UInt):Void {
			OpenGL.fUniform1i(nId, _nSlot);
		}



	}
}