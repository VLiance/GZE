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
		}
		
		override public function fLink():Bool{
			
			OpenGL.fLinkProgram(nId);
			var _nLinkStatus : UInt;
			OpenGL.fGetProgramParameter(nId, LINK_STATUS, _nLinkStatus);
			if(_nLinkStatus != 0){
				bLinked = true;
			}
			return bLinked;
		}
		
		override public function fUse():Bool{
			OpenGL.fUseProgram(nId);
			
			<cpp>
			 #ifndef GZ_tAndroid
			 #ifndef GZ_tWeb_Emsc
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