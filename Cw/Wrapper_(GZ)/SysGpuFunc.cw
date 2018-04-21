package  {


	public class SysGpuFunc {

		//OGL
		public static function fGetError():UInt; //Must be first
		public static function fFlush():Void;
		public static function fEnable(_eCapability : UInt):Void;
		public static function fDisable(_eCapability : UInt):Void;
		public static function fDepthMask(_bEnable : Bool):Void;
		public static function fDepthFunc(_eFunc : UInt):Void;

		public static function fGetBooleanv(_eName : UInt, _pData:CArray<Bool>):Void;
		public static function fGetDoublev(_eName : UInt, _pData:CArray<Float64>):Void;
		public static function fGetFloatv(_eName : UInt, _pData:CArray<Float32>):Void;
		public static function fGetIntegerv(_eName : UInt, _pData:CArray<Int32>):Void;
		public static function fGetInteger64v(_eName : UInt, _pData:CArray<Int64>):Void;

		public static function fGetBooleani_v(_eTarget : UInt, _nIndex:UInt, _pData:CArray<Bool>)):Void;
		public static function fGetIntegeri_v(_eTarget : UInt, _nIndex:UInt, _pData:CArray<Float64>):Void;
		public static function fGetFloati_v(_eTarget : UInt, _nIndex:UInt, _pData:CArray<Float32>):Void;
		public static function fGetDoublei_v(_eTarget : UInt, _nIndex:UInt, _pData:CArray<Int32>):Void;
		public static function fGetInteger64i_v(_eTarget : UInt, _nIndex:UInt, _pData:CArray<Int64>)):Void;


		//Functions
		public static function fVertexAttribPointer(_nIndex : UInt, _nSize: Int, _eType: UInt, _bNormalized: Bool, _nStride:Int, _pPointer:Any ):Void;
		public static function fVertexAttribDivisor(_nIndex: UInt, _nDivisor: UInt):Void;

		public static function fEnableVertexAttribArray(_nIndex : UInt):Void;Back
		public static function fDisableVertexAttribArray(_nIndex : UInt):Void;

		Win public static function fSwapIntervalEXT(_nInterval : Int):Bool;

		public static function fDrawElementsInstanced(_eMode : UInt, _nCount:Int, _eType : UInt, _pIndicesLocation:Any, _nInstanceCount:Int):Void;

		//Blend
		public static function fBlendEquation(_eMode : UInt):Void;
		public static function fBlendFuncSeparate(_eSFactorRGB : UInt, _eDFactorRGB : UInt, _eSFactorAlpha : UInt, _eDFactorAlpha : UInt):Void;
		public static function fBlendFunc(_eSrcFactor : UInt, _eDstFactor : UInt):Void;


		//Shader
		public static function fGenVertexArrays(_nNb : Int, _aArrays:CArray<UInt>):Void;
		public static function fGenBuffers(_nNb : Int, _aBuffers:CArray<UInt>)):Void;
		public static function fBindVertexArray(_nVAO: UInt):Void;
		public static function fBindBuffer(_eTarget : UInt, _nBuffer : UInt):Void;
		public static function fBufferData(_eTarget : UInt, _nSize:IntX, _pData:Any, _eUsage:UInt ):Void;
		public static function fBufferSubData(_eTarget : UInt, _nOffset:IntX, _nSize:IntX, _pData:Any):Void;
		public static function fGetShaderInfoLog(_nShaderId : UInt, _nMaxLength : Int, _aLength : CArray<Int>, _cLogInfo:CArray<UInt8>):Void;

		//Program
		public static function fCreateProgram():UInt;
		public static function fLinkProgram(_nIdProgram : UInt):Void;
		public static function fGetProgramiv(_nIdProgram : UInt, _ePName:UInt, _aParams:CArray<Int>):Void;
		public static function fUseProgram(_nIdProgram : UInt):Void;
		public static function fDeleteProgram(_nIdProgram : UInt):Void;
		
		public static function fGetProgramInfoLog(_nProgramId : UInt, _nMaxLength : Int, _aLength : CArray<Int>, _cLogInfo:CArray<UInt8>):Void;


		public static function fGetUniformLocation(_nIdProgram : UInt, _cName:CArray<UInt8>):Int;

		public static function fGetAttribLocation(_nIdProgram : UInt, _cName:CArray<UInt8>):Int;
		public static function fBindAttribLocation(_nIdProgram : UInt, _nIndex:UInt, _cName:CArray<UInt8>):Void;

		public static function fCreateShader(_nType:UInt):UInt;
		public static function fShaderSource(_nShaderId : UInt, _nCount:Int, _cSourceCode:CArray<UInt8,2>, _pLength:CArray<Int,1> ):Void;

		public static function fCompileShader(_nShaderId : UInt):Void;
		public static function fGetShaderiv(_nShaderId : UInt, _ePName : UInt, _aParams:CArray<Int>):Void;
		public static function fDeleteShader(_nShaderId : UInt):Void;
		public static function fAttachShader(_nIdProgram : UInt, _nShaderId : UInt):Void;

		//Texture
		public static function fActiveTexture(_eTexture : UInt):Void;
		public static function fTexImage2D(_eTarget : UInt, _nLevel : Int, _nInternalformat : Int, _nWidth:Int, _nHeight:Int, _nBorder:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		public static function fTexImage3D(_eTarget : UInt, _nLevel : Int, _nInternalformat : Int, _nWidth:Int, _nHeight:Int, _nDepth:Int, _nBorder:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		public static function fTexSubImage3D(_eTarget : UInt, _nLevel : Int, _nOffsetX:Int, _nOffsetY:Int, _nOffsetZ:Int,  _nWidth:Int, _nHeight:Int, _nDepth:Int, _eFormat:UInt, _eType:UInt, _pPixel:Any ):Void;
		public static function fBindTexture(_eTarget : UInt, _nTextureId : UInt):Void;

		public static function fTexParameterf(_eTarget : UInt, _eName : UInt, _nParam : Float32):Void;
		public static function fTexParameteri(_eTarget : UInt, _eName : UInt, _nParam : Int):Void;
		public static function fGenTextures(_nNb: Int, _aTextures : CArray<UInt>):Void;

		//Draw
		public static function fClear(_eMask : UInt):Void;
		public static function fClearColor(_nRed:Float32, _nGreen:Float32, _nBlue:Float32, _nAlpha : Float32):Void;
		public static function fDrawElements(_eMode : UInt, _nCount : Int, _eType : UInt, _pIndicesLocation : Any):Void;

		//FBO
		public static function fGenFramebuffers(_nNb : Int, _aFrameBuffers : CArray<UInt>):Void;
		public static function fBindFramebuffer(_eTarget : UInt, _nFrameBufferId : UInt ):Void;
		public static function fGenRenderbuffers(_nNb : Int, _aRenderBuffers : CArray<UInt>):Void;
		public static function fBindRenderbuffer(_eTarget : UInt, _nRenderBufferId : UInt ):Void;
		public static function fRenderbufferStorage(_eTarget : UInt, _eInternalFormat : UInt, _nWidth : Int, _nHeight : Int):Void;
		public static function fFramebufferTexture2D(_eTarget : UInt, _eAttachement : UInt, _eTextureTarget: UInt, _nTexture : UInt, _nLevel : Int):Void;
		public static function fFramebufferRenderbuffer(_eTarget : UInt, _eAttachement : UInt, _eRenderBufferTarget: UInt, _nRenderBufferId : UInt):Void;
		public static function fCheckFramebufferStatus(_eTarget : UInt):UInt;
		public static function fDeleteBuffers(_nNb:Int, _aBuffers: CArray<UInt>):Void;

		//Uniform
		public static function fUniform1f(_nLocation : Int, _n0 : Float32):Void;
		public static function fUniform2f(_nLocation : Int, _n0 : Float32, _n1 : Float32):Void;
		public static function fUniform3f(_nLocation : Int, _n0 : Float32, _n1 : Float32, _n2 : Float32):Void;
		public static function fUniform4f(_nLocation : Int, _n0 : Float32, _n1 : Float32, _n2 : Float32, _n3 : Float32):Void;

		public static function fUniform1i(_nLocation : Int, _n0 : Int32):Void;
		public static function fUniform2i(_nLocation : Int, _n0 : Int32, _n1 : Int32):Void;
		public static function fUniform3i(_nLocation : Int, _n0 : Int32, _n1 : Int32, _n2 : Int32):Void;
		public static function fUniform4i(_nLocation : Int, _n0 : Int32, _n1 : Int32, _n2 : Int32, _n3 : Int32):Void;

		public static function fUniform1fv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float32>):Void;
		public static function fUniform2fv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float32>):Void;;
		public static function fUniform3fv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float32>):Void;
		public static function fUniform4fv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float32>):Void;

		public static function fUniform1iv(_nLocation : Int, _nCount : Int, _aValue : CArray<Int32>):Void;
		public static function fUniform2iv(_nLocation : Int, _nCount : Int, _aValue : CArray<Int32>):Void;
		public static function fUniform3iv(_nLocation : Int, _nCount : Int, _aValue : CArray<Int32>):Void;
		public static function fUniform4iv(_nLocation : Int, _nCount : Int, _aValue : CArray<Int32>):Void;

		public static function fUniformMatrix2fv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;
		public static function fUniformMatrix3fv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;
		public static function fUniformMatrix4fv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float32>):Void;

		public static function fUniform1d(_nLocation : Int, _nX : Float64):Void;
		public static function fUniform2d(_nLocation : Int, _nX : Float64, _nY : Float64):Void;
		public static function fUniform3d(_nLocation : Int, _nX : Float64, _nY : Float64, _nZ : Float64):Void;
		public static function fUniform4d(_nLocation : Int, _nX : Float64, _nY : Float64, _nZ : Float64, _nW : Float64):Void;

		public static function fUniform1dv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float64>):Void;
		public static function fUniform2dv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float64>):Void;
		public static function fUniform3dv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float64>):Void;
		public static function fUniform4dv(_nLocation : Int, _nCount : Int, _aValue : CArray<Float64>):Void;

		public static function fUniformMatrix2dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix3dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix4dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;

		public static function fUniformMatrix2x3dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix2x4dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix3x2dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix3x4dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix4x2dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;
		public static function fUniformMatrix4x3dv(_nLocation : Int, _nCount : Int, _bTranspose : Bool, _aValue : CArray<Float64>):Void;

		public static function fUniform1ui(_nLocation : Int, _n0 : UInt32):Void;
		public static function fUniform2ui(_nLocation : Int, _n0 : UInt32, _n1 : UInt32):Void;
		public static function fUniform3ui(_nLocation : Int, _n0 : UInt32, _n1 : UInt32, _n2 : UInt32):Void;
		public static function fUniform4ui(_nLocation : Int, _n0 : UInt32, _n1 : UInt32, _n2 : UInt32, _n3 : UInt32):Void;

		public static function fUniform1uiv(_nLocation : Int, _nCount : Int, _aValue : CArray<UInt32>):Void;
		public static function fUniform2uiv(_nLocation : Int, _nCount : Int, _aValue : CArray<UInt32>):Void;
		public static function fUniform3uiv(_nLocation : Int, _nCount : Int, _aValue : CArray<UInt32>):Void;
		public static function fUniform4uiv(_nLocation : Int, _nCount : Int, _aValue : CArray<UInt32>):Void;
		
		//Map
		public static function fMapBuffer(_eTarget : UInt, _eAccess : UInt):Any;
		public static function fMapBufferRange(_eTarget : UInt, _nOffset : UIntX, _nLength : UIntX, _eAccess : UInt):Any;
		public static function fUnmapBuffer(_eTarget : UInt):Bool;
		
		//Ubo
		public static function fGetUniformBlockIndex(_nPorgramId : UInt, _cUboName:CArray<UInt8>):UInt;
		public static function fBindBufferBase(_eTarget : UInt, _nIndex : UInt, _nBuffer : UInt):Void;
		public static function fUniformBlockBinding(_nPorgramId : UInt, _nUniformBlickId : UInt, _nBindPoint : UInt):Void;
	}
}
