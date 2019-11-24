package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpTexture overplace Texture {

		
		
		
		public function OpTexture(_oProgram : ProgramShader, _sName : String,  _sSizeName : String):Void {
		
		}
		
		override public function fLoad():Void {
		
				   // printf("%s" , (gzInt8*)(_sName.sStr->array + 1));
	//		GL_fUniform1i(GL_fGetUniformLocation(nId, _sName.fcStr() ), _nSlot);
		
			nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			nSizeId = OpenGL.fGetUniformLocation(oProgram.nId, sSizeName);
			bValid = true;
			
			<cpp>
			if(nId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find Uniform (or optimised out): " + sName );
				bValid = false;
			<cpp>
			}
			</cpp>
			
			<cpp>
			if(nSizeId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find Uniform (or optimised out): " + sSizeName );
				bValid = false;
			<cpp>
			}
			</cpp>
			
			//var _nID : Int = nId;
			//Debug.fPass("--- Texture Created!:--- "  + _nID);
			// _nSlot + GL_TEXTURE0;
		}
		
		override public function fSend(_nSlot : UInt):Void {
			nSlot = _nSlot;
			OpenGL.fUniform1i(nId, _nSlot);
		}

		public function fSendSize(_nWidth : Float, _nHeight : Float):Void {
			OpenGL.fUniform2f(nSizeId, _nWidth, _nHeight);
		}

	}
}