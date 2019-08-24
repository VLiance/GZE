package  { 

	import GzOpenGL.OpenGL;
	
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.FragmentShader;
	
	public class OpFragmentShader overplace FragmentShader {
		
		public function OpFragmentShader(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			Debug.fTrace("--- OpFragmentShader Created!! ---");
			FragmentShader(_hGlsl_ES_Version);
			
			if(_hGlsl_ES_Version == eGlsl_ES_Version.Auto){
				<cpp>
			#ifdef GZ_tWeb_Emsc
			</cpp>
				
				<glsl(this)>
					///#ifdef GZ_tAndroid   //ES2
					#version 100
					precision highp float;  //highp only works in fragment shaders if you have the GL_FRAGMENT_PRECISION_HIGH extension enabled.
					precision highp int;  //highp only works in fragment shaders if you have the GL_FRAGMENT_PRECISION_HIGH extension enabled.
					#define texture(s,t) texture2D(s, t)
					#define in varying
					#define FragColor gl_FragColor
					#define FragData gl_FragData
					#define xflat
					///#endif // GZ_tAndroid
				</glsl>	
			
				<cpp>
				#else
				</cpp>
				
				<glsl(this)>
					//#ifdef GZ_tWindows  //GL 3.3 minimal
					#version 330
					#define xflat flat
					out vec4 FragColor;
					///#endif
				</glsl>	
				
				<cpp>
				#endif
				</cpp>
			}
			
		}
		
		override public function fSendToGpu(_sShader : String):Bool {
			
			nId = OpenGL.fCreateShader(FRAGMENT_SHADER);
			OpenGL.fShaderSource(nId, _sShader);
			//OpenGL.fCompileShader(nId);
			return true;
		}
		
		override public function fCompile():Bool {
			OpenGL.fCompileShader(nId);
			var _nCompilationStatus : UInt;
			_nCompilationStatus = OpenGL.fGetShaderParameter(nId, COMPILE_STATUS);
			
			<cpp>
				//GL_fCompileShader(nId);
				//gzInt _nCompilationStatus = 0;
				//GL_fGetShaderiv(nId, GL_COMPILE_STATUS, &_nCompilationStatus);
				if(_nCompilationStatus == 0){
					return false;
				}
				bReady = true;
				return true;
			</cpp>
		}
		//#include <stdlib.h>     /* strtol */
		override public function fGetLog():String {
			/*
			var _aLogBuff : CArray<UInt8, 1>;
			var _nLength : UInt;
			var _nSize : UInt;
			<cpp>
			//the size of the buffer required to store the returned information log can be obtained by calling	glGetShader with the value GL_INFO_LOG_LENGTH.
			char logBuf[8024]; //Max length?
			_aLogBuff = (gzUInt8*)logBuf;
			_nSize = sizeof(logBuf);
			</cpp>
			*/
			var _sReturn : String = OpenGL.fGetShaderInfoLog(nId);
			
			<cpp>
			_sReturn = _sReturn.fToUTF8().fFinalize();
			 char* _str = ( char* )_sReturn.get();

			 
		//	nLineError = strtol( &_str[2] , GZ_Null, 10) - 1; //Windows 
		
			int _nStartIndex = 1;
			if(_str[0] == 'E'){
				_nStartIndex += 5;
			}
			char* pEnd;
			 
			nSourceError = strtol( &_str[_nStartIndex], &pEnd, 10);
			nLineError = strtol(&pEnd[1], GZ_Null, 10) - 1; //Skip ':'
		
			</cpp>
			Debug.fTrace("LineErr: " + nLineError);
			return _sReturn;
			//gzInt _nLength;
			//GL_fGetShaderInfoLog(nId, sizeof(logBuf), &_nLength, (gzUInt8*)logBuf );
			/*
			<cpp>
			nLineError = strtol( &logBuf[2] , GZ_Null, 10) - 1;
			sLog = gzStrC(logBuf, _nLength);
			return sLog;
			</cpp>
			*/
		}


				
	}
}