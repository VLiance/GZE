package  { 

	import GZ.Gpu.GpuInfo;
	import GzOpenGL.OpenGL;
	
	
	<cpp_h>
	
		#define GL_TEXTURE_FOMAT GL_BGRA

		#ifdef D_Platform_Windows
		#include "Lib_GzOpenGL_Windows/GlWin.h"
		#endif
	
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

		
		#define GL_CLAMP_TO_EDGE                  0x812F

		#define GL_BGR                            0x80E0
		#define GL_BGRA                           0x80E1

		#define GL_STREAM_DRAW                    0x88E0
		#define GL_STREAM_READ                    0x88E1
		#define GL_STREAM_COPY                    0x88E2
		#define GL_STATIC_DRAW                    0x88E4
		#define GL_STATIC_READ                    0x88E5
		#define GL_STATIC_COPY                    0x88E6
		#define GL_DYNAMIC_DRAW                   0x88E8
		#define GL_DYNAMIC_READ                   0x88E9
		#define GL_DYNAMIC_COPY                   0x88EA


		#define GL_ARRAY_BUFFER                 0x8892



		#define GL_FRAMEBUFFER                    0x8D40
		#define GL_RENDERBUFFER                   0x8D41
		#define GL_DEPTH_ATTACHMENT               0x8D00
		#define GL_STENCIL_ATTACHMENT             0x8D20

/* See eCOLOR_ATTACHMENTS
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
		/////////////////
*/
		#define  GL_vec1 1
		#define  GL_vec2 2
		#define  GL_vec3 3
		#define  GL_vec4 4

		#define  GL_float_vec1 (1 * sizeof(gzFloat32))
		#define  GL_float_vec2 (2 * sizeof(gzFloat32))
		#define  GL_float_vec3 (3 * sizeof(gzFloat32))
		#define  GL_float_vec4 (4 * sizeof(gzFloat32))

		#define  GL_ATTRIB_POSITION 0
		#define  GL_ATTRIB_SOURCE_1  1
		#define  GL_ATTRIB_SOURCE_2  15
		#define  GL_ATTRIB_CORNER   2
		#define  GL_ATTRIB_TEXCOORD 3
		#define  GL_ATTRIB_COLOR_1  4
		#define  GL_ATTRIB_COLOR_2  5
		#define  GL_ATTRIB_COLOR_3  6
		#define  GL_ATTRIB_COLOR_4  7
		#define  GL_ATTRIB_OBJ_POS  8
		#define  GL_ATTRIB_OBJ_ROT  9

		#define  GL_ATTRIB_PT_1     11
		#define  GL_ATTRIB_PT_2     12
		#define  GL_ATTRIB_PT_3     13
		#define  GL_ATTRIB_PT_4     14


		/* See texture
		//TEXTURE
		#define GL_TEXTURE0                       0x84C0
		#define GL_TEXTURE1                       0x84C1
		#define GL_TEXTURE2                       0x84C2
		#define GL_TEXTURE3                       0x84C3
		#define GL_TEXTURE4                       0x84C4
		#define GL_TEXTURE5                       0x84C5
		#define GL_TEXTURE6                       0x84C6
		#define GL_TEXTURE7                       0x84C7
		#define GL_TEXTURE8                       0x84C8
		#define GL_TEXTURE9                       0x84C9
		#define GL_TEXTURE10                      0x84CA
		#define GL_TEXTURE11                      0x84CB
		#define GL_TEXTURE12                      0x84CC
		#define GL_TEXTURE13                      0x84CD
		#define GL_TEXTURE14                      0x84CE
		#define GL_TEXTURE15                      0x84CF
		#define GL_TEXTURE16                      0x84D0
		#define GL_TEXTURE17                      0x84D1
		#define GL_TEXTURE18                      0x84D2
		#define GL_TEXTURE19                      0x84D3
		#define GL_TEXTURE20                      0x84D4
		#define GL_TEXTURE21                      0x84D5
		#define GL_TEXTURE22                      0x84D6
		#define GL_TEXTURE23                      0x84D7
		#define GL_TEXTURE24                      0x84D8
		#define GL_TEXTURE25                      0x84D9
		#define GL_TEXTURE26                      0x84DA
		#define GL_TEXTURE27                      0x84DB
		#define GL_TEXTURE28                      0x84DC
		#define GL_TEXTURE29                      0x84DD
		#define GL_TEXTURE30                      0x84DE
		#define GL_TEXTURE31                      0x84DF
		#define GL_ACTIVE_TEXTURE                 0x84E0
		#define GL_TEXTURE_2D_ARRAY               0x8C1A
*/
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


		#define GL_MAX_ARRAY_TEXTURE_LAYERS 0x88FF


		#define GL_READ_ONLY                  0x88B8
		#define GL_WRITE_ONLY                 0x88B9
		#define GL_READ_WRITE                 0x88BA
		#define GL_BUFFER_ACCESS              0x88BB
		#define GL_BUFFER_MAPPED              0x88BC
		#define GL_BUFFER_MAP_POINTER         0x88BD
		#define GL_STREAM_DRAW                0x88E0
		#define GL_STREAM_READ                0x88E1
		#define GL_STREAM_COPY                0x88E2
		#define GL_STATIC_DRAW                0x88E4
		#define GL_STATIC_READ                0x88E5
		#define GL_STATIC_COPY                0x88E6
		#define GL_DYNAMIC_DRAW               0x88E8
		#define GL_DYNAMIC_READ               0x88E9
		#define GL_DYNAMIC_COPY               0x88EA

		#define GL_MAP_READ_BIT                   0x0001
		#define GL_MAP_WRITE_BIT                  0x0002
		#define GL_MAP_INVALIDATE_RANGE_BIT       0x0004
		#define GL_MAP_INVALIDATE_BUFFER_BIT      0x0008
		#define GL_MAP_FLUSH_EXPLICIT_BIT         0x0010
		#define GL_MAP_UNSYNCHRONIZED_BIT         0x0020
		
	</cpp_h>
	
		

	
	public class OpGpuInfo overplace GpuInfo  {
		
		
		<cpp_class_h>
		inline static gzStr fGetFile(const char *_cFile){
			gzStr _sFile = gzStrC(_cFile);
			_sFile.fReplaceAll(gzU8("\\"), gzU8("/"));
			return _sFile;
		}
		</cpp_class_h>
		
	
		public pure function  fGetErrorString( _nError : UInt):String {
			<cpp>
			switch (_nError) {
				case GL_NO_ERROR :
					return gzU8("GL_NO_ERROR");
				break;
				case GL_INVALID_ENUM :
					return gzU8("GL_INVALID_ENUM");
				break;
				case GL_INVALID_VALUE :
					return gzU8("GL_INVALID_VALUE");
				break;
				case GL_INVALID_OPERATION :
					return gzU8("GL_INVALID_OPERATION");
				break;
				case GL_STACK_OVERFLOW :
					return gzU8("GL_STACK_OVERFLOW");
				break;
				case GL_STACK_UNDERFLOW :
					return gzU8("GL_STACK_UNDERFLOW");
				break;
				case GL_OUT_OF_MEMORY :
					return gzU8("GL_OUT_OF_MEMORY");
				break;
				default :
					return gzU8("GL_UNKNOW(") + gzStrUI(_nError) + gzU8(")");
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