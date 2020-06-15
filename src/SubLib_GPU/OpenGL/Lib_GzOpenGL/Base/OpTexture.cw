package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpTexture overplace Texture {

		
		
		
		public function OpTexture(_oProgram : ProgramShader, _sName : String, _bTexInteger : Bool = false):Void {
		
		}
		
		override public function fLoad():Void {
			// GZ_printf("%s" , (gzInt8*)(_sName.sStr->array + 1));
			//GL_fUniform1i(GL_fGetUniformLocation(nId, _sName.fcStr() ), _nSlot);
		
			if(bTexInteger){
				//Debug.fTrace("Create Integer Texture! " + nSlot);
				nId = OpenGL.fGetUniformLocation(oProgram.nId, "UTexture["  + nIndex + "]" );
				nSizeId = OpenGL.fGetUniformLocation(oProgram.nId,  "UTexSize["  + nIndex + "]" );
			}else{
				//Debug.fTrace("Create Float Texture!" + nSlot);
				nId = OpenGL.fGetUniformLocation(oProgram.nId, "Texture["  + nIndex + "]" );
				nSizeId = OpenGL.fGetUniformLocation(oProgram.nId,  "TexSize["  + nIndex + "]" );
			}
			
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
			OpenGL.fUniform1i(nNumId, nIndex);
			
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