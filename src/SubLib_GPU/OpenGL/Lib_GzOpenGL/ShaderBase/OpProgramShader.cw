package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.ShaderBase.ShaderBase;
	
	public class OpProgramShader overplace ProgramShader {
		

		override public function fLoad():Void {
			nId = OpenGL.fCreateProgram();
		}
		
		
		override public function fAttachShader(_oShader : ShaderBase):Void {
			OpenGL.fAttachShader(nId, _oShader.nId);
			aShaderAttached.fPush(_oShader);
			_oShader.aAttachedProgram.fPush(this);
		}
		override public function fDetachShader(_oShader : ShaderBase):Void {
			OpenGL.fDetachShader(nId, _oShader.nId);
			//TODO aShaderAttached.fUnPush(_oShader.nId);
		}
			

		override public function fLink():Bool{
			
			OpenGL.fLinkProgram(nId);

			if(OpenGL.fIsProgramLinked(nId) ){
				bLinked = true;
			}else{
				var _sError : String = OpenGL.fGetProgramInfoLog(nId);
				Debug.fError("Error linking OpenGL Program: \n" + _sError);
				
			}
			return bLinked;
		}
		
		override public function fUse():Bool{
			OpenGL.fUseProgram(nId);
			
			<cpp>
			 #ifndef D_Platform_Android
			 #ifndef D_Platform_Web_Emsc
			</cpp>
			///// DEFAULT VAO require for OpenGL > 3, (not exist on WebGL 1.0 (possible extention OES_vertex_array_object) & ES2, and not required)
			var _nEmptyVAO : UInt;
			OpenGL.fGenVertexArrays(1, _nEmptyVAO);
			OpenGL.fBindVertexArray(_nEmptyVAO);
			//#endif
			<cpp>
			 #endif
			 #endif
			</cpp>
			
			return true;
		}
		
		

	}
}