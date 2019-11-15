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
				Debug.fWarning("MAX_COMBINED_TEXTURE_IMAGE_UNITS:" + OpenGL.fGetParameter_Int(MAX_COMBINED_TEXTURE_IMAGE_UNITS));
				Debug.fWarning("MAX_CUBE_MAP_TEXTURE_SIZE:" + OpenGL.fGetParameter_Int(MAX_CUBE_MAP_TEXTURE_SIZE));
				Debug.fWarning("MAX_FRAGMENT_UNIFORM_VECTORS:" + OpenGL.fGetParameter_Int(MAX_FRAGMENT_UNIFORM_VECTORS));
				Debug.fWarning("MAX_RENDERBUFFER_SIZE:" + OpenGL.fGetParameter_Int(MAX_RENDERBUFFER_SIZE));
				Debug.fWarning("MAX_TEXTURE_IMAGE_UNITS:" + OpenGL.fGetParameter_Int(MAX_TEXTURE_IMAGE_UNITS));
				Debug.fWarning("MAX_TEXTURE_SIZE:" + OpenGL.fGetParameter_Int(MAX_TEXTURE_SIZE));
				Debug.fWarning("MAX_VARYING_VECTORS:" + OpenGL.fGetParameter_Int(MAX_VARYING_VECTORS));
				Debug.fWarning("MAX_VERTEX_ATTRIBS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_ATTRIBS));
				Debug.fWarning("MAX_VERTEX_TEXTURE_IMAGE_UNITS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_TEXTURE_IMAGE_UNITS));
				Debug.fWarning("MAX_VERTEX_UNIFORM_VECTORS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_UNIFORM_VECTORS));
				Debug.fWarning("MAX_3D_TEXTURE_SIZE:" + OpenGL.fGetParameter_Int(MAX_3D_TEXTURE_SIZE));
				Debug.fWarning("MAX_ARRAY_TEXTURE_LAYERS:" + OpenGL.fGetParameter_Int(MAX_ARRAY_TEXTURE_LAYERS));
				Debug.fWarning("MAX_CLIENT_WAIT_TIMEOUT_WEBGL:" + OpenGL.fGetParameter_Int(MAX_CLIENT_WAIT_TIMEOUT_WEBGL));
				Debug.fWarning("MAX_COLOR_ATTACHMENTS:" + OpenGL.fGetParameter_Int(MAX_COLOR_ATTACHMENTS));
				Debug.fWarning("MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS));
				Debug.fWarning("MAX_COMBINED_UNIFORM_BLOCKS:" + OpenGL.fGetParameter_Int(MAX_COMBINED_UNIFORM_BLOCKS));
				Debug.fWarning("MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS));
				Debug.fWarning("MAX_DRAW_BUFFERS:" + OpenGL.fGetParameter_Int(MAX_DRAW_BUFFERS));
				Debug.fWarning("MAX_ELEMENT_INDEX:" + OpenGL.fGetParameter_Int(MAX_ELEMENT_INDEX));
				Debug.fWarning("MAX_ELEMENTS_INDICES:" + OpenGL.fGetParameter_Int(MAX_ELEMENTS_INDICES));
				Debug.fWarning("MAX_ELEMENTS_VERTICES:" + OpenGL.fGetParameter_Int(MAX_ELEMENTS_VERTICES));
				Debug.fWarning("MAX_FRAGMENT_INPUT_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_FRAGMENT_INPUT_COMPONENTS));
				Debug.fWarning("MAX_FRAGMENT_UNIFORM_BLOCKS:" + OpenGL.fGetParameter_Int(MAX_FRAGMENT_UNIFORM_BLOCKS));
				Debug.fWarning("MAX_FRAGMENT_UNIFORM_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_FRAGMENT_UNIFORM_COMPONENTS));
				Debug.fWarning("MAX_PROGRAM_TEXEL_OFFSET:" + OpenGL.fGetParameter_Int(MAX_PROGRAM_TEXEL_OFFSET));
				Debug.fWarning("MAX_SAMPLES:" + OpenGL.fGetParameter_Int(MAX_SAMPLES));
				Debug.fWarning("MAX_SERVER_WAIT_TIMEOUT:" + OpenGL.fGetParameter_Int(MAX_SERVER_WAIT_TIMEOUT));
				Debug.fWarning("MAX_TEXTURE_LOD_BIAS:" + OpenGL.fGetParameter_Int(MAX_TEXTURE_LOD_BIAS));
				Debug.fWarning("MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS));
				Debug.fWarning("MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS:" + OpenGL.fGetParameter_Int(MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS));
				Debug.fWarning("MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS));
				Debug.fWarning("MAX_UNIFORM_BLOCK_SIZE:" + OpenGL.fGetParameter_Int(MAX_UNIFORM_BLOCK_SIZE));
				Debug.fWarning("MAX_UNIFORM_BUFFER_BINDINGS:" + OpenGL.fGetParameter_Int(MAX_UNIFORM_BUFFER_BINDINGS));
				Debug.fWarning("MAX_VARYING_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_VARYING_COMPONENTS));
				Debug.fWarning("MAX_VERTEX_OUTPUT_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_OUTPUT_COMPONENTS));
				Debug.fWarning("MAX_VERTEX_UNIFORM_BLOCKS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_UNIFORM_BLOCKS));
				Debug.fWarning("MAX_VERTEX_UNIFORM_COMPONENTS:" + OpenGL.fGetParameter_Int(MAX_VERTEX_UNIFORM_COMPONENTS));
				Debug.fWarning("MIN_PROGRAM_TEXEL_OFFSET:" + OpenGL.fGetParameter_Int(MIN_PROGRAM_TEXEL_OFFSET));
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