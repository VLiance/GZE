package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.VertexShader;
	
	public overclass OpVertexShader overplace VertexShader {
		
						
		public function OpVertexShader(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			//Debug.fTrace("--- OpVertexShader Created!! ---");
			VertexShader(_hGlsl_ES_Version);
			
			fAddHeader();
		}
		

		
		override public function fAddHeader():Void {
			if(hGlsl_ES_Version == eGlsl_ES_Version.Auto){
				//Debug.fTrace("--****************--");
				
				<cpp>
					#ifdef D_Platform_Web_Emsc
				</cpp>
				
				<glsl(this)>
					#version 300 es //WebGl 2 / ES3
					#line 2
					precision mediump float;  //highp only works in fragment shaders if you have the GL_FRAGMENT_PRECISION_HIGH extension enabled.
					precision mediump int;  //highp only works in fragment shaders if you have the GL_FRAGMENT_PRECISION_HIGH extension enabled.
					//#define texture(s,t) texture2D(s, t) //WebGl2 not required
					
					///#version 100  //-->ES2/ WebGl 1
					
					////////////////// ES2 //////////////////////
					//Default Value
					//precision highp float;
					//precision highp int;
					//precision lowp sampler2D;
					//precision lowp samplerCube;
					
					//#version 300 es    //-->ES3
					
					#define glES
					
					//#define in attribute
					//#define out varying
					#define xflat flat
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
				
				//glVxID -> Needed for WebGL firefox ANGLE : n Direct3D 9 stream 0 must be specified as indexed data
				//and it cannot be instanced. In ANGLE we can work around this by
				// remapping any other stream that does have indexed data (ie a zero
				//attribute divisor) to stream 0 in D3D9. This works because the HLSL
				// vertex shader matches attributes against the stream by using the 
				// shader semantic index.

				<glsl(this)>	
				///// nVertexID /////
				//#define glVxID /// For ES2 or WebGL Angle if no other attribute with dividor 0 is specified
				#ifdef glVxID
					#define nVertexID gl_VertexID
					//	in int gl_VertexID; //already declared by default? Don't work in ES3 (redeclaration)
				#else
					in vec4 atVertexID;
					#define nVertexID int(atVertexID.x)
				#endif
				
				uniform vec2 iResolution;
				uniform vec2 iMouse;
				uniform float iTime;
				
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
				if(_nCompilationStatus != 1){
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