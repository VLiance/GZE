package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.VertexShader;
	
	public overclass OpVertexShader overplace VertexShader {
		
						
		public function OpVertexShader(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			Debug.fTrace("--- OpVertexShader Created!! ---");
			VertexShader(_hGlsl_ES_Version);
			
			fAddHeader();
		}
		

		
		override public function fAddHeader():Void {
			if(hGlsl_ES_Version == eGlsl_ES_Version.Auto){
				Debug.fTrace("--****************--");
				
				<cpp>
				#ifdef D_Platform_Web_Emsc
				</cpp>
				
				<glsl(this)>
					#version 100  //-->ES2/ WebGl
				////////////////// ES2 //////////////////////
					//Default Value
					//precision highp float;
					//precision highp int;
					//precision lowp sampler2D;
					//precision lowp samplerCube;
					
					//#version 300 es    //-->ES3
					
					#define glES
					#define texture(s,t) texture2D(s, t)
					#define in attribute
					#define out varying
					#define xflat
				////////////////////////////////////////////
				</glsl>		
				<cpp>
				#else
				</cpp>
				<glsl(this)>	
					//// Windows ///
					#version 330
					#define xflat flat
					///////////////
				</glsl>	
				<cpp>
				#endif
				</cpp>
				
				<glsl(this)>	
				///// nVertexID /////
				#ifdef glVxID
					#define nVertexID gl_VertexID
					in int gl_VertexID;
				#else
					in vec4 atVertexID;
					#define nVertexID int(atVertexID.x)
				#endif
				</glsl>
			}
		}
		
		
		override public function fSendToGpu(_sShader : String):Bool {
			
			nId = OpenGL.fCreateShader(VERTEX_SHADER);
			OpenGL.fShaderSource(nId, _sShader);
			//OpenGL.fCompileShader(nId);
			
			return true;
		}
		
		override public function fCompile():Bool {
			
			OpenGL.fCompileShader(nId);
			
			var _nCompilationStatus : UInt;
			_nCompilationStatus = OpenGL.fGetShaderParameter(nId, COMPILE_STATUS);
			//OpenGL.fGetShaderParameter(nId, COMPILE_STATUS, _nCompilationStatus);
			
			<cpp>
				//GL_fCompileShader(nId);
				//gzInt _nCompilationStatus = 0;
			//	GL_fGetShaderiv(nId, GL_COMPILE_STATUS, &_nCompilationStatus);
				if(_nCompilationStatus == 0){
					return false;
				}
				bReady = true;
				return true;
			</cpp>
		}
		
		
		//#include <stdlib.h>     /* strtol */
		override public function fGetLog():String {
			
			return OpenGL.fGetShaderInfoLog(nId);
		
		}
			
	}
}