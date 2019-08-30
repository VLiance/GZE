package  { 

	import GZ.Gpu.GpuInfo;
	import GzOpenGL.OpenGL;
	
	
	<cpp_h>
		#include "Lib_GzOpenGL_Windows/glWin.h"
	
		#undef GL_NO_ERROR
		#define GL_NO_ERROR                       0
		#define GL_INVALID_ENUM                   0x0500
		#define GL_INVALID_VALUE                  0x0501
		#define GL_INVALID_OPERATION              0x0502
		#define GL_STACK_OVERFLOW                 0x0503
		#define GL_STACK_UNDERFLOW                0x0504
		#define GL_OUT_OF_MEMORY                  0x0505
		
		
		

		//HGLRC cSysGPU::hRcGlobalShared = 0;
		//HDC cSysGPU::hDcGlobal = 0;
		#define WGL_DRAW_TO_WINDOW         0x2001
		#define WGL_SUPPORT_OPENGL         0x2010
		#define WGL_DOUBLE_BUFFER          0x2011
		#define WGL_PIXEL_TYPE             0x2013
		#define WGL_TYPE_RGBA              0x202B
		#define WGL_COLOR_BITS             0x2014
		#define WGL_DEPTH_BITS             0x2022
		#define WGL_STENCIL_BITS           0x2023

		#define WGL_CONTEXT_MAJOR_VERSION  0x2091
		#define WGL_CONTEXT_MINOR_VERSION  0x2092
		#define WGL_CONTEXT_FLAGS          0x2094
		///#define WGL_CONTEXT_FORWARD_COMPATIBLE_BIT 0x00000002
		//#define WGL_CONTEXT_CORE_Gpu/Gpu 0x00000001


		//Blend
		#define GL_CONSTANT_COLOR                 0x8001
		#define GL_ONE_MINUS_CONSTANT_COLOR       0x8002
		#define GL_CONSTANT_ALPHA                 0x8003
		#define GL_ONE_MINUS_CONSTANT_ALPHA       0x8004
		#define GL_BLEND_COLOR                    0x8005
		#define GL_FUNC_ADD                       0x8006
		#define GL_MIN                            0x8007
		#define GL_MAX                            0x8008
		#define GL_BLEND_EQUATION                 0x8009
		#define GL_FUNC_SUBTRACT                  0x800A
		#define GL_FUNC_REVERSE_SUBTRACT          0x800B

		//Shader	
		#define GL_COMPILE_STATUS                 0x8B81
		#define GL_LINK_STATUS                    0x8B82
		#define GL_VERTEX_SHADER                  0x8B31
		#define GL_FRAGMENT_SHADER                0x8B30

		#define  GL_vec1 1
		#define  GL_vec2 2
		#define  GL_vec3 3
		#define  GL_vec4 4

		#define  GL_float_vec1 (1 * sizeof(gzFloat32))
		#define  GL_float_vec2 (2 * sizeof(gzFloat32))
		#define  GL_float_vec3 (3 * sizeof(gzFloat32))
		#define  GL_float_vec4 (4 * sizeof(gzFloat32))


		#define GL_FALSE                          0
		#define GL_TRUE                           1

		// DataType
		#define GL_BYTE                           0x1400
		#define GL_UNSIGNED_BYTE                  0x1401
		#define GL_FLOAT                          0x1406

		#define GL_STREAM_DRAW                    0x88E0
		#define GL_STREAM_READ                    0x88E1
		#define GL_STREAM_COPY                    0x88E2
		#define GL_STATIC_DRAW                    0x88E4
		#define GL_STATIC_READ                    0x88E5
		#define GL_STATIC_COPY                    0x88E6
		#define GL_DYNAMIC_DRAW                   0x88E8
		#define GL_DYNAMIC_READ                   0x88E9
		#define GL_DYNAMIC_COPY                   0x88EA

		/// BeginMode
		#define GL_POINTS                         0x0000
		#define GL_LINES                          0x0001
		#define GL_LINE_LOOP                      0x0002
		#define GL_LINE_STRIP                     0x0003
		#define GL_TRIANGLES                      0x0004
		#define GL_TRIANGLE_STRIP                 0x0005
		#define GL_TRIANGLE_FAN                   0x0006

		// BlendingFactorDest 
		#define GL_ZERO                           0
		#define GL_ONE                            1
		#define GL_SRC_COLOR                      0x0300
		#define GL_ONE_MINUS_SRC_COLOR            0x0301
		#define GL_SRC_ALPHA                      0x0302
		#define GL_ONE_MINUS_SRC_ALPHA            0x0303
		#define GL_DST_ALPHA                      0x0304
		#define GL_ONE_MINUS_DST_ALPHA            0x0305
		#define GL_DST_COLOR                      0x0306
		#define GL_ONE_MINUS_DST_COLOR            0x0307
		#define GL_SRC_ALPHA_SATURATE             0x0308

		#define GL_ARRAY_BUFFER                 0x8892

		#define GL_FRAMEBUFFER                    0x8D40
		#define GL_RENDERBUFFER                   0x8D41
		#define GL_DEPTH_ATTACHMENT               0x8D00
		#define GL_STENCIL_ATTACHMENT             0x8D20

				
		////// FBO
		#define GL_MAX_COLOR_ATTACHMENTS          0x8CDF
		#define GL_COLOR_ATTACHMENT0              0x8CE0
		#define GL_COLOR_ATTACHMENT1              0x8CE1
		#define GL_COLOR_ATTACHMENT2              0x8CE2
		#define GL_COLOR_ATTACHMENT3              0x8CE3
		#define GL_COLOR_ATTACHMENT4              0x8CE4
		#define GL_COLOR_ATTACHMENT5              0x8CE5
		#define GL_COLOR_ATTACHMENT6              0x8CE6
		#define GL_COLOR_ATTACHMENT7              0x8CE7
		#define GL_COLOR_ATTACHMENT8              0x8CE8
		#define GL_COLOR_ATTACHMENT9              0x8CE9
		#define GL_COLOR_ATTACHMENT10             0x8CEA
		#define GL_COLOR_ATTACHMENT11             0x8CEB
		#define GL_COLOR_ATTACHMENT12             0x8CEC
		#define GL_COLOR_ATTACHMENT13             0x8CED
		#define GL_COLOR_ATTACHMENT14             0x8CEE
		#define GL_COLOR_ATTACHMENT15             0x8CEF
		
	</cpp_h>
	
		
	
	public class OpGpuInfo overplace GpuInfo  {
		
		
		<cpp_class_h>
		inline gzStr fGetFile(const char *_cFile){
			gzStr _sFile = gzStrC(_cFile);
			_sFile.fReplaceAll(gzStrL("\\"), gzStrL("/"));
			return _sFile;
		}
		</cpp_class_h>
		
		
		public pure function  fGetErrorString( _nError : UInt):Void {
			<cpp>
			switch (_nError) {
				case GL_NO_ERROR :
					return gzStrL("GL_NO_ERROR");
				break;
				case GL_INVALID_ENUM :
					return gzStrL("GL_INVALID_ENUM");
				break;
				case GL_INVALID_VALUE :
					return gzStrL("GL_INVALID_VALUE");
				break;
				case GL_INVALID_OPERATION :
					return gzStrL("GL_INVALID_OPERATION");
				break;
				case GL_STACK_OVERFLOW :
					return gzStrL("GL_STACK_OVERFLOW");
				break;
				case GL_STACK_UNDERFLOW :
					return gzStrL("GL_STACK_UNDERFLOW");
				break;
				case GL_OUT_OF_MEMORY :
					return gzStrL("GL_OUT_OF_MEMORY");
				break;
				default :
					return gzStrL("GL_UNKNOW(") + gzStrUI(_nError) + gzStrL(")");
				break;
			}
			</cpp>
		}
		
		
		override public function fIniFunctions():Bool{
			
			<cpp>
			Lib_GzOpenGL::SysGpuFunc::fGetGpuFunctions(); //Only if not already done
			</cpp>
	
			return true;
		}
		
		
		
		override public function fGetVersion():Bool{
			
			var _nMaj : Int = 0;
			var _nMin : Int = 0;

			OpenGL.fGetIntegerv(MAJOR_VERSION, _nMaj);
			OpenGL.fGetIntegerv(MINOR_VERSION, _nMin);

			GpuInfo.nVersionMinor = _nMin;
			GpuInfo.nVersionMajor = _nMaj;
			
			<cpp>
			#define GZ_OpenGL_MinimalVersionMajor 3
			#define GZ_OpenGL_MinimalVersionMinor 3
			if( _nMaj <  GZ_OpenGL_MinimalVersionMajor){
				return false;
			}
			if( _nMaj ==  GZ_OpenGL_MinimalVersionMajor && _nMin <  GZ_OpenGL_MinimalVersionMinor){
			  return false;
			}
			</cpp>
			
			Debug.fTrace("GetVersion : nVersionMinor" + GpuInfo.nVersionMinor );
			Debug.fTrace("GetVersion : nVersionMajor" + GpuInfo.nVersionMajor );
			return true;

			
		}
		
		
		
		
		
		
	}
}