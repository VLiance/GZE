#addDebugFile

generate "OpenGL" {
	
	public class OpenGL {
		
		//public static var oGL : OpenGL;
		
		<cpp_h>
		
		#ifdef D_Platform_Android
			//#include "Lib_GzOpenGL_Android/OGL_Android.h"
			#define GL_APICALL extern "C" __attribute__((visibility("default")))
		#endif
		
		#ifdef D_Platform_Web_Emsc
			#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
		#endif
			
		extern void* gzEmscPtrBuffer;
		</cpp_h>
		
		<cpp_namespace_h>
		#ifdef D_Platform_Web_Emsc
		//extern val oGL;
		//val oGL = val::global("Null");
		#endif
		</cpp_namespace_h>
		
		<cpp_namespace>
		#ifdef D_Platform_Web_Emsc
		//val oGL = val::global("Null");
		#endif
		</cpp_namespace>	

		<cpp_class_h>
			gzVal oGL;
		</cpp_class_h>
		
		/*
		public enum eBlendFunc : Int {
				ZERO                    = 0x01;
				ONE                     = 0x02;
				SRC_ALPHA               = 0x03;
				DST_ALPHA               = 0x04;
				ONE_MINUS_SRC_ALPHA     = 0x05;
				ONE_MINUS_DST_ALPHA     = 0x06;
		}*/
		
		public enum eBlendFunc : Int {
				ZERO                    =  0;
				ONE                     =  1;
				SRC_COLOR               = 0x0300;
				ONE_MINUS_SRC_COLOR     = 0x0301;
				SRC_ALPHA               = 0x0302;
				ONE_MINUS_SRC_ALPHA     = 0x0303;
				DST_ALPHA               = 0x0304;
				ONE_MINUS_DST_ALPHA     = 0x0305;
		}
		
		
		public enum eParameter_Int  : Int {
			MAX_COMBINED_TEXTURE_IMAGE_UNITS  =  0x8B4D;
			MAX_CUBE_MAP_TEXTURE_SIZE  =  0x851C;
			MAX_FRAGMENT_UNIFORM_VECTORS  =  0x8DFD;
			MAX_RENDERBUFFER_SIZE  =  0x84E8;
			MAX_TEXTURE_IMAGE_UNITS  =  0x8872;
			MAX_TEXTURE_SIZE   =  0x0D33;
			MAX_VARYING_VECTORS  =  0x8DFC;
			MAX_VERTEX_ATTRIBS  =  0x8869;
			MAX_VERTEX_TEXTURE_IMAGE_UNITS  = 0x8B4C;	
			MAX_VERTEX_UNIFORM_VECTORS  =  0x8DFB;
			MAX_3D_TEXTURE_SIZE  =  0x8073;//WebGL2
			MAX_ARRAY_TEXTURE_LAYERS  =  0x88FF;
			MAX_CLIENT_WAIT_TIMEOUT_WEBGL  =  0x9247;
			MAX_COLOR_ATTACHMENTS  =  0x8CDF;
			MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS  =  0x8A33;
			MAX_COMBINED_UNIFORM_BLOCKS  =  0x8A2E;
			MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS  =  0x8A31;
			MAX_DRAW_BUFFERS  =  0x8824;
			MAX_ELEMENT_INDEX  =  0x8D6B;
			MAX_ELEMENTS_INDICES  =  0x80E9;
			MAX_ELEMENTS_VERTICES  =  0x80E8;
			MAX_FRAGMENT_INPUT_COMPONENTS  =  0x9125;
			MAX_FRAGMENT_UNIFORM_BLOCKS  =  0x8A2D;
			MAX_FRAGMENT_UNIFORM_COMPONENTS  =  0x8B49;
			MAX_PROGRAM_TEXEL_OFFSET  =  0x8905;
			MAX_SAMPLES  =  0x8D57;
			MAX_SERVER_WAIT_TIMEOUT  =  0x9111;
			MAX_TEXTURE_LOD_BIAS  =  0x84FD;
			MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS  =  0x8C8A;
			MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS  =  0x8C8B;
			MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS  =  0x8C80;
			MAX_UNIFORM_BLOCK_SIZE  =  0x8A30;
			MAX_UNIFORM_BUFFER_BINDINGS  =  0x8A2F;
			MAX_VARYING_COMPONENTS  =  0x8B4B;
			MAX_VERTEX_OUTPUT_COMPONENTS  = 0x9122;
			MAX_VERTEX_UNIFORM_BLOCKS  =  0x8A2B;
			MAX_VERTEX_UNIFORM_COMPONENTS  = 0x8B4A;
			MIN_PROGRAM_TEXEL_OFFSET  =  0x8904;
			MAJOR_VERSION = 0x821B;  //Others
			MINOR_VERSION = 0x821C;
		}
		
		
		
		public enum eShaderInfo : Int {
			SHADER_TYPE      = 0x8B4F;
			DELETE_STATUS    = 0x8B80;
			COMPILE_STATUS      = 0x8B81;
			INFO_LOG_LENGTH  = 0x8B84;
			SHADER_SOURCE_LENGTH = 0x8B88;
		}
		
		
		public enum eProgramInfo : Int {
			LINK_STATUS      = 0x8B82;
		}
		
		
		public enum eShader : Int {
			VERTEX_SHADER    = 0x8B31;
			FRAGMENT_SHADER  = 0x8B30;
		}

		public enum eGetName : Int {
			TODO;
		}
		
		
		public enum eCapability : Int { //TODO all other
			BLEND	= 0x0BE2;
		}
		/*
#define GL_LIGHTING                       0x0B50
#define GL_TEXTURE_2D                     0x0DE1
#define GL_CULL_FACE                      0x0B44
#define GL_ALPHA_TEST                     0x0BC0
#define GL_BLEND                          0x0BE2
#define GL_STENCIL_TEST                   0x0B90
#define GL_DEPTH_TEST                     0x0B71
#define GL_LIGHT0                         0x4000
#define GL_LIGHT1                         0x4001
#define GL_POINT_SMOOTH                   0x0B10
#define GL_LINE_STIPPLE                   0x0B24
#define GL_LINE_SMOOTH                    0x0B20
#define GL_SCISSOR_TEST                   0x0C11
#define GL_COLOR_MATERIAL                 0x0B57
#define GL_NORMALIZE                      0x0BA1
#define GL_RESCALE_NORMAL                 0x803A
#define GL_POLYGON_OFFSET_FILL            0x8037
#define GL_POLYGON_STIPPLE                0x0B42
#define GL_VERTEX_ARRAY                   0x8074
#define GL_NORMAL_ARRAY                   0x8075
#define GL_COLOR_ARRAY                    0x8076
#define GL_TEXTURE_COORD_ARRAY            0x8078
*/
		
		

		
		/*
	//Specifies the number of color components in the texture.
                    Must be 1, 2, 3, or 4, or one of the following symbolic constants:
                    GL_ALPHA,
                    GL_ALPHA4,
                    GL_ALPHA8,
                    GL_ALPHA12,
                    GL_ALPHA16,
                    GL_COMPRESSED_ALPHA,
                    GL_COMPRESSED_LUMINANCE,
                    GL_COMPRESSED_LUMINANCE_ALPHA,
                    GL_COMPRESSED_INTENSITY,
                    GL_COMPRESSED_RGB,
                    GL_COMPRESSED_RGBA,
                    GL_DEPTH_COMPONENT,
                    GL_DEPTH_COMPONENT16,
                    GL_DEPTH_COMPONENT24,
                    GL_DEPTH_COMPONENT32,
                    GL_LUMINANCE,
                    GL_LUMINANCE4,
                    GL_LUMINANCE8,
                    GL_LUMINANCE12,
                    GL_LUMINANCE16,
                    GL_LUMINANCE_ALPHA,
                    GL_LUMINANCE4_ALPHA4,
                    GL_LUMINANCE6_ALPHA2,
                    GL_LUMINANCE8_ALPHA8,
                    GL_LUMINANCE12_ALPHA4,
                    GL_LUMINANCE12_ALPHA12,
                    GL_LUMINANCE16_ALPHA16,
                    GL_INTENSITY,
                    GL_INTENSITY4,
                    GL_INTENSITY8,
                    GL_INTENSITY12,
                    GL_INTENSITY16,
                    GL_R3_G3_B2,
                    GL_RGB,
                    GL_RGB4,
                    GL_RGB5,
                    GL_RGB8,
                    GL_RGB10,
                    GL_RGB12,
                    GL_RGB16,
                    GL_RGBA,
                    GL_RGBA2,
                    GL_RGBA4,
                    GL_RGB5_A1,
                    GL_RGBA8,
                    GL_RGB10_A2,
                    GL_RGBA12,
                    GL_RGBA16,
                    GL_SLUMINANCE,
                    GL_SLUMINANCE8,
                    GL_SLUMINANCE_ALPHA,
                    GL_SLUMINANCE8_ALPHA8,
                    GL_SRGB,
                    GL_SRGB8,
                    GL_SRGB_ALPHA, or 
                    GL_SRGB8_ALPHA8.
                */	
		
	//Specifies the format of the pixel data. The following symbolic values are accepted: GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL. 	
		public enum ePixelFormat : Int {	
			ALPHA                          = 0x1906;
			RGB                            = 0x1907;
			RGBA                           = 0x1908;
			LUMINANCE                      = 0x1909;
			LUMINANCE_ALPHA                = 0x190A;
			BGR                            = 0x80E0;
			BGRA                           = 0x80E1;
			DEPTH_COMPONENT				   = 0x1902
			DEPTH_COMPONENT16              = 0x81A5
			DEPTH_COMPONENT24              = 0x81A6
			DEPTH_COMPONENT32              = 0x81A7
		}


		
		public enum eInternalPixelFormat : Int {	
			ALPHA                          = 0x1906;
			RGB                            = 0x1907;
			RGBA                           = 0x1908;
			LUMINANCE                      = 0x1909;
			LUMINANCE_ALPHA                = 0x190A;
			DEPTH_COMPONENT				   = 0x1902
			DEPTH_COMPONENT16              = 0x81A5
			DEPTH_COMPONENT24              = 0x81A6
			DEPTH_COMPONENT32              = 0x81A7
		} //TODO add Table 2. Sized Internal Formats

		
		
		public enum ePixelStoreParameter : Int {
			UNPACK_ALIGNMENT               = 0x0CF5;
			PACK_ALIGNMENT                 = 0x0D05;
		}

		/* PixelType */
		//The following symbolic values are accepted: GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_HALF_FLOAT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV. 
		public enum ePixelType : Int {
			UNSIGNED_SHORT_4_4_4_4         = 0x8033;
			UNSIGNED_SHORT_5_5_5_1         = 0x8034;
			UNSIGNED_SHORT_5_6_5           = 0x8363;
			BYTE 						   = 0x1400;
			UNSIGNED_BYTE				   = 0x1401;
			FLOAT 					   	   = 0x1406;
		}

		public enum eShadingModel : Int {
			FLAT                           = 0x1D00;
			SMOOTH                         = 0x1D01;
		}
				
		public enum eTargetTexture : Int {
			TEXTURE_1D = 0x0DE0
			TEXTURE_2D = 0x0DE1
			TEXTURE_3D = 0x806F
			TEXTURE_1D_ARRAY = 0x8C18
			TEXTURE_2D_ARRAY = 0x8C1A
			TEXTURE_BUFFER = 0x8C2A
			TEXTURE_CUBE_MAP = 0x8513
			TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515
			TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516
			TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517
			TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518
			TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519
			TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A
			TEXTURE_RECTANGLE = 0x84F5
			TEXTURE_2D_MULTISAMPLE = 0x9100
			TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102
		}
		
		public enum eDrawMode : Int {
			POINTS = 0x0000;
			PATCHES = 0x000E;
			LINES = 0x0001;
			LINE_LOOP = 0x0002;
			LINES_ADJACENCY = 0x000A;
			LINE_STRIP = 0x0003;
			LINE_STRIP_ADJACENCY = 0x000B;
			TRIANGLES = 0x0004;
			TRIANGLE_FAN = 0x0006; 
			TRIANGLES_ADJACENCY = 0x000C;
			TRIANGLE_STRIP = 0x0005;
			TRIANGLE_STRIP_ADJACENCY = 0x000D;
		}
		
		public enum eDrawFlow : Int {
			STREAM_DRAW = 0x88E0;
			STATIC_DRAW = 0x88E4;
			DYNAMIC_DRAW = 0x88E8;
		}
		
		
		public enum eTypeSize : Int {
			Float32 = 4;
			Float64 = 8;
			Int8  =  1;
			Int16 =  2;
			Int32 =  4;
			Vec1  = 1*4;
			Vec2  = 2*4;
			Vec3  = 3*4;
			Vec4  = 4*4;
		}
	
		
		public enum eVarType : Int {
			BYTE = 0x1400;
			UNSIGNED_BYTE = 0x1401;
			FLOAT = 0x1406;
		}
		
		public enum eClearBuffer : Int {
			COLOR_BUFFER_BIT   = 0x00004000;
			DEPTH_BUFFER_BIT   = 0x00000100;
			STENCIL_BUFFER_BIT = 0x00000400;
		}
		
		public enum eVecLength : Int {
			Vec1  = 1;
			Vec2  = 2;
			Vec3  = 3;
			Vec4  = 4;
		}
		
		public enum eTextureMinFilter : Int {
			NEAREST                        = 0x2600
			LINEAR                         = 0x2601
			NEAREST_MIPMAP_NEAREST         = 0x2700
			LINEAR_MIPMAP_NEAREST          = 0x2701
			NEAREST_MIPMAP_LINEAR          = 0x2702
			LINEAR_MIPMAP_LINEAR           = 0x2703
		}
		
		/* TextureMagFilter */
		public enum eTextureMagFilter : Int {
			NEAREST                        = 0x2600
			LINEAR                         = 0x2601	
		}	
		
		public enum eTextureWrapMode : Int {	
			REPEAT                         = 0x2901
			CLAMP_TO_EDGE                  = 0x812F
			MIRRORED_REPEAT                = 0x8370
			CLAMP_TO_BORDER                = 0x812D
			MIRROR_CLAMP_TO_EDGE           = 0x8743
		}
		
		public enum eBufferTarget : Int {
			ARRAY_BUFFER		 = 0x8892;
			READ_BUFFER          = 0x0C02;
			TEXTURE_BUFFER       = 0x8C2A;
			TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
			UNIFORM_BUFFER_BINDING = 0x8A28;
			ELEMENT_ARRAY_BUFFER   = 0x8893;
			ARRAY_BUFFER_BINDING           = 0x8894;
			ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895;
		}
		

 //MAX_COLOR_ATTACHMENTS          0x8CDF;
 
		public enum eAttachments : Int {
			COLOR_ATTACHMENT0              = 0x8CE0;
			COLOR_ATTACHMENT1              = 0x8CE1;
			COLOR_ATTACHMENT2              = 0x8CE2;
			COLOR_ATTACHMENT3              = 0x8CE3;
			COLOR_ATTACHMENT4              = 0x8CE4;
			COLOR_ATTACHMENT5              = 0x8CE5;
			COLOR_ATTACHMENT6              = 0x8CE6;
			COLOR_ATTACHMENT7              = 0x8CE7;
			COLOR_ATTACHMENT8              = 0x8CE8;
			COLOR_ATTACHMENT9              = 0x8CE9;
			COLOR_ATTACHMENT10             = 0x8CEA;
			COLOR_ATTACHMENT11             = 0x8CEB;
			COLOR_ATTACHMENT12             = 0x8CEC;
			COLOR_ATTACHMENT13             = 0x8CED;
			COLOR_ATTACHMENT14             = 0x8CEE;
			COLOR_ATTACHMENT15             = 0x8CEF;
			DEPTH_ATTACHMENT               = 0x8D00
			STENCIL_ATTACHMENT             = 0x8D20
		}

	
		public enum eTexture : Int {
			TEXTURE0                       = 0x84C0;
			TEXTURE1                       = 0x84C1;
			TEXTURE2                       = 0x84C2;
			TEXTURE3                       = 0x84C3;
			TEXTURE4                       = 0x84C4;
			TEXTURE5                       = 0x84C5;
			TEXTURE6                       = 0x84C6;
			TEXTURE7                       = 0x84C7;
			TEXTURE8                       = 0x84C8;
			TEXTURE9                       = 0x84C9;
			TEXTURE10                      = 0x84CA;
			TEXTURE11                      = 0x84CB;
			TEXTURE12                      = 0x84CC;
			TEXTURE13                      = 0x84CD;
			TEXTURE14                      = 0x84CE;
			TEXTURE15                      = 0x84CF;
			TEXTURE16                      = 0x84D0;
			TEXTURE17                      = 0x84D1;
			TEXTURE18                      = 0x84D2;
			TEXTURE19                      = 0x84D3;
			TEXTURE20                      = 0x84D4;
			TEXTURE21                      = 0x84D5;
			TEXTURE22                      = 0x84D6;
			TEXTURE23                      = 0x84D7;
			TEXTURE24                      = 0x84D8;
			TEXTURE25                      = 0x84D9;
			TEXTURE26                      = 0x84DA;
			TEXTURE27                      = 0x84DB;
			TEXTURE28                      = 0x84DC;
			TEXTURE29                      = 0x84DD;
			TEXTURE30                      = 0x84DE;
			TEXTURE31                      = 0x84DF;
			ACTIVE_TEXTURE                 = 0x84E0;
			TEXTURE_2D_ARRAY               = 0x8C1A;
		}
		
		
	//Specifies the symbolic name of a single-valued texture parameter. pname can be one of the following: GL_DEPTH_STENCIL_TEXTURE_MODE, GL_TEXTURE_BASE_LEVEL, GL_TEXTURE_COMPARE_FUNC, GL_TEXTURE_COMPARE_MODE, GL_TEXTURE_LOD_BIAS, GL_TEXTURE_MIN_FILTER, GL_TEXTURE_MAG_FILTER, GL_TEXTURE_MIN_LOD, GL_TEXTURE_MAX_LOD, GL_TEXTURE_MAX_LEVEL, GL_TEXTURE_SWIZZLE_R, GL_TEXTURE_SWIZZLE_G, GL_TEXTURE_SWIZZLE_B, GL_TEXTURE_SWIZZLE_A, GL_TEXTURE_WRAP_S, GL_TEXTURE_WRAP_T, or GL_TEXTURE_WRAP_R.
	//For the vector commands (glTexParameter*v), pname can also be one of GL_TEXTURE_BORDER_COLOR or GL_TEXTURE_SWIZZLE_RGBA.	
	public enum eTextureParameterName : Int {

		TEXTURE_MAG_FILTER             = 0x2800
		TEXTURE_MIN_FILTER             = 0x2801
		TEXTURE_WRAP_S                 = 0x2802
		TEXTURE_WRAP_T                 = 0x2803
	}
	
	
	
	public enum eBindFramebuffer  : Int {
		FRAMEBUFFER                    = 0x8D40
		READ_FRAMEBUFFER               = 0x8CA8
		DRAW_FRAMEBUFFER               = 0x8CA9
	}
	public enum eBindRenderbuffer  : Int {
		RENDERBUFFER                   = 0x8D41
	}	
	

		//OGL
		public static function fGetError():UInt; //Must be first
		gen public static function fFlush():Void;
		gen public static function fEnable(_hName : eCapability):Void;
		gen public static function fDisable(_hName : eCapability):Void;
		gen public static function fDepthMask(_bEnable : Bool):Void;
		gen public static function fDepthFunc(_eFunc : UInt):Void;

		//gen public static function fGetBooleanv(_hName : eGetName, _pData:CArray<Bool>):Void; //Useless / Unsigned char?
		//gen public static function fGetDoublev(_hName : eGetName, _pData:CArray<Float64>):Void; //No android support
		gen public static function fGetFloatv(_hName : eGetName, _pData:CArray<Float32>):Void;
		gen public static function fGetIntegerv(_hName : eParameter_Int, _pData:CArray<Int32>):Void;
		gen public static function fGetInteger64v(_hName : eGetName, _pData:CArray<Int64>):Void;

		//gen public static function fGetBooleani_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Bool>)):Void; //No android support
		//gen public static function fGetIntegeri_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Float64>):Void; //No android support
		//gen public static function fGetFloati_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Float32>):Void; //No android support
		//gen public static function fGetDoublei_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Int32>):Void; //No android support
		//gen public static function fGetInteger64i_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Int64>)):Void; //No android support

		//Functions
		gen public static function fVertexAttribPointer(_nIndex : Val, _hLength: eVecLength, _hType: eVarType, _bNormalized: Bool, _nStride:Int, _nPointer:UInt ):Void;
		gen public static function fVertexAttribDivisor(_nIndex: Val, _nDivisor: UInt):Void;

		gen public static function fEnableVertexAttribArray(_nIndex : Val):Void;
		gen public static function fDisableVertexAttribArray(_nIndex : UInt):Void;

		gen Win public static function fSwapIntervalEXT(_nInterval : Int):Bool;

		//Blend
		gen public static function fBlendEquation(_eMode : UInt):Void;
		gen public static function fBlendFuncSeparate(_eSFactorRGB : UInt, _eDFactorRGB : UInt, _eSFactorAlpha : UInt, _eDFactorAlpha : UInt):Void;
		gen public static function fBlendFunc(_hSrcFactor : eBlendFunc, _hDstFactor : eBlendFunc):Void;


		//Shader
		gen public static function fGenVertexArrays(_nNb : Int, _aArrays:CArray<UInt>):Void;
		
		public static function fCreateBuffer():Val{
			<cpp>
				#ifdef D_Platform_Web_Emsc

					return oGL.call<val>("createBuffer");
					//return ::GZ::fConsole(gzU8("ScreateBuffer"));

				#else
					gzVal _nVal;
					GL_fGenBuffers(1, &_nVal);
					return _nVal;
				#endif
			</cpp>
		}
		gen private static function fGenBuffers(_nNb : Int, _aBuffers:CArray<UInt>)):Void;
		
		gen public static function fBindVertexArray(_nVAO: UInt):Void;
		gen public static function fBindBuffer(_hTarget : eBufferTarget, _nBuffer : Val):Void;

		
		
		
		gen public static function fBufferSubData(_hTarget : eBufferTarget, _nOffset:IntX, _nSize:IntX, _pData:Any):Void;
		
		
		public static function fGetProgramInfoLog(_nProgId : Val):String {
			<cpp>
			#ifdef D_Platform_Web_Emsc
				std::string _sTest = oGL.call<std::string>("getProgramInfoLog", _nProgId);	 //N
				return gzStrC(_sTest.c_str());
				 
			#else
				</cpp>
				var _aLogBuff : CArray<UInt8, 1>;
				var _nLength : Int;
				<cpp>
				//the size of the buffer required to store the returned information log can be obtained by calling	glGetShader with the value GL_INFO_LOG_LENGTH.
				char logBuf[8024]; //Max length?
				_aLogBuff = (gzUInt8*)logBuf;


				GL_fGetProgramInfoLog(_nProgId, sizeof(logBuf), &_nLength, (gzUInt8*)logBuf );
				//nLineError = strtol( &logBuf[2] , GZ_Null, 10) - 1;
				//GZ_printf("\n %s ", logBuf);
				return gzStrC(logBuf, _nLength);
			#endif
				</cpp>
		
		}
		
		gen public static function fGetProgramInfoLog(_nProgramId : Val, _nMaxLength : Int, _aLength : CArray<Int>, _cLogInfo:CArray<UInt8>):Void;

		
		
		public static function fGetShaderInfoLog(_nShaderId : Val):String {
			
			if(_nShaderId == null){
				return "Invalid Shader ID: 0";
			}

			<cpp>
			#ifdef D_Platform_Web_Emsc
				std::string _sTest = oGL.call<std::string>("getShaderInfoLog", _nShaderId);	 //N
				return gzStrC(_sTest.c_str());
				 
			#else
				</cpp>
				var _aLogBuff : CArray<UInt8, 1>;
				var _nLength : Int;
				<cpp>
				//the size of the buffer required to store the returned information log can be obtained by calling	glGetShader with the value GL_INFO_LOG_LENGTH.
				char logBuf[8024]; //Max length?
				_aLogBuff = (gzUInt8*)logBuf;


				GL_fGetShaderInfoLog(_nShaderId, sizeof(logBuf), &_nLength, (gzUInt8*)logBuf );
				//nLineError = strtol( &logBuf[2] , GZ_Null, 10) - 1;
				return gzStrC(logBuf, _nLength);
			#endif
				</cpp>
		
		}
		
		gen private static function fGetShaderInfoLog(_nShaderId : Val, _nMaxLength : Int, _aLength : CArray<Int>, _cLogInfo:CArray<UInt8>):Void;

		
		//Program
		gen public static function fCreateProgram():Val;
		gen public static function fLinkProgram(_nIdProgram : Val):Void;
		
		
		public static function fIsProgramLinked(_nProgId : Val):Bool{
			<cpp>
				#ifdef D_Platform_Web_Emsc
					return oGL.call<gzBool>("getProgramParameter", _nProgId,  val((int) eProgramInfo::LINK_STATUS) );	 //Not sure
					
				#else
					gzInt _nResult = false;
					GL_fGetProgramiv(_nProgId, eProgramInfo::LINK_STATUS, &_nResult);
					return (gzBool)_nResult;
				#endif
			</cpp>
			
		}
		
		
		
		public static function fGetParameter_Int(_hParam : eParameter_Int):Int{
			<cpp>
				#ifdef D_Platform_Web_Emsc
					return oGL.call<int>("getParameter",  val((int)_hParam) );
				#else
					gzInt _nResult = 0;
					GL_fGetIntegerv( _hParam, &_nResult);
					return _nResult;
				#endif
			</cpp>
		}
		
		
		
		public static function fGetProgramParameter(_nProgId : Val, _hInfo : eProgramInfo, _aParams:CArray<Int>):Void{
			<cpp>
				#ifdef D_Platform_Web_Emsc
					oGL.call<void>("getProgramParameter", _nProgId,  val((int)_hInfo) );	 //Not sure
					
				#else
					GL_fGetProgramiv(_nProgId, _hInfo, _aParams);
				#endif
			</cpp>
		}
		
		gen private static function fGetProgramiv(_nIdProgram : Val, _hInfo:eProgramInfo, _aParams:CArray<Int>):Void;
		
		
		
		
		
		
		gen public static function fUseProgram(_nIdProgram : Val):Void;
		gen public static function fDeleteProgram(_nIdProgram : Val):Void;
		
		

		gen public static function fGetUniformLocation(_nIdProgram : Val, _cName:CArray<UInt8>):Val{
			<cpp>
			#ifdef D_Platform_Web_Emsc
				std::string _sTest = (char*)_cName;
				return GL_fGetUniformLocation(_nIdProgram, _sTest);
			#endif
			</cpp>
		}

		gen public static function fGetAttribLocation(_nIdProgram : Val, _cName:CArray<UInt8>):Val {
			<cpp>
			#ifdef D_Platform_Web_Emsc
				std::string _sTest = (char*)_cName;
				return GL_fGetAttribLocation(_nIdProgram, _sTest);
			#endif
			</cpp>
		}
		
		
		
		gen public static function fBindAttribLocation(_nIdProgram : Val, _nIndex:UInt, _cName:CArray<UInt8>):Void;

		gen public static function fCreateShader(_hType : eShader):Val;
		public static function fShaderSource(_nShaderId : Val, _sSourceCode:String):Void {
			
			<cpp>
				gzStr8 _sFinalString  = _sSourceCode.fToUTF8().fFinalize();
			
				#ifdef D_Platform_Web_Emsc
					std::string _sTest = (char*)_sFinalString.get();
					oGL.call<void>("shaderSource", _nShaderId,    std::string(_sTest) );	 //Not sure
				#else
					const gzUInt8* _cStr = _sFinalString.get();
					GL_fShaderSource(_nShaderId, 1,(gzUInt8**)&_cStr, GZ_Null);	
				#endif
			</cpp>
		}
		//gen private static function fShaderSource(_nShaderId : Val, _nCount:Int, _cSourceCode:CArray<UInt8,2>, _pLength:CArray<Int,1> = null):Void;
		gen private static function fShaderSource(_nShaderId : Val, _nCount:Int, _cSourceCode:CArray<UInt8,2>, _pLength:CArray<Int,1> = 0):Void;
		

		gen public static function fCompileShader(_nShaderId : Val):Void;
		
		public static function fGetShaderParameter(_nShaderId : Val, _hInfo : eShaderInfo):UInt {
			<cpp>
				#ifdef D_Platform_Web_Emsc
					return oGL.call<int>("getShaderParameter", _nShaderId,  val((int)_hInfo) );	 //Not sure
				#else
					gzInt _nParam;
					GL_fGetShaderiv(_nShaderId, _hInfo, &_nParam);
					return _nParam;
				#endif
			</cpp>
		}
		gen private static function fGetShaderiv(_nShaderId : Val, _hInfo : eShaderInfo, _aParams:CArray<Int>):Void;
		
		
		
		gen public static function fDeleteShader(_nShaderId : Val):Void;
		gen public static function fAttachShader(_nIdProgram : Val, _nShaderId : Val):Void;
		gen public static function fDetachShader(_nIdProgram : Val, _nShaderId : Val):Void;

		//Texture
		gen public static function fActiveTexture(_hTexture : eTexture):Void;
		gen public static function fTexImage2D(_hTarget : eTargetTexture, _nLevel : Int, _hInternalformat : eInternalPixelFormat, _nWidth:Int, _nHeight:Int, _nBorder:Int, _hFormat:ePixelFormat,  _hType: ePixelType, _pPixel:Any ):Void{
				<cpp>
				#ifdef D_Platform_Web_Emsc
					gzUIntX _nSize = 0;
					if(_pPixel != 0){
						_nSize = _nWidth * _nHeight*4; //32bits, use the a larger possible size (32bit) to create the array view, TODO check if it's valid for smaller pixel format. 
						oGL.call<void>("texImage2D", gzVal(gzInt(_hTarget)), gzVal(_nLevel), gzVal(gzInt(_hInternalformat)), gzVal(_nWidth), gzVal(_nHeight), gzVal(_nBorder), gzVal(gzInt(_hFormat)), gzVal(gzInt(_hType)), typed_memory_view(_nSize, (gzUInt8*)_pPixel));
					}else{
						</cpp>
						Debug.fError("glTexImage2D have an empty src image");
						<cpp>
					}
					return;
				#endif
				</cpp>
		}
		
		
		gen public static function fTexImage3D(_hTarget : eTargetTexture, _nLevel : Int, _hInternalformat : ePixelFormat, _nWidth:Int, _nHeight:Int, _nDepth:Int, _nBorder:Int, _hFormat:ePixelFormat,  _hType: ePixelType, _pPixel:Any ):Void;
		gen public static function fTexSubImage3D(_hTarget : eTargetTexture, _nLevel : Int, _nOffsetX:Int, _nOffsetY:Int, _nOffsetZ:Int,  _nWidth:Int, _nHeight:Int, _nDepth:Int, _hFormat:ePixelFormat,  _hType: ePixelType, _pPixel:Any ):Void;
		gen public static function fBindTexture(_hTarget : eTargetTexture, _nTextureId : Val):Void{
			/*
			<cpp>
			#ifdef D_Platform_Web_Emsc
			oGL.call<void>("bindTexture", gzVal(gzInt(_hTarget)), emscripten::val::global("Null"));
			return;
			#endif
			</cpp>
			*/
		}

		gen public static function fTexParameterf(_hTarget : eTargetTexture, _hName : eTextureParameterName, _nParam : Float32):Void;
		gen public static function fTexParameteri(_hTarget : eTargetTexture, _hName : eTextureParameterName, _nParam : Int):Void;
	
		gen public static function fCreateTexture():Val{
			<cpp>
			#ifndef D_Platform_Web_Emsc
				gzVal _nId;
				fGenTextures(1, (gzUInt*)(&_nId));
				return _nId;
			#endif
			</cpp>
		}
			
		
		gen private static function fGenTextures(_nNb: Int, _aTextures : CArray<UInt>):Void{
			/*
			<cpp>
			#ifdef D_Platform_Web_Emsc
				
				*((gzVal*)_aTextures)= oGL.call<val>("createTexture");	//Can we create multiple textures?
				return;
			#endif
			</cpp>*/
		}

		//Draw
		gen public static function fClear(_hMask : eClearBuffer):Void;
		
		gen public static function fClearColor(_nRed:Float32, _nGreen:Float32, _nBlue:Float32, _nAlpha : Float32):Void;

		
		
		public static function fBufferData(_hTarget : eBufferTarget, _nNb:UInt, _hType :eTypeSize, _pData:CArray<UInt8>, _hUsage:eDrawFlow ):Void {
		//public static function fBufferData(_hTarget : eBufferTarget, _nNb:UInt, _hType :eTypeSize, _pData:Any, _hUsage:eDrawFlow ):Void {
		//public static function fBufferData(_hTarget : eBufferTarget, _nNb:UInt, _hType :eTypeSize, _pData:Array<Any>, _hUsage:eDrawFlow ):Void {
		//	OpenGL.fBufferData(_hTarget, _nNb * _nType, _pData, _hUsage);
			<cpp>
			fBufferData(Lib_GzOpenGL::OpenGL::eBufferTarget(_hTarget), _nNb * _hType, _pData, _hUsage);
		///	fBufferData(Lib_GzOpenGL::OpenGL::eBufferTarget(_hTarget), _nNb * _hType, (void*)_pData.get(), _hUsage);
			</cpp>
		}
		
		gen public static function fBufferData(_hTarget : eBufferTarget, _nSize:IntX, _pData:CArray<UInt8>, _hUsage:eDrawFlow ):Void {
		
			<cpp>
			#ifdef D_Platform_Web_Emsc

						//pixelArray.call<Void>("set", typed_memory_view(nArraySize, (gzUInt8*)aPixels));
						//oCanvas.call<Void>("putImageData", imageData, val(0), val(0)); // at coords 0,0
						
						 
						oGL.call<void>("bufferData", (int)_hTarget,  typed_memory_view(_nSize, (gzUInt8*)_pData) , (int)_hUsage);	 
							
					//gzVal* _val = *(((gzVal**)_pData) - sizeof(gzVal*));
					//oGL.call<void>("bufferData", (int)_hTarget,  _val , (int)_hUsage);	 
		
					//TODO JSMEM

				return;
			#else
				//TODO 
				//_pData = (void*)((gzDataRoot*)_pData)->aTab; //pData already ok? -> ok
				
			#endif
			</cpp>
		}
		
		
		gen public static function fDrawElements(_hMode : eDrawMode, _nCount : Int, _hVarType : eVarType, _pOffset : Any):Void {
			<cpp>
			#ifdef D_Platform_Web_Emsc
				//gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, cubeVerticesIndexBuffer);
				oGL.call<void>("drawElements", val((int)_hMode),  _nCount, val((int)_hVarType), (int)_pOffset);	 //N
				
				return;
			#endif
			</cpp>
		}
		

		gen public static function fDrawElementsInstanced(_hMode : eDrawMode, _nCount:Int, _hVarType : eVarType, _pIndicesLocation:Any, _nInstanceCount:Int):Void;

		
		//FBO
		//gen public static function fCreateTexture():Val;
		gen public static function fCreateFramebuffer():Val{
			<cpp>
			#ifndef D_Platform_Web_Emsc
				gzVal _nIdBuff;
				fGenFramebuffers(1, (gzUInt*)(&_nIdBuff));
				return _nIdBuff;
			#endif
			</cpp>
		}
		
		gen private static function fGenFramebuffers(_nNb : Int, _aFrameBuffers : CArray<UInt>):Void; //Use fCreateFramebuffer instead
		gen public static function fBindFramebuffer(_hTarget : eBindFramebuffer, _nFrameBufferId : Val ):Void;
		gen public static function fGenRenderbuffers(_nNb : Int, _aRenderBuffers : CArray<UInt>):Void;
		gen public static function fBindRenderbuffer(_hTarget : eBindRenderbuffer, _nRenderBufferId : UInt ):Void;
		gen public static function fRenderbufferStorage(_hTarget : eBindRenderbuffer, _hInternalFormat : ePixelFormat, _nWidth : Int, _nHeight : Int):Void;
		gen public static function fFramebufferTexture2D(_hTarget : eBindFramebuffer, _hAttachement : eAttachments, _hTextureTarget: eTargetTexture, _nTexture : Val, _nLevel : Int):Void;
		gen public static function fFramebufferRenderbuffer(_hTarget : eBindFramebuffer, _hAttachement : eAttachments, _hRenderBufferTarget: eBindRenderbuffer, _nRenderBufferId : UInt):Void;
		gen public static function fCheckFramebufferStatus(_hTarget : eBindFramebuffer):UInt;
		gen public static function fDeleteBuffers(_nNb:Int, _aBuffers: CArray<UInt>):Void;

		//Uniform
		gen public static function fUniform1f(_nLocation : Val, _n0 : Float32):Void;
		gen public static function fUniform2f(_nLocation : Val, _n0 : Float32, _n1 : Float32):Void;
		gen public static function fUniform3f(_nLocation : Val, _n0 : Float32, _n1 : Float32, _n2 : Float32):Void;
		gen public static function fUniform4f(_nLocation : Val, _n0 : Float32, _n1 : Float32, _n2 : Float32, _n3 : Float32):Void;

		gen public static function fUniform1i(_nLocation : Val, _n0 : Int32):Void;
		gen public static function fUniform2i(_nLocation : Val, _n0 : Int32, _n1 : Int32):Void;
		gen public static function fUniform3i(_nLocation : Val, _n0 : Int32, _n1 : Int32, _n2 : Int32):Void;
		gen public static function fUniform4i(_nLocation : Val, _n0 : Int32, _n1 : Int32, _n2 : Int32, _n3 : Int32):Void;

		gen public static function fUniform1fv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float32>):Void;
		gen public static function fUniform2fv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float32>):Void;;
		gen public static function fUniform3fv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float32>):Void;
		gen public static function fUniform4fv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float32>):Void;

		gen public static function fUniform1iv(_nLocation : Val, _nCount : Int, _aValue : CArray<Int32>):Void;
		gen public static function fUniform2iv(_nLocation : Val, _nCount : Int, _aValue : CArray<Int32>):Void;
		gen public static function fUniform3iv(_nLocation : Val, _nCount : Int, _aValue : CArray<Int32>):Void;
		gen public static function fUniform4iv(_nLocation : Val, _nCount : Int, _aValue : CArray<Int32>):Void;

		gen public static function fUniformMatrix2fv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;
		gen public static function fUniformMatrix3fv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;
		gen public static function fUniformMatrix4fv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;

		/* Android?
		gen public static function fUniform1d(_nLocation : Val, _nX : Float64):Void;
		gen public static function fUniform2d(_nLocation : Val, _nX : Float64, _nY : Float64):Void;
		gen public static function fUniform3d(_nLocation : Val, _nX : Float64, _nY : Float64, _nZ : Float64):Void;
		gen public static function fUniform4d(_nLocation : Val, _nX : Float64, _nY : Float64, _nZ : Float64, _nW : Float64):Void;
	
		gen public static function fUniform1dv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float64>):Void;
		gen public static function fUniform2dv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float64>):Void;
		gen public static function fUniform3dv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float64>):Void;
		gen public static function fUniform4dv(_nLocation : Val, _nCount : Int, _aValue : CArray<Float64>):Void;
		
		gen public static function fUniformMatrix2dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix3dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix4dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;

		gen public static function fUniformMatrix2x3dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix2x4dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix3x2dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix3x4dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix4x2dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		gen public static function fUniformMatrix4x3dv(_nLocation : Val, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		*/
		
		gen public static function fUniform1ui(_nLocation : Val, _n0 : UInt32):Void;
		gen public static function fUniform2ui(_nLocation : Val, _n0 : UInt32, _n1 : UInt32):Void;
		gen public static function fUniform3ui(_nLocation : Val, _n0 : UInt32, _n1 : UInt32, _n2 : UInt32):Void;
		gen public static function fUniform4ui(_nLocation : Val, _n0 : UInt32, _n1 : UInt32, _n2 : UInt32, _n3 : UInt32):Void;

		gen public static function fUniform1uiv(_nLocation : Val, _nCount : Int, _aValue : CArray<UInt32>):Void;
		gen public static function fUniform2uiv(_nLocation : Val, _nCount : Int, _aValue : CArray<UInt32>):Void;
		gen public static function fUniform3uiv(_nLocation : Val, _nCount : Int, _aValue : CArray<UInt32>):Void;
		gen public static function fUniform4uiv(_nLocation : Val, _nCount : Int, _aValue : CArray<UInt32>):Void;
		
		//Map
	//	gen public static function fMapBuffer(_eTarget : UInt, _eAccess : UInt):Any;
	//	gen public static function fMapBufferRange(_eTarget : UInt, _nOffset : UIntX, _nLength : UIntX, _eAccess : UInt):Any;
	//	gen public static function fUnmapBuffer(_eTarget : UInt):Bool;
		
		//Ubo
		gen public static function fGetUniformBlockIndex(_nPorgramId : UInt, _cUboName:CArray<UInt8>):UInt;
		gen public static function fBindBufferBase(_eTarget : UInt, _nIndex : UInt, _nBuffer : UInt):Void;
		gen public static function fUniformBlockBinding(_nPorgramId : UInt, _nUniformBlickId : UInt, _nBindPoint : UInt):Void;
	}
}
