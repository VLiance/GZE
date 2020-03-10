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
		
				   // GZ_printf("%s" , (gzInt8*)(_sName.sStr->array + 1));
	//		GL_fUniform1i(GL_fGetUniformLocation(nId, _sName.fcStr() ), _nSlot);
		
			nId = OpenGL.fGetUniformLocation(oProgram.nId, "Texture["  + nSlot + "]" );
			nSizeId = OpenGL.fGetUniformLocation(oProgram.nId,  "TexSize["  + nSlot + "]" );
			nNumId = OpenGL.fGetUniformLocation(oProgram.nId,  sName );
			bValid = true;
			
			<cpp>
			if(nNumId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find Uniform (or optimised out): " + sName );
				bValid = false;
			<cpp>
			}
			</cpp>
			
			
			<cpp>
			if(nSizeId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to size array Texture Uniform (or optimised out): TexSize"  );
				bValid = false;
			<cpp>
			}
			</cpp>
			
			
			OpenGL.fUniform1i(nId, nSlot);
			OpenGL.fUniform1i(nNumId, nSlot);
			
			
			//fSend(nSlot);
			
			//var _nID : Int = nId;
			//Debug.fPass("--- Texture Created!:--- "  + _nID);
			// _nSlot + GL_TEXTURE0;
		}
		
		override public function fSend(_nSlot : UInt):Void {
			//nSlot = _nSlot;
			//OpenGL.fUniform1i(nId, _nSlot);
		}

		override function fSendSize(_nWidth : Float, _nHeight : Float):Void {
			OpenGL.fUniform2f(nSizeId, _nWidth, _nHeight);
		}

	}
}