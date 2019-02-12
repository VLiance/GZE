generate "OpenGL" {
	
	public class OpenGL {
		
		//public static var oGL : OpenGL;
		
		<cpp_h>
		#ifdef GZ_tWeb_Emsc
			#include "Lib_GZ/SysUtils/EmscHeader.h"
		#endif
			
		extern Void* gzEmscPtrBuffer;
		</cpp_h>
		
		<cpp_static_h>
		#ifdef GZ_tWeb_Emsc
		val oGL = val::global("Null");
		#endif
		</cpp_static_h>
		


		
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
			MAJOR_VERSION = 0x821B;
			MINOR_VERSION = 0x821C;
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

		//OGL
		public static function fGetError():UInt; //Must be first
		gen public static function fFlush():Void;
		gen public static function fEnable(_eCapability : UInt):Void;
		gen public static function fDisable(_eCapability : UInt):Void;
		gen public static function fDepthMask(_bEnable : Bool):Void;
		gen public static function fDepthFunc(_eFunc : UInt):Void;

		gen public static function fGetBooleanv(_hName : eGetName, _pData:CArray<Bool>):Void;
		gen public static function fGetDoublev(_hName : eGetName, _pData:CArray<Float64>):Void;
		gen public static function fGetFloatv(_hName : eGetName, _pData:CArray<Float32>):Void;
		gen public static function fGetIntegerv(_hName : eGetName, _pData:CArray<Int32>):Void;
		gen public static function fGetInteger64v(_hName : eGetName, _pData:CArray<Int64>):Void;

		gen public static function fGetBooleani_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Bool>)):Void;
		gen public static function fGetIntegeri_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Float64>):Void;
		gen public static function fGetFloati_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Float32>):Void;
		gen public static function fGetDoublei_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Int32>):Void;
		gen public static function fGetInteger64i_v(_hTarget : UInt, _nIndex:UInt, _pData:CArray<Int64>)):Void;

		//Functions
		gen public static function fVertexAttribPointer(_nIndex : Val, _hLength: eVecLength, _hType: eVarType, _bNormalized: Bool, _nStride:Int, _nPointer:UInt ):Void;
		gen public static function fVertexAttribDivisor(_nIndex: Val, _nDivisor: UInt):Void;

		gen public static function fEnableVertexAttribArray(_nIndex : Val):Void;
		gen public static function fDisableVertexAttribArray(_nIndex : UInt):Void;

		gen Win public static function fSwapIntervalEXT(_nInterval : Int):Bool;

		//Blend
		gen public static function fBlendEquation(_eMode : UInt):Void;
		gen public static function fBlendFuncSeparate(_eSFactorRGB : UInt, _eDFactorRGB : UInt, _eSFactorAlpha : UInt, _eDFactorAlpha : UInt):Void;
		gen public static function fBlendFunc(_eSrcFactor : UInt, _eDstFactor : UInt):Void;


		//Shader
		gen public static function fGenVertexArrays(_nNb : Int, _aArrays:CArray<UInt>):Void;
		
		public static function fCreateBuffer():Val{
			<cpp>
				#ifdef GZ_tWeb_Emsc

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
		
		
		
		public static function fGetShaderInfoLog(_nShaderId : Val):String {
			<cpp>
			#ifdef GZ_tWeb_Emsc
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
		
		public static function fGetProgramParameter(_nShaderId : Val, _hInfo : eProgramInfo, _aParams:CArray<Int>):Void{
			<cpp>
				#ifdef GZ_tWeb_Emsc
					oGL.call<Void>("getProgramParameter", _nShaderId,  val((int)_hInfo) );	 //Not sure
					
				#else
					GL_fGetProgramiv(_nShaderId, _hInfo, _aParams);
				#endif
			</cpp>
		}
		gen private static function fGetProgramiv(_nIdProgram : Val, _hInfo:eProgramInfo, _aParams:CArray<Int>):Void;
		
		
		
		gen public static function fUseProgram(_nIdProgram : Val):Void;
		gen public static function fDeleteProgram(_nIdProgram : Val):Void;
		
		gen public static function fGetProgramInfoLog(_nProgramId : Val, _nMaxLength : Int, _aLength : CArray<Int>, _cLogInfo:CArray<UInt8>):Void;


		gen public static function fGetUniformLocation(_nIdProgram : Val, _cName:CArray<UInt8>):Val{
			<cpp>
			#ifdef GZ_tWeb_Emsc
				std::string _sTest = (char*)_cName;
				return GL_fGetUniformLocation(_nIdProgram, _sTest);
			#endif
			</cpp>
		}

		gen public static function fGetAttribLocation(_nIdProgram : Val, _cName:CArray<UInt8>):Val {
			<cpp>
			#ifdef GZ_tWeb_Emsc
				std::string _sTest = (char*)_cName;
				return GL_fGetAttribLocation(_nIdProgram, _sTest);
			#endif
			</cpp>
		}
		
		
		
		gen public static function fBindAttribLocation(_nIdProgram : Val, _nIndex:UInt, _cName:CArray<UInt8>):Void;

		gen public static function fCreateShader(_hType : eShader):Val;
		public static function fShaderSource(_nShaderId : Val, _sSourceCode:String):Void {
			<cpp>
				const gzUInt8* _cStr = _sSourceCode.fcStr();
				#ifdef GZ_tWeb_Emsc
					std::string _sTest = (char*)_cStr;
					oGL.call<Void>("shaderSource", _nShaderId,    std::string(_sTest) );	 //Not sure
				#else
					GL_fShaderSource(_nShaderId, 1,(gzUInt8**)&_cStr, GZ_Null);	
				#endif
			</cpp>
		}
		gen private static function fShaderSource(_nShaderId : Val, _nCount:Int, _cSourceCode:CArray<UInt8,2>, _pLength:CArray<Int,1> = null):Void;
		

		gen public static function fCompileShader(_nShaderId : Val):Void;
		
		public static function fGetShaderParameter(_nShaderId : Val, _hInfo : eShaderInfo):UInt {
			<cpp>
				#ifdef GZ_tWeb_Emsc
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

		//Texture
		gen public static function fActiveTexture(_eTexture : UInt):Void;
		gen public static function fTexImage2D(_eTarget : UInt, _nLevel : Int, _nInternalformat : Int, _nWidth:Int, _nHeight:Int, _nBorder:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		gen public static function fTexImage3D(_eTarget : UInt, _nLevel : Int, _nInternalformat : Int, _nWidth:Int, _nHeight:Int, _nDepth:Int, _nBorder:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		gen public static function fTexSubImage3D(_eTarget : UInt, _nLevel : Int, _nOffsetX:Int, _nOffsetY:Int, _nOffsetZ:Int,  _nWidth:Int, _nHeight:Int, _nDepth:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		gen public static function fBindTexture(_eTarget : UInt, _nTextureId : UInt):Void;

		gen public static function fTexParameterf(_eTarget : UInt, _eName : UInt, _nParam : Float32):Void;
		gen public static function fTexParameteri(_eTarget : UInt, _eName : UInt, _nParam : Int):Void;
		gen public static function fGenTextures(_nNb: Int, _aTextures : CArray<UInt>):Void;

		//Draw
		gen public static function fClear(_hMask : eClearBuffer):Void;
		
		gen public static function fClearColor(_nRed:Float32, _nGreen:Float32, _nBlue:Float32, _nAlpha : Float32):Void;

		
		
		public static function fBufferData(_hTarget : eBufferTarget, _nNb:UInt, _hType :eTypeSize, _pData:DArray<UInt8>, _hUsage:eDrawFlow ):Void {
		//	OpenGL.fBufferData(_hTarget, _nNb * _nType, _pData, _hUsage);
			<cpp>
			fBufferData(Lib_GZ_OpenGL::OpenGL::eBufferTarget(_hTarget), _nNb * _hType, (Void*)_pData.array, _hUsage);
			</cpp>
		}
		
		gen public static function fBufferData(_hTarget : eBufferTarget, _nSize:IntX, _pData:Any, _hUsage:eDrawFlow ):Void {
		
			<cpp>
			#ifdef GZ_tWeb_Emsc

					gzDataRoot* _array = (gzDataRoot*)(_pData) ;
					oGL.call<Void>("bufferData", (int)_hTarget, _array->JsMem , (int)_hUsage);	 

				return;
			#else

				_pData = (Void*)((gzDataRoot*)_pData)->aTab;
	
			#endif
			</cpp>
		}
		
		
		gen public static function fDrawElements(_hMode : eDrawMode, _nCount : Int, _hVarType : eVarType, _pOffset : Any):Void {
			<cpp>
			#ifdef GZ_tWeb_Emsc
				//gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, cubeVerticesIndexBuffer);
				oGL.call<Void>("drawElements", val((int)_hMode),  _nCount, val((int)_hVarType), (int)_pOffset);	 //N
				
				return;
			#endif
			</cpp>
		}
		
		
		
		
		gen public static function fDrawElementsInstanced(_hMode : eDrawMode, _nCount:Int, _hVarType : eVarType, _pIndicesLocation:Any, _nInstanceCount:Int):Void;

	
		
		
		//FBO
		gen public static function fGenFramebuffers(_nNb : Int, _aFrameBuffers : CArray<UInt>):Void;
		gen public static function fBindFramebuffer(_eTarget : UInt, _nFrameBufferId : UInt ):Void;
		gen public static function fGenRenderbuffers(_nNb : Int, _aRenderBuffers : CArray<UInt>):Void;
		gen public static function fBindRenderbuffer(_eTarget : UInt, _nRenderBufferId : UInt ):Void;
		gen public static function fRenderbufferStorage(_eTarget : UInt, _eInternalFormat : UInt, _nWidth : Int, _nHeight : Int):Void;
		gen public static function fFramebufferTexture2D(_eTarget : UInt, _eAttachement : UInt, _eTextureTarget: UInt, _nTexture : UInt, _nLevel : Int):Void;
		gen public static function fFramebufferRenderbuffer(_eTarget : UInt, _eAttachement : UInt, _eRenderBufferTarget: UInt, _nRenderBufferId : UInt):Void;
		gen public static function fCheckFramebufferStatus(_eTarget : UInt):UInt;
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
