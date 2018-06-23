#include "Lib_GZ_OpenGL/OpenGL.h"

//#include "Lib_GZ/Sys/Debug.h"
#include "Lib_GZ/Class.h"
//#include "Lib_GZ/ThreadMsg.h"

namespace Lib_GZ_OpenGL{namespace OpenGL{
}}


namespace Lib_GZ_OpenGL{namespace OpenGL{
////// Current Lib Access  ////
//// Current Static Access ////
#undef _
#define _ OpenGL
void Ini_Class(){
}
#ifdef GZ_tHaveCallStack
gzFuncStack zFuncName[] = {{0,"fGetError"},{0,"fFlush"},{0,"fEnable"},{0,"fDisable"},{0,"fDepthMask"},{0,"fDepthFunc"},{0,"fGetBooleanv"},{0,"fGetDoublev"},{0,"fGetFloatv"},{0,"fGetIntegerv"},{0,"fGetInteger64v"},{0,"fGetBooleani_v"},{0,"fGetIntegeri_v"},{0,"fGetFloati_v"},{0,"fGetDoublei_v"},{0,"fGetInteger64i_v"},{0,"fVertexAttribPointer"},{0,"fVertexAttribDivisor"},{0,"fEnableVertexAttribArray"},{0,"fDisableVertexAttribArray"},{0,"fSwapIntervalEXT"},{0,"fBlendEquation"},{0,"fBlendFuncSeparate"},{0,"fBlendFunc"},{0,"fGenVertexArrays"},{0,"fCreateBuffer"},{0,"fGenBuffers"},{0,"fBindVertexArray"},{0,"fBindBuffer"},{0,"fBufferSubData"},{0,"fGetShaderInfoLog"},{0,"fGetShaderInfoLog"},{0,"fCreateProgram"},{0,"fLinkProgram"},{0,"fGetProgramParameter"},{0,"fGetProgramiv"},{0,"fUseProgram"},{0,"fDeleteProgram"},{0,"fGetProgramInfoLog"},{0,"fGetUniformLocation"},{0,"fGetAttribLocation"},{0,"fBindAttribLocation"},{0,"fCreateShader"},{0,"fShaderSource"},{0,"fShaderSource"},{0,"fCompileShader"},{0,"fGetShaderParameter"},{0,"fGetShaderiv"},{0,"fDeleteShader"},{0,"fAttachShader"},{0,"fActiveTexture"},{0,"fTexImage2D"},{0,"fTexImage3D"},{0,"fTexSubImage3D"},{0,"fBindTexture"},{0,"fTexParameterf"},{0,"fTexParameteri"},{0,"fGenTextures"},{0,"fClear"},{0,"fClearColor"},{0,"fBufferData"},{0,"fBufferData"},{0,"fDrawElements"},{0,"fDrawElementsInstanced"},{0,"fGenFramebuffers"},{0,"fBindFramebuffer"},{0,"fGenRenderbuffers"},{0,"fBindRenderbuffer"},{0,"fRenderbufferStorage"},{0,"fFramebufferTexture2D"},{0,"fFramebufferRenderbuffer"},{0,"fCheckFramebufferStatus"},{0,"fDeleteBuffers"},{0,"fUniform1f"},{0,"fUniform2f"},{0,"fUniform3f"},{0,"fUniform4f"},{0,"fUniform1i"},{0,"fUniform2i"},{0,"fUniform3i"},{0,"fUniform4i"},{0,"fUniform1fv"},{0,"fUniform2fv"},{0,"fUniform3fv"},{0,"fUniform4fv"},{0,"fUniform1iv"},{0,"fUniform2iv"},{0,"fUniform3iv"},{0,"fUniform4iv"},{0,"fUniformMatrix2fv"},{0,"fUniformMatrix3fv"},{0,"fUniformMatrix4fv"},{0,"fUniform1d"},{0,"fUniform2d"},{0,"fUniform3d"},{0,"fUniform4d"},{0,"fUniform1dv"},{0,"fUniform2dv"},{0,"fUniform3dv"},{0,"fUniform4dv"},{0,"fUniformMatrix2dv"},{0,"fUniformMatrix3dv"},{0,"fUniformMatrix4dv"},{0,"fUniformMatrix2x3dv"},{0,"fUniformMatrix2x4dv"},{0,"fUniformMatrix3x2dv"},{0,"fUniformMatrix3x4dv"},{0,"fUniformMatrix4x2dv"},{0,"fUniformMatrix4x3dv"},{0,"fUniform1ui"},{0,"fUniform2ui"},{0,"fUniform3ui"},{0,"fUniform4ui"},{0,"fUniform1uiv"},{0,"fUniform2uiv"},{0,"fUniform3uiv"},{0,"fUniform4uiv"},{0,"fGetUniformBlockIndex"},{0,"fBindBufferBase"},{0,"fUniformBlockBinding"},{0,"OpenGL"}};
#endif
///////////////////////////////

}

GZ_mCppClass(OpenGL)

gzUInt csOpenGL::fGetError(){ gz_(0)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetError")
	return 0;
}

void csOpenGL::fFlush(){ gz_(1)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fFlush")
	GL_fFlush();
}

void csOpenGL::fEnable(gzUInt _eCapability){ gz_(2)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fEnable")
	GL_fEnable(_eCapability);
}

void csOpenGL::fDisable(gzUInt _eCapability){ gz_(3)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDisable")
	GL_fDisable(_eCapability);
}

void csOpenGL::fDepthMask(gzBool _bEnable){ gz_(4)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDepthMask")
	GL_fDepthMask(_bEnable);
}

void csOpenGL::fDepthFunc(gzUInt _eFunc){ gz_(5)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDepthFunc")
	GL_fDepthFunc(_eFunc);
}

void csOpenGL::fGetBooleanv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzBool* _pData){ gz_(6)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetBooleanv")
	GL_fGetBooleanv(_hName, _pData);
}

void csOpenGL::fGetDoublev(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzFloat64* _pData){ gz_(7)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetDoublev")
	GL_fGetDoublev(_hName, _pData);
}

void csOpenGL::fGetFloatv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzFloat32* _pData){ gz_(8)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetFloatv")
	GL_fGetFloatv(_hName, _pData);
}

void csOpenGL::fGetIntegerv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzInt32* _pData){ gz_(9)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetIntegerv")
	GL_fGetIntegerv(_hName, _pData);
}

void csOpenGL::fGetInteger64v(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzInt64* _pData){ gz_(10)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetInteger64v")
	GL_fGetInteger64v(_hName, _pData);
}

void csOpenGL::fGetBooleani_v(gzUInt _hTarget, gzUInt _nIndex, gzBool* _pData){ gz_(11)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetBooleani_v")
	GL_fGetBooleani_v(_hTarget, _nIndex, _pData);
}

void csOpenGL::fGetIntegeri_v(gzUInt _hTarget, gzUInt _nIndex, gzFloat64* _pData){ gz_(12)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetIntegeri_v")
	GL_fGetIntegeri_v(_hTarget, _nIndex, _pData);
}

void csOpenGL::fGetFloati_v(gzUInt _hTarget, gzUInt _nIndex, gzFloat32* _pData){ gz_(13)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetFloati_v")
	GL_fGetFloati_v(_hTarget, _nIndex, _pData);
}

void csOpenGL::fGetDoublei_v(gzUInt _hTarget, gzUInt _nIndex, gzInt32* _pData){ gz_(14)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetDoublei_v")
	GL_fGetDoublei_v(_hTarget, _nIndex, _pData);
}

void csOpenGL::fGetInteger64i_v(gzUInt _hTarget, gzUInt _nIndex, gzInt64* _pData){ gz_(15)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetInteger64i_v")
	GL_fGetInteger64i_v(_hTarget, _nIndex, _pData);
}

void csOpenGL::fVertexAttribPointer(gzVal _nIndex, Lib_GZ_OpenGL::OpenGL::eVecLength _hLength, Lib_GZ_OpenGL::OpenGL::eVarType _hType, gzBool _bNormalized, gzInt _nStride, gzUInt _nPointer){ gz_(16)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fVertexAttribPointer")
	GL_fVertexAttribPointer(_nIndex, _hLength, _hType, _bNormalized, _nStride, _nPointer);
}

void csOpenGL::fVertexAttribDivisor(gzVal _nIndex, gzUInt _nDivisor){ gz_(17)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fVertexAttribDivisor")
	GL_fVertexAttribDivisor(_nIndex, _nDivisor);
}

void csOpenGL::fEnableVertexAttribArray(gzVal _nIndex){ gz_(18)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fEnableVertexAttribArray")
	GL_fEnableVertexAttribArray(_nIndex);
}

void csOpenGL::fDisableVertexAttribArray(gzUInt _nIndex){ gz_(19)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDisableVertexAttribArray")
	GL_fDisableVertexAttribArray(_nIndex);
}

gzBool csOpenGL::fSwapIntervalEXT(gzInt _nInterval){ gz_(20)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fSwapIntervalEXT")
	return GL_fSwapIntervalEXT(_nInterval);
	return false;
}

void csOpenGL::fBlendEquation(gzUInt _eMode){ gz_(21)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBlendEquation")
	GL_fBlendEquation(_eMode);
}

void csOpenGL::fBlendFuncSeparate(gzUInt _eSFactorRGB, gzUInt _eDFactorRGB, gzUInt _eSFactorAlpha, gzUInt _eDFactorAlpha){ gz_(22)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBlendFuncSeparate")
	GL_fBlendFuncSeparate(_eSFactorRGB, _eDFactorRGB, _eSFactorAlpha, _eDFactorAlpha);
}

void csOpenGL::fBlendFunc(gzUInt _eSrcFactor, gzUInt _eDstFactor){ gz_(23)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBlendFunc")
	GL_fBlendFunc(_eSrcFactor, _eDstFactor);
}

void csOpenGL::fGenVertexArrays(gzInt _nNb, gzUInt* _aArrays){ gz_(24)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGenVertexArrays")
	GL_fGenVertexArrays(_nNb, _aArrays);
}

gzVal csOpenGL::fCreateBuffer(){ gz_(25)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	return oGL.call<val>("createBuffer");
	//return ::GZ::fConsole(gzU8("ScreateBuffer"));
	#else
	gzVal _nVal;
	GL_fGenBuffers(1, &_nVal);
	return _nVal;
	#endif
	return GzNullVal;
}

void csOpenGL::fGenBuffers(gzInt _nNb, gzUInt* _aBuffers){ gz_(26)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGenBuffers")
	GL_fGenBuffers(_nNb, _aBuffers);
}

void csOpenGL::fBindVertexArray(gzUInt _nVAO){ gz_(27)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindVertexArray")
	GL_fBindVertexArray(_nVAO);
}

void csOpenGL::fBindBuffer(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzVal _nBuffer){ gz_(28)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindBuffer")
	GL_fBindBuffer(_hTarget, _nBuffer);
}

void csOpenGL::fBufferSubData(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzIntX _nOffset, gzIntX _nSize, void* _pData){ gz_(29)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBufferSubData")
	GL_fBufferSubData(_hTarget, _nOffset, _nSize, _pData);
}

gzStr csOpenGL::fGetShaderInfoLog(gzVal _nShaderId){ gz_(30)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	std::string _sTest = oGL.call<std::string>("getShaderInfoLog", _nShaderId);	 //N
	return gzStrC(_sTest.c_str());
	#else
	gzUInt8* _aLogBuff;
	gzInt _nLength;
	//Tag cpp
	//the size of the buffer required to store the returned information log can be obtained by calling	glGetShader with the value GL_INFO_LOG_LENGTH.
	char logBuf[8024]; //Max length?
	_aLogBuff = (gzUInt8*)logBuf;
	GL_fGetShaderInfoLog(_nShaderId, sizeof(logBuf), &_nLength, (gzUInt8*)logBuf );
	//nLineError = strtol( &logBuf[2] , GZ_Null, 10) - 1;
	return gzStrC(logBuf, _nLength);
	#endif
	return gzU8("");
}

void csOpenGL::fGetShaderInfoLog(gzVal _nShaderId, gzInt _nMaxLength, gzInt* _aLength, gzUInt8* _cLogInfo){ gz_(31)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetShaderInfoLog")
	GL_fGetShaderInfoLog(_nShaderId, _nMaxLength, _aLength, _cLogInfo);
}

gzVal csOpenGL::fCreateProgram(){ gz_(32)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fCreateProgram")
	return GL_fCreateProgram();
	return GzNullVal;
}

void csOpenGL::fLinkProgram(gzVal _nIdProgram){ gz_(33)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fLinkProgram")
	GL_fLinkProgram(_nIdProgram);
}

void csOpenGL::fGetProgramParameter(gzVal _nShaderId, Lib_GZ_OpenGL::OpenGL::eProgramInfo _hInfo, gzInt* _aParams){ gz_(34)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	oGL.call<void>("getProgramParameter", _nShaderId,  val((int)_hInfo) );	 //Not sure
	#else
	GL_fGetProgramiv(_nShaderId, _hInfo, _aParams);
	#endif
}

void csOpenGL::fGetProgramiv(gzVal _nIdProgram, Lib_GZ_OpenGL::OpenGL::eProgramInfo _hInfo, gzInt* _aParams){ gz_(35)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetProgramiv")
	GL_fGetProgramiv(_nIdProgram, _hInfo, _aParams);
}

void csOpenGL::fUseProgram(gzVal _nIdProgram){ gz_(36)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUseProgram")
	GL_fUseProgram(_nIdProgram);
}

void csOpenGL::fDeleteProgram(gzVal _nIdProgram){ gz_(37)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDeleteProgram")
	GL_fDeleteProgram(_nIdProgram);
}

void csOpenGL::fGetProgramInfoLog(gzVal _nProgramId, gzInt _nMaxLength, gzInt* _aLength, gzUInt8* _cLogInfo){ gz_(38)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetProgramInfoLog")
	GL_fGetProgramInfoLog(_nProgramId, _nMaxLength, _aLength, _cLogInfo);
}

gzVal csOpenGL::fGetUniformLocation(gzVal _nIdProgram, gzUInt8* _cName){ gz_(39)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	std::string _sTest = (char*)_cName;
	return GL_fGetUniformLocation(_nIdProgram, _sTest);
	#endif
	return GL_fGetUniformLocation(_nIdProgram, _cName);
	return GzNullVal;
}

gzVal csOpenGL::fGetAttribLocation(gzVal _nIdProgram, gzUInt8* _cName){ gz_(40)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	std::string _sTest = (char*)_cName;
	return GL_fGetAttribLocation(_nIdProgram, _sTest);
	#endif
	return GL_fGetAttribLocation(_nIdProgram, _cName);
	return GzNullVal;
}

void csOpenGL::fBindAttribLocation(gzVal _nIdProgram, gzUInt _nIndex, gzUInt8* _cName){ gz_(41)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindAttribLocation")
	GL_fBindAttribLocation(_nIdProgram, _nIndex, _cName);
}

gzVal csOpenGL::fCreateShader(Lib_GZ_OpenGL::OpenGL::eShader _hType){ gz_(42)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fCreateShader")
	return GL_fCreateShader(_hType);
	return GzNullVal;
}

void csOpenGL::fShaderSource(gzVal _nShaderId, gzPStr _sSourceCode){ gz_(43)
/*
	//Tag cpp
	const gzUInt8* _cStr = _sSourceCode.fcStr();
	#ifdef wPlatform__Web_Emsc
	std::string _sTest = (char*)_cStr;
	oGL.call<void>("shaderSource", _nShaderId,    std::string(_sTest) );	 //Not sure
	#else
	GL_fShaderSource(_nShaderId, 1,(gzUInt8**)&_cStr, GZ_Null);
	#endif*/
}

void csOpenGL::fShaderSource(gzVal _nShaderId, gzInt _nCount, gzUInt8** _cSourceCode, gzInt* _pLength){ gz_(44)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fShaderSource")
	GL_fShaderSource(_nShaderId, _nCount, _cSourceCode, _pLength);
}

void csOpenGL::fCompileShader(gzVal _nShaderId){ gz_(45)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fCompileShader")
	GL_fCompileShader(_nShaderId);
}

gzUInt csOpenGL::fGetShaderParameter(gzVal _nShaderId, Lib_GZ_OpenGL::OpenGL::eShaderInfo _hInfo){ gz_(46)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	return oGL.call<int>("getShaderParameter", _nShaderId,  val((int)_hInfo) );	 //Not sure
	#else
	gzInt _nParam;
	GL_fGetShaderiv(_nShaderId, _hInfo, &_nParam);
	return _nParam;
	#endif
	return 0;
}

void csOpenGL::fGetShaderiv(gzVal _nShaderId, Lib_GZ_OpenGL::OpenGL::eShaderInfo _hInfo, gzInt* _aParams){ gz_(47)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetShaderiv")
	GL_fGetShaderiv(_nShaderId, _hInfo, _aParams);
}

void csOpenGL::fDeleteShader(gzVal _nShaderId){ gz_(48)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDeleteShader")
	GL_fDeleteShader(_nShaderId);
}

void csOpenGL::fAttachShader(gzVal _nIdProgram, gzVal _nShaderId){ gz_(49)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fAttachShader")
	GL_fAttachShader(_nIdProgram, _nShaderId);
}

void csOpenGL::fActiveTexture(gzUInt _eTexture){ gz_(50)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fActiveTexture")
	GL_fActiveTexture(_eTexture);
}

void csOpenGL::fTexImage2D(gzUInt _eTarget, gzInt _nLevel, gzInt _nInternalformat, gzInt _nWidth, gzInt _nHeight, gzInt _nBorder, gzUInt _eFormat, gzUInt _eType, void* _pPixel){ gz_(51)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fTexImage2D")
	GL_fTexImage2D(_eTarget, _nLevel, _nInternalformat, _nWidth, _nHeight, _nBorder, _eFormat, _eType, _pPixel);
}

void csOpenGL::fTexImage3D(gzUInt _eTarget, gzInt _nLevel, gzInt _nInternalformat, gzInt _nWidth, gzInt _nHeight, gzInt _nDepth, gzInt _nBorder, gzUInt _eFormat, gzUInt _eType, void* _pPixel){ gz_(52)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fTexImage3D")
	GL_fTexImage3D(_eTarget, _nLevel, _nInternalformat, _nWidth, _nHeight, _nDepth, _nBorder, _eFormat, _eType, _pPixel);
}

void csOpenGL::fTexSubImage3D(gzUInt _eTarget, gzInt _nLevel, gzInt _nOffsetX, gzInt _nOffsetY, gzInt _nOffsetZ, gzInt _nWidth, gzInt _nHeight, gzInt _nDepth, gzUInt _eFormat, gzUInt _eType, void* _pPixel){ gz_(53)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fTexSubImage3D")
	GL_fTexSubImage3D(_eTarget, _nLevel, _nOffsetX, _nOffsetY, _nOffsetZ, _nWidth, _nHeight, _nDepth, _eFormat, _eType, _pPixel);
}

void csOpenGL::fBindTexture(gzUInt _eTarget, gzUInt _nTextureId){ gz_(54)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindTexture")
	GL_fBindTexture(_eTarget, _nTextureId);
}

void csOpenGL::fTexParameterf(gzUInt _eTarget, gzUInt _eName, gzFloat32 _nParam){ gz_(55)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fTexParameterf")
	GL_fTexParameterf(_eTarget, _eName, _nParam);
}

void csOpenGL::fTexParameteri(gzUInt _eTarget, gzUInt _eName, gzInt _nParam){ gz_(56)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fTexParameteri")
	GL_fTexParameteri(_eTarget, _eName, _nParam);
}

void csOpenGL::fGenTextures(gzInt _nNb, gzUInt* _aTextures){ gz_(57)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGenTextures")
	GL_fGenTextures(_nNb, _aTextures);
}

void csOpenGL::fClear(Lib_GZ_OpenGL::OpenGL::eClearBuffer _hMask){ gz_(58)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fClear")
	GL_fClear(_hMask);
}

void csOpenGL::fClearColor(gzFloat32 _nRed, gzFloat32 _nGreen, gzFloat32 _nBlue, gzFloat32 _nAlpha){ gz_(59)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fClearColor")
	GL_fClearColor(_nRed, _nGreen, _nBlue, _nAlpha);
}

void csOpenGL::fBufferData(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzUInt _nNb, Lib_GZ_OpenGL::OpenGL::eTypeSize _hType, gzPData(gzUInt8) _pData, Lib_GZ_OpenGL::OpenGL::eDrawFlow _hUsage){ gz_(60)
	//Tag cpp
	//fBufferData(Lib_GZ_OpenGL::OpenGL::eBufferTarget(_hTarget), _nNb * _hType, (void*)_pData.array, _hUsage);
}

void csOpenGL::fBufferData(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzIntX _nSize, void* _pData, Lib_GZ_OpenGL::OpenGL::eDrawFlow _hUsage){ gz_(61)
	/*
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	gzDataRoot* _array = (gzDataRoot*)(_pData) ;
	oGL.call<void>("bufferData", (int)_hTarget, _array->JsMem , (int)_hUsage);
	return;
	#else
	_pData = (void*)((gzDataRoot*)_pData)->aTab;
	#endif
	GL_fBufferData(_hTarget, _nSize, _pData, _hUsage);*/
}

void csOpenGL::fDrawElements(Lib_GZ_OpenGL::OpenGL::eDrawMode _hMode, gzInt _nCount, Lib_GZ_OpenGL::OpenGL::eVarType _hVarType, void* _pOffset){ gz_(62)
	//Tag cpp
	#ifdef wPlatform__Web_Emsc
	//gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, cubeVerticesIndexBuffer);
	oGL.call<void>("drawElements", val((int)_hMode),  _nCount, val((int)_hVarType), (int)_pOffset);	 //N
	return;
	#endif
	GL_fDrawElements(_hMode, _nCount, _hVarType, _pOffset);
}

void csOpenGL::fDrawElementsInstanced(Lib_GZ_OpenGL::OpenGL::eDrawMode _hMode, gzInt _nCount, Lib_GZ_OpenGL::OpenGL::eVarType _hVarType, void* _pIndicesLocation, gzInt _nInstanceCount){ gz_(63)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDrawElementsInstanced")
	GL_fDrawElementsInstanced(_hMode, _nCount, _hVarType, _pIndicesLocation, _nInstanceCount);
}

void csOpenGL::fGenFramebuffers(gzInt _nNb, gzUInt* _aFrameBuffers){ gz_(64)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGenFramebuffers")
	GL_fGenFramebuffers(_nNb, _aFrameBuffers);
}

void csOpenGL::fBindFramebuffer(gzUInt _eTarget, gzUInt _nFrameBufferId){ gz_(65)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindFramebuffer")
	GL_fBindFramebuffer(_eTarget, _nFrameBufferId);
}

void csOpenGL::fGenRenderbuffers(gzInt _nNb, gzUInt* _aRenderBuffers){ gz_(66)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGenRenderbuffers")
	GL_fGenRenderbuffers(_nNb, _aRenderBuffers);
}

void csOpenGL::fBindRenderbuffer(gzUInt _eTarget, gzUInt _nRenderBufferId){ gz_(67)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindRenderbuffer")
	GL_fBindRenderbuffer(_eTarget, _nRenderBufferId);
}

void csOpenGL::fRenderbufferStorage(gzUInt _eTarget, gzUInt _eInternalFormat, gzInt _nWidth, gzInt _nHeight){ gz_(68)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fRenderbufferStorage")
	GL_fRenderbufferStorage(_eTarget, _eInternalFormat, _nWidth, _nHeight);
}

void csOpenGL::fFramebufferTexture2D(gzUInt _eTarget, gzUInt _eAttachement, gzUInt _eTextureTarget, gzUInt _nTexture, gzInt _nLevel){ gz_(69)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fFramebufferTexture2D")
	GL_fFramebufferTexture2D(_eTarget, _eAttachement, _eTextureTarget, _nTexture, _nLevel);
}

void csOpenGL::fFramebufferRenderbuffer(gzUInt _eTarget, gzUInt _eAttachement, gzUInt _eRenderBufferTarget, gzUInt _nRenderBufferId){ gz_(70)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fFramebufferRenderbuffer")
	GL_fFramebufferRenderbuffer(_eTarget, _eAttachement, _eRenderBufferTarget, _nRenderBufferId);
}

gzUInt csOpenGL::fCheckFramebufferStatus(gzUInt _eTarget){ gz_(71)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fCheckFramebufferStatus")
	return GL_fCheckFramebufferStatus(_eTarget);
	return 0;
}

void csOpenGL::fDeleteBuffers(gzInt _nNb, gzUInt* _aBuffers){ gz_(72)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fDeleteBuffers")
	GL_fDeleteBuffers(_nNb, _aBuffers);
}

void csOpenGL::fUniform1f(gzVal _nLocation, gzFloat32 _n0){ gz_(73)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1f")
	GL_fUniform1f(_nLocation, _n0);
}

void csOpenGL::fUniform2f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1){ gz_(74)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2f")
	GL_fUniform2f(_nLocation, _n0, _n1);
}

void csOpenGL::fUniform3f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1, gzFloat32 _n2){ gz_(75)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3f")
	GL_fUniform3f(_nLocation, _n0, _n1, _n2);
}

void csOpenGL::fUniform4f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1, gzFloat32 _n2, gzFloat32 _n3){ gz_(76)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4f")
	GL_fUniform4f(_nLocation, _n0, _n1, _n2, _n3);
}

void csOpenGL::fUniform1i(gzVal _nLocation, gzInt32 _n0){ gz_(77)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1i")
	GL_fUniform1i(_nLocation, _n0);
}

void csOpenGL::fUniform2i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1){ gz_(78)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2i")
	GL_fUniform2i(_nLocation, _n0, _n1);
}

void csOpenGL::fUniform3i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1, gzInt32 _n2){ gz_(79)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3i")
	GL_fUniform3i(_nLocation, _n0, _n1, _n2);
}

void csOpenGL::fUniform4i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1, gzInt32 _n2, gzInt32 _n3){ gz_(80)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4i")
	GL_fUniform4i(_nLocation, _n0, _n1, _n2, _n3);
}

void csOpenGL::fUniform1fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue){ gz_(81)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1fv")
	GL_fUniform1fv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform2fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue){ gz_(82)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2fv")
	GL_fUniform2fv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform3fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue){ gz_(83)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3fv")
	GL_fUniform3fv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform4fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue){ gz_(84)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4fv")
	GL_fUniform4fv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform1iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue){ gz_(85)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1iv")
	GL_fUniform1iv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform2iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue){ gz_(86)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2iv")
	GL_fUniform2iv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform3iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue){ gz_(87)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3iv")
	GL_fUniform3iv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform4iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue){ gz_(88)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4iv")
	GL_fUniform4iv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniformMatrix2fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue){ gz_(89)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix2fv")
	GL_fUniformMatrix2fv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix3fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue){ gz_(90)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix3fv")
	GL_fUniformMatrix3fv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix4fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue){ gz_(91)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix4fv")
	GL_fUniformMatrix4fv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniform1d(gzVal _nLocation, gzFloat64 _nX){ gz_(92)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1d")
	GL_fUniform1d(_nLocation, _nX);
}

void csOpenGL::fUniform2d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY){ gz_(93)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2d")
	GL_fUniform2d(_nLocation, _nX, _nY);
}

void csOpenGL::fUniform3d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY, gzFloat64 _nZ){ gz_(94)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3d")
	GL_fUniform3d(_nLocation, _nX, _nY, _nZ);
}

void csOpenGL::fUniform4d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY, gzFloat64 _nZ, gzFloat64 _nW){ gz_(95)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4d")
	GL_fUniform4d(_nLocation, _nX, _nY, _nZ, _nW);
}

void csOpenGL::fUniform1dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue){ gz_(96)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1dv")
	GL_fUniform1dv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform2dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue){ gz_(97)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2dv")
	GL_fUniform2dv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform3dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue){ gz_(98)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3dv")
	GL_fUniform3dv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform4dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue){ gz_(99)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4dv")
	GL_fUniform4dv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniformMatrix2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(100)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix2dv")
	GL_fUniformMatrix2dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(101)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix3dv")
	GL_fUniformMatrix3dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(102)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix4dv")
	GL_fUniformMatrix4dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix2x3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(103)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix2x3dv")
	GL_fUniformMatrix2x3dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix2x4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(104)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix2x4dv")
	GL_fUniformMatrix2x4dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix3x2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(105)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix3x2dv")
	GL_fUniformMatrix3x2dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix3x4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(106)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix3x4dv")
	GL_fUniformMatrix3x4dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix4x2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(107)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix4x2dv")
	GL_fUniformMatrix4x2dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniformMatrix4x3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue){ gz_(108)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformMatrix4x3dv")
	GL_fUniformMatrix4x3dv(_nLocation, _nCount, _bTranspose, _aValue);
}

void csOpenGL::fUniform1ui(gzVal _nLocation, gzUInt32 _n0){ gz_(109)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1ui")
	GL_fUniform1ui(_nLocation, _n0);
}

void csOpenGL::fUniform2ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1){ gz_(110)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2ui")
	GL_fUniform2ui(_nLocation, _n0, _n1);
}

void csOpenGL::fUniform3ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1, gzUInt32 _n2){ gz_(111)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3ui")
	GL_fUniform3ui(_nLocation, _n0, _n1, _n2);
}

void csOpenGL::fUniform4ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1, gzUInt32 _n2, gzUInt32 _n3){ gz_(112)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4ui")
	GL_fUniform4ui(_nLocation, _n0, _n1, _n2, _n3);
}

void csOpenGL::fUniform1uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue){ gz_(113)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform1uiv")
	GL_fUniform1uiv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform2uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue){ gz_(114)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform2uiv")
	GL_fUniform2uiv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform3uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue){ gz_(115)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform3uiv")
	GL_fUniform3uiv(_nLocation, _nCount, _aValue);
}

void csOpenGL::fUniform4uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue){ gz_(116)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniform4uiv")
	GL_fUniform4uiv(_nLocation, _nCount, _aValue);
}

gzUInt csOpenGL::fGetUniformBlockIndex(gzUInt _nPorgramId, gzUInt8* _cUboName){ gz_(117)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fGetUniformBlockIndex")
	return GL_fGetUniformBlockIndex(_nPorgramId, _cUboName);
	return 0;
}

void csOpenGL::fBindBufferBase(gzUInt _eTarget, gzUInt _nIndex, gzUInt _nBuffer){ gz_(118)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fBindBufferBase")
	GL_fBindBufferBase(_eTarget, _nIndex, _nBuffer);
}

void csOpenGL::fUniformBlockBinding(gzUInt _nPorgramId, gzUInt _nUniformBlickId, gzUInt _nBindPoint){ gz_(119)
	GZ_mIsImplemented("GzOpenGL::OpenGL::fUniformBlockBinding")
	GL_fUniformBlockBinding(_nPorgramId, _nUniformBlickId, _nBindPoint);
}

cOpenGL::cOpenGL(Lib_GZ::cClass* _parent) : Lib_GZ::cClass(_parent){

}

void cOpenGL::Ini_cOpenGL(){ gz_(120)
	Ini_cClass();
}
/*
gzAny cOpenGL::MemCopy(){
return (gzAny)new cOpenGL(*this);
}
gzAny cOpenGL::DeepCopy(){
return (gzAny)new cOpenGL(*this, true);
}*/
cOpenGL::~cOpenGL(){
}



}
//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "Lib_GZ_OpenGL/OpenGL.h"

#if !( defined wPlatform__Web_Emsc ||  defined GZ_tCpcDos  ||  defined GZ_tLite ) 
FUNC_fGetError glCall_fGetError = 0;
FUNC_fFlush glCall_fFlush = 0;
FUNC_fEnable glCall_fEnable = 0;
FUNC_fDisable glCall_fDisable = 0;
FUNC_fDepthMask glCall_fDepthMask = 0;
FUNC_fDepthFunc glCall_fDepthFunc = 0;
FUNC_fGetBooleanv glCall_fGetBooleanv = 0;
FUNC_fGetDoublev glCall_fGetDoublev = 0;
FUNC_fGetFloatv glCall_fGetFloatv = 0;
FUNC_fGetIntegerv glCall_fGetIntegerv = 0;
FUNC_fGetInteger64v glCall_fGetInteger64v = 0;
FUNC_fGetBooleani_v glCall_fGetBooleani_v = 0;
FUNC_fGetIntegeri_v glCall_fGetIntegeri_v = 0;
FUNC_fGetFloati_v glCall_fGetFloati_v = 0;
FUNC_fGetDoublei_v glCall_fGetDoublei_v = 0;
FUNC_fGetInteger64i_v glCall_fGetInteger64i_v = 0;
FUNC_fVertexAttribPointer glCall_fVertexAttribPointer = 0;
FUNC_fVertexAttribDivisor glCall_fVertexAttribDivisor = 0;
FUNC_fEnableVertexAttribArray glCall_fEnableVertexAttribArray = 0;
FUNC_fDisableVertexAttribArray glCall_fDisableVertexAttribArray = 0;
FUNC_fSwapIntervalEXT glCall_fSwapIntervalEXT = 0;
FUNC_fBlendEquation glCall_fBlendEquation = 0;
FUNC_fBlendFuncSeparate glCall_fBlendFuncSeparate = 0;
FUNC_fBlendFunc glCall_fBlendFunc = 0;
FUNC_fGenVertexArrays glCall_fGenVertexArrays = 0;
FUNC_fGenBuffers glCall_fGenBuffers = 0;
FUNC_fBindVertexArray glCall_fBindVertexArray = 0;
FUNC_fBindBuffer glCall_fBindBuffer = 0;
FUNC_fBufferSubData glCall_fBufferSubData = 0;
FUNC_fGetShaderInfoLog glCall_fGetShaderInfoLog = 0;
FUNC_fCreateProgram glCall_fCreateProgram = 0;
FUNC_fLinkProgram glCall_fLinkProgram = 0;
FUNC_fGetProgramiv glCall_fGetProgramiv = 0;
FUNC_fUseProgram glCall_fUseProgram = 0;
FUNC_fDeleteProgram glCall_fDeleteProgram = 0;
FUNC_fGetProgramInfoLog glCall_fGetProgramInfoLog = 0;
FUNC_fGetUniformLocation glCall_fGetUniformLocation = 0;
FUNC_fGetAttribLocation glCall_fGetAttribLocation = 0;
FUNC_fBindAttribLocation glCall_fBindAttribLocation = 0;
FUNC_fCreateShader glCall_fCreateShader = 0;
FUNC_fShaderSource glCall_fShaderSource = 0;
FUNC_fCompileShader glCall_fCompileShader = 0;
FUNC_fGetShaderiv glCall_fGetShaderiv = 0;
FUNC_fDeleteShader glCall_fDeleteShader = 0;
FUNC_fAttachShader glCall_fAttachShader = 0;
FUNC_fActiveTexture glCall_fActiveTexture = 0;
FUNC_fTexImage2D glCall_fTexImage2D = 0;
FUNC_fTexImage3D glCall_fTexImage3D = 0;
FUNC_fTexSubImage3D glCall_fTexSubImage3D = 0;
FUNC_fBindTexture glCall_fBindTexture = 0;
FUNC_fTexParameterf glCall_fTexParameterf = 0;
FUNC_fTexParameteri glCall_fTexParameteri = 0;
FUNC_fGenTextures glCall_fGenTextures = 0;
FUNC_fClear glCall_fClear = 0;
FUNC_fClearColor glCall_fClearColor = 0;
FUNC_fBufferData glCall_fBufferData = 0;
FUNC_fDrawElements glCall_fDrawElements = 0;
FUNC_fDrawElementsInstanced glCall_fDrawElementsInstanced = 0;
FUNC_fGenFramebuffers glCall_fGenFramebuffers = 0;
FUNC_fBindFramebuffer glCall_fBindFramebuffer = 0;
FUNC_fGenRenderbuffers glCall_fGenRenderbuffers = 0;
FUNC_fBindRenderbuffer glCall_fBindRenderbuffer = 0;
FUNC_fRenderbufferStorage glCall_fRenderbufferStorage = 0;
FUNC_fFramebufferTexture2D glCall_fFramebufferTexture2D = 0;
FUNC_fFramebufferRenderbuffer glCall_fFramebufferRenderbuffer = 0;
FUNC_fCheckFramebufferStatus glCall_fCheckFramebufferStatus = 0;
FUNC_fDeleteBuffers glCall_fDeleteBuffers = 0;
FUNC_fUniform1f glCall_fUniform1f = 0;
FUNC_fUniform2f glCall_fUniform2f = 0;
FUNC_fUniform3f glCall_fUniform3f = 0;
FUNC_fUniform4f glCall_fUniform4f = 0;
FUNC_fUniform1i glCall_fUniform1i = 0;
FUNC_fUniform2i glCall_fUniform2i = 0;
FUNC_fUniform3i glCall_fUniform3i = 0;
FUNC_fUniform4i glCall_fUniform4i = 0;
FUNC_fUniform1fv glCall_fUniform1fv = 0;
FUNC_fUniform2fv glCall_fUniform2fv = 0;
FUNC_fUniform3fv glCall_fUniform3fv = 0;
FUNC_fUniform4fv glCall_fUniform4fv = 0;
FUNC_fUniform1iv glCall_fUniform1iv = 0;
FUNC_fUniform2iv glCall_fUniform2iv = 0;
FUNC_fUniform3iv glCall_fUniform3iv = 0;
FUNC_fUniform4iv glCall_fUniform4iv = 0;
FUNC_fUniformMatrix2fv glCall_fUniformMatrix2fv = 0;
FUNC_fUniformMatrix3fv glCall_fUniformMatrix3fv = 0;
FUNC_fUniformMatrix4fv glCall_fUniformMatrix4fv = 0;
FUNC_fUniform1d glCall_fUniform1d = 0;
FUNC_fUniform2d glCall_fUniform2d = 0;
FUNC_fUniform3d glCall_fUniform3d = 0;
FUNC_fUniform4d glCall_fUniform4d = 0;
FUNC_fUniform1dv glCall_fUniform1dv = 0;
FUNC_fUniform2dv glCall_fUniform2dv = 0;
FUNC_fUniform3dv glCall_fUniform3dv = 0;
FUNC_fUniform4dv glCall_fUniform4dv = 0;
FUNC_fUniformMatrix2dv glCall_fUniformMatrix2dv = 0;
FUNC_fUniformMatrix3dv glCall_fUniformMatrix3dv = 0;
FUNC_fUniformMatrix4dv glCall_fUniformMatrix4dv = 0;
FUNC_fUniformMatrix2x3dv glCall_fUniformMatrix2x3dv = 0;
FUNC_fUniformMatrix2x4dv glCall_fUniformMatrix2x4dv = 0;
FUNC_fUniformMatrix3x2dv glCall_fUniformMatrix3x2dv = 0;
FUNC_fUniformMatrix3x4dv glCall_fUniformMatrix3x4dv = 0;
FUNC_fUniformMatrix4x2dv glCall_fUniformMatrix4x2dv = 0;
FUNC_fUniformMatrix4x3dv glCall_fUniformMatrix4x3dv = 0;
FUNC_fUniform1ui glCall_fUniform1ui = 0;
FUNC_fUniform2ui glCall_fUniform2ui = 0;
FUNC_fUniform3ui glCall_fUniform3ui = 0;
FUNC_fUniform4ui glCall_fUniform4ui = 0;
FUNC_fUniform1uiv glCall_fUniform1uiv = 0;
FUNC_fUniform2uiv glCall_fUniform2uiv = 0;
FUNC_fUniform3uiv glCall_fUniform3uiv = 0;
FUNC_fUniform4uiv glCall_fUniform4uiv = 0;
FUNC_fGetUniformBlockIndex glCall_fGetUniformBlockIndex = 0;
FUNC_fBindBufferBase glCall_fBindBufferBase = 0;
FUNC_fUniformBlockBinding glCall_fUniformBlockBinding = 0;


gzBool Lib_GZ_OpenGL::SysGpuFunc::fGetGpuFunctions(){

using namespace SysGpuFunc;
glCall_fGetError = (FUNC_fGetError)fGetFuncGL("glGetError");
glCall_fFlush = (FUNC_fFlush)fGetFuncGL("glFlush");
glCall_fEnable = (FUNC_fEnable)fGetFuncGL("glEnable");
glCall_fDisable = (FUNC_fDisable)fGetFuncGL("glDisable");
glCall_fDepthMask = (FUNC_fDepthMask)fGetFuncGL("glDepthMask");
glCall_fDepthFunc = (FUNC_fDepthFunc)fGetFuncGL("glDepthFunc");
glCall_fGetBooleanv = (FUNC_fGetBooleanv)fGetFuncGL("glGetBooleanv");
glCall_fGetDoublev = (FUNC_fGetDoublev)fGetFuncGL("glGetDoublev");
glCall_fGetFloatv = (FUNC_fGetFloatv)fGetFuncGL("glGetFloatv");
glCall_fGetIntegerv = (FUNC_fGetIntegerv)fGetFuncGL("glGetIntegerv");
glCall_fGetInteger64v = (FUNC_fGetInteger64v)fGetFuncGL("glGetInteger64v");
glCall_fGetBooleani_v = (FUNC_fGetBooleani_v)fGetFuncGL("glGetBooleani_v");
glCall_fGetIntegeri_v = (FUNC_fGetIntegeri_v)fGetFuncGL("glGetIntegeri_v");
glCall_fGetFloati_v = (FUNC_fGetFloati_v)fGetFuncGL("glGetFloati_v");
glCall_fGetDoublei_v = (FUNC_fGetDoublei_v)fGetFuncGL("glGetDoublei_v");
glCall_fGetInteger64i_v = (FUNC_fGetInteger64i_v)fGetFuncGL("glGetInteger64i_v");
glCall_fVertexAttribPointer = (FUNC_fVertexAttribPointer)fGetFuncGL("glVertexAttribPointer");
glCall_fVertexAttribDivisor = (FUNC_fVertexAttribDivisor)fGetFuncGL("glVertexAttribDivisor");
glCall_fEnableVertexAttribArray = (FUNC_fEnableVertexAttribArray)fGetFuncGL("glEnableVertexAttribArray");
glCall_fDisableVertexAttribArray = (FUNC_fDisableVertexAttribArray)fGetFuncGL("glDisableVertexAttribArray");
glCall_fSwapIntervalEXT = (FUNC_fSwapIntervalEXT)fGetFuncGL("wglSwapIntervalEXT");
glCall_fBlendEquation = (FUNC_fBlendEquation)fGetFuncGL("glBlendEquation");
glCall_fBlendFuncSeparate = (FUNC_fBlendFuncSeparate)fGetFuncGL("glBlendFuncSeparate");
glCall_fBlendFunc = (FUNC_fBlendFunc)fGetFuncGL("glBlendFunc");
glCall_fGenVertexArrays = (FUNC_fGenVertexArrays)fGetFuncGL("glGenVertexArrays");
glCall_fGenBuffers = (FUNC_fGenBuffers)fGetFuncGL("glGenBuffers");
glCall_fBindVertexArray = (FUNC_fBindVertexArray)fGetFuncGL("glBindVertexArray");
glCall_fBindBuffer = (FUNC_fBindBuffer)fGetFuncGL("glBindBuffer");
glCall_fBufferSubData = (FUNC_fBufferSubData)fGetFuncGL("glBufferSubData");
glCall_fGetShaderInfoLog = (FUNC_fGetShaderInfoLog)fGetFuncGL("glGetShaderInfoLog");
glCall_fCreateProgram = (FUNC_fCreateProgram)fGetFuncGL("glCreateProgram");
glCall_fLinkProgram = (FUNC_fLinkProgram)fGetFuncGL("glLinkProgram");
glCall_fGetProgramiv = (FUNC_fGetProgramiv)fGetFuncGL("glGetProgramiv");
glCall_fUseProgram = (FUNC_fUseProgram)fGetFuncGL("glUseProgram");
glCall_fDeleteProgram = (FUNC_fDeleteProgram)fGetFuncGL("glDeleteProgram");
glCall_fGetProgramInfoLog = (FUNC_fGetProgramInfoLog)fGetFuncGL("glGetProgramInfoLog");
glCall_fGetUniformLocation = (FUNC_fGetUniformLocation)fGetFuncGL("glGetUniformLocation");
glCall_fGetAttribLocation = (FUNC_fGetAttribLocation)fGetFuncGL("glGetAttribLocation");
glCall_fBindAttribLocation = (FUNC_fBindAttribLocation)fGetFuncGL("glBindAttribLocation");
glCall_fCreateShader = (FUNC_fCreateShader)fGetFuncGL("glCreateShader");
glCall_fShaderSource = (FUNC_fShaderSource)fGetFuncGL("glShaderSource");
glCall_fCompileShader = (FUNC_fCompileShader)fGetFuncGL("glCompileShader");
glCall_fGetShaderiv = (FUNC_fGetShaderiv)fGetFuncGL("glGetShaderiv");
glCall_fDeleteShader = (FUNC_fDeleteShader)fGetFuncGL("glDeleteShader");
glCall_fAttachShader = (FUNC_fAttachShader)fGetFuncGL("glAttachShader");
glCall_fActiveTexture = (FUNC_fActiveTexture)fGetFuncGL("glActiveTexture");
glCall_fTexImage2D = (FUNC_fTexImage2D)fGetFuncGL("glTexImage2D");
glCall_fTexImage3D = (FUNC_fTexImage3D)fGetFuncGL("glTexImage3D");
glCall_fTexSubImage3D = (FUNC_fTexSubImage3D)fGetFuncGL("glTexSubImage3D");
glCall_fBindTexture = (FUNC_fBindTexture)fGetFuncGL("glBindTexture");
glCall_fTexParameterf = (FUNC_fTexParameterf)fGetFuncGL("glTexParameterf");
glCall_fTexParameteri = (FUNC_fTexParameteri)fGetFuncGL("glTexParameteri");
glCall_fGenTextures = (FUNC_fGenTextures)fGetFuncGL("glGenTextures");
glCall_fClear = (FUNC_fClear)fGetFuncGL("glClear");
glCall_fClearColor = (FUNC_fClearColor)fGetFuncGL("glClearColor");
glCall_fBufferData = (FUNC_fBufferData)fGetFuncGL("glBufferData");
glCall_fDrawElements = (FUNC_fDrawElements)fGetFuncGL("glDrawElements");
glCall_fDrawElementsInstanced = (FUNC_fDrawElementsInstanced)fGetFuncGL("glDrawElementsInstanced");
glCall_fGenFramebuffers = (FUNC_fGenFramebuffers)fGetFuncGL("glGenFramebuffers");
glCall_fBindFramebuffer = (FUNC_fBindFramebuffer)fGetFuncGL("glBindFramebuffer");
glCall_fGenRenderbuffers = (FUNC_fGenRenderbuffers)fGetFuncGL("glGenRenderbuffers");
glCall_fBindRenderbuffer = (FUNC_fBindRenderbuffer)fGetFuncGL("glBindRenderbuffer");
glCall_fRenderbufferStorage = (FUNC_fRenderbufferStorage)fGetFuncGL("glRenderbufferStorage");
glCall_fFramebufferTexture2D = (FUNC_fFramebufferTexture2D)fGetFuncGL("glFramebufferTexture2D");
glCall_fFramebufferRenderbuffer = (FUNC_fFramebufferRenderbuffer)fGetFuncGL("glFramebufferRenderbuffer");
glCall_fCheckFramebufferStatus = (FUNC_fCheckFramebufferStatus)fGetFuncGL("glCheckFramebufferStatus");
glCall_fDeleteBuffers = (FUNC_fDeleteBuffers)fGetFuncGL("glDeleteBuffers");
glCall_fUniform1f = (FUNC_fUniform1f)fGetFuncGL("glUniform1f");
glCall_fUniform2f = (FUNC_fUniform2f)fGetFuncGL("glUniform2f");
glCall_fUniform3f = (FUNC_fUniform3f)fGetFuncGL("glUniform3f");
glCall_fUniform4f = (FUNC_fUniform4f)fGetFuncGL("glUniform4f");
glCall_fUniform1i = (FUNC_fUniform1i)fGetFuncGL("glUniform1i");
glCall_fUniform2i = (FUNC_fUniform2i)fGetFuncGL("glUniform2i");
glCall_fUniform3i = (FUNC_fUniform3i)fGetFuncGL("glUniform3i");
glCall_fUniform4i = (FUNC_fUniform4i)fGetFuncGL("glUniform4i");
glCall_fUniform1fv = (FUNC_fUniform1fv)fGetFuncGL("glUniform1fv");
glCall_fUniform2fv = (FUNC_fUniform2fv)fGetFuncGL("glUniform2fv");
glCall_fUniform3fv = (FUNC_fUniform3fv)fGetFuncGL("glUniform3fv");
glCall_fUniform4fv = (FUNC_fUniform4fv)fGetFuncGL("glUniform4fv");
glCall_fUniform1iv = (FUNC_fUniform1iv)fGetFuncGL("glUniform1iv");
glCall_fUniform2iv = (FUNC_fUniform2iv)fGetFuncGL("glUniform2iv");
glCall_fUniform3iv = (FUNC_fUniform3iv)fGetFuncGL("glUniform3iv");
glCall_fUniform4iv = (FUNC_fUniform4iv)fGetFuncGL("glUniform4iv");
glCall_fUniformMatrix2fv = (FUNC_fUniformMatrix2fv)fGetFuncGL("glUniformMatrix2fv");
glCall_fUniformMatrix3fv = (FUNC_fUniformMatrix3fv)fGetFuncGL("glUniformMatrix3fv");
glCall_fUniformMatrix4fv = (FUNC_fUniformMatrix4fv)fGetFuncGL("glUniformMatrix4fv");
glCall_fUniform1d = (FUNC_fUniform1d)fGetFuncGL("glUniform1d");
glCall_fUniform2d = (FUNC_fUniform2d)fGetFuncGL("glUniform2d");
glCall_fUniform3d = (FUNC_fUniform3d)fGetFuncGL("glUniform3d");
glCall_fUniform4d = (FUNC_fUniform4d)fGetFuncGL("glUniform4d");
glCall_fUniform1dv = (FUNC_fUniform1dv)fGetFuncGL("glUniform1dv");
glCall_fUniform2dv = (FUNC_fUniform2dv)fGetFuncGL("glUniform2dv");
glCall_fUniform3dv = (FUNC_fUniform3dv)fGetFuncGL("glUniform3dv");
glCall_fUniform4dv = (FUNC_fUniform4dv)fGetFuncGL("glUniform4dv");
glCall_fUniformMatrix2dv = (FUNC_fUniformMatrix2dv)fGetFuncGL("glUniformMatrix2dv");
glCall_fUniformMatrix3dv = (FUNC_fUniformMatrix3dv)fGetFuncGL("glUniformMatrix3dv");
glCall_fUniformMatrix4dv = (FUNC_fUniformMatrix4dv)fGetFuncGL("glUniformMatrix4dv");
glCall_fUniformMatrix2x3dv = (FUNC_fUniformMatrix2x3dv)fGetFuncGL("glUniformMatrix2x3dv");
glCall_fUniformMatrix2x4dv = (FUNC_fUniformMatrix2x4dv)fGetFuncGL("glUniformMatrix2x4dv");
glCall_fUniformMatrix3x2dv = (FUNC_fUniformMatrix3x2dv)fGetFuncGL("glUniformMatrix3x2dv");
glCall_fUniformMatrix3x4dv = (FUNC_fUniformMatrix3x4dv)fGetFuncGL("glUniformMatrix3x4dv");
glCall_fUniformMatrix4x2dv = (FUNC_fUniformMatrix4x2dv)fGetFuncGL("glUniformMatrix4x2dv");
glCall_fUniformMatrix4x3dv = (FUNC_fUniformMatrix4x3dv)fGetFuncGL("glUniformMatrix4x3dv");
glCall_fUniform1ui = (FUNC_fUniform1ui)fGetFuncGL("glUniform1ui");
glCall_fUniform2ui = (FUNC_fUniform2ui)fGetFuncGL("glUniform2ui");
glCall_fUniform3ui = (FUNC_fUniform3ui)fGetFuncGL("glUniform3ui");
glCall_fUniform4ui = (FUNC_fUniform4ui)fGetFuncGL("glUniform4ui");
glCall_fUniform1uiv = (FUNC_fUniform1uiv)fGetFuncGL("glUniform1uiv");
glCall_fUniform2uiv = (FUNC_fUniform2uiv)fGetFuncGL("glUniform2uiv");
glCall_fUniform3uiv = (FUNC_fUniform3uiv)fGetFuncGL("glUniform3uiv");
glCall_fUniform4uiv = (FUNC_fUniform4uiv)fGetFuncGL("glUniform4uiv");
glCall_fGetUniformBlockIndex = (FUNC_fGetUniformBlockIndex)fGetFuncGL("glGetUniformBlockIndex");
glCall_fBindBufferBase = (FUNC_fBindBufferBase)fGetFuncGL("glBindBufferBase");
glCall_fUniformBlockBinding = (FUNC_fUniformBlockBinding)fGetFuncGL("glUniformBlockBinding");

return true;
}

void  glDbg_fFlush(const char* _file , gzUInt _line){
	glCall_fFlush();
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glFlush( ") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fEnable(gzUInt _eCapability, const char* _file , gzUInt _line){
	glCall_fEnable(_eCapability);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glEnable( ") + gzU8("_eCapability|") + gzStrUI(_eCapability) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDisable(gzUInt _eCapability, const char* _file , gzUInt _line){
	glCall_fDisable(_eCapability);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDisable( ") + gzU8("_eCapability|") + gzStrUI(_eCapability) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDepthMask(gzBool _bEnable, const char* _file , gzUInt _line){
	glCall_fDepthMask(_bEnable);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDepthMask( ") + gzU8("_bEnable|") + gzStrB(_bEnable) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDepthFunc(gzUInt _eFunc, const char* _file , gzUInt _line){
	glCall_fDepthFunc(_eFunc);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDepthFunc( ") + gzU8("_eFunc|") + gzStrUI(_eFunc) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetBooleanv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzBool* _pData, const char* _file , gzUInt _line){
	glCall_fGetBooleanv(_hName, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetBooleanv( ") + gzU8("_hName|") + gzStrUI(_hName) + gzU8("|, ") + gzU8("_pData|") + gzStrB(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetDoublev(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzFloat64* _pData, const char* _file , gzUInt _line){
	glCall_fGetDoublev(_hName, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetDoublev( ") + gzU8("_hName|") + gzStrUI(_hName) + gzU8("|, ") + gzU8("_pData|") + gzStrF(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetFloatv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzFloat32* _pData, const char* _file , gzUInt _line){
	glCall_fGetFloatv(_hName, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetFloatv( ") + gzU8("_hName|") + gzStrUI(_hName) + gzU8("|, ") + gzU8("_pData|") + gzStrF(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetIntegerv(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzInt32* _pData, const char* _file , gzUInt _line){
	glCall_fGetIntegerv(_hName, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetIntegerv( ") + gzU8("_hName|") + gzStrUI(_hName) + gzU8("|, ") + gzU8("_pData|") + gzStrI(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetInteger64v(Lib_GZ_OpenGL::OpenGL::eGetName _hName, gzInt64* _pData, const char* _file , gzUInt _line){
	glCall_fGetInteger64v(_hName, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetInteger64v( ") + gzU8("_hName|") + gzStrUI(_hName) + gzU8("|, ") + gzU8("_pData|") + gzStrI(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetBooleani_v(gzUInt _hTarget, gzUInt _nIndex, gzBool* _pData, const char* _file , gzUInt _line){
	glCall_fGetBooleani_v(_hTarget, _nIndex, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetBooleani_v( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_pData|") + gzStrB(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetIntegeri_v(gzUInt _hTarget, gzUInt _nIndex, gzFloat64* _pData, const char* _file , gzUInt _line){
	glCall_fGetIntegeri_v(_hTarget, _nIndex, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetIntegeri_v( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_pData|") + gzStrF(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetFloati_v(gzUInt _hTarget, gzUInt _nIndex, gzFloat32* _pData, const char* _file , gzUInt _line){
	glCall_fGetFloati_v(_hTarget, _nIndex, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetFloati_v( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_pData|") + gzStrF(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetDoublei_v(gzUInt _hTarget, gzUInt _nIndex, gzInt32* _pData, const char* _file , gzUInt _line){
	glCall_fGetDoublei_v(_hTarget, _nIndex, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetDoublei_v( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_pData|") + gzStrI(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetInteger64i_v(gzUInt _hTarget, gzUInt _nIndex, gzInt64* _pData, const char* _file , gzUInt _line){
	glCall_fGetInteger64i_v(_hTarget, _nIndex, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetInteger64i_v( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_pData|") + gzStrI(*_pData) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fVertexAttribPointer(gzVal _nIndex, Lib_GZ_OpenGL::OpenGL::eVecLength _hLength, Lib_GZ_OpenGL::OpenGL::eVarType _hType, gzBool _bNormalized, gzInt _nStride, gzUInt _nPointer, const char* _file , gzUInt _line){
	glCall_fVertexAttribPointer(_nIndex, _hLength, _hType, _bNormalized, _nStride, _nPointer);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glVertexAttribPointer( ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_hLength|") + gzStrUI(_hLength) + gzU8("|, ") + gzU8("_hType|") + gzStrUI(_hType) + gzU8("|, ") + gzU8("_bNormalized|") + gzStrB(_bNormalized) + gzU8("|, ") + gzU8("_nStride|") + gzStrI(_nStride) + gzU8("|, ") + gzU8("_nPointer|") + gzStrI(_nPointer) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fVertexAttribDivisor(gzVal _nIndex, gzUInt _nDivisor, const char* _file , gzUInt _line){
	glCall_fVertexAttribDivisor(_nIndex, _nDivisor);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glVertexAttribDivisor( ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_nDivisor|") + gzStrI(_nDivisor) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fEnableVertexAttribArray(gzVal _nIndex, const char* _file , gzUInt _line){
	glCall_fEnableVertexAttribArray(_nIndex);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glEnableVertexAttribArray( ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDisableVertexAttribArray(gzUInt _nIndex, const char* _file , gzUInt _line){
	glCall_fDisableVertexAttribArray(_nIndex);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDisableVertexAttribArray( ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzBool  glDbg_fSwapIntervalEXT(gzInt _nInterval, const char* _file , gzUInt _line){
	 #ifdef wPlatform__Windows
	 System::fResetLastError();
	gzBool _Ret = glCall_fSwapIntervalEXT(_nInterval);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glSwapIntervalEXT( ") + gzU8("_nInterval|") + gzStrI(_nInterval) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	nErr = GetLastError();
	if(nErr){
	GZ_Debug_fError(System::fGetLastErrorString(nErr) + gzU8(": glSwapIntervalEXT( ") + gzU8("_nInterval|") + gzStrI(_nInterval) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
	 #endif
	 return false;
}
void  glDbg_fBlendEquation(gzUInt _eMode, const char* _file , gzUInt _line){
	glCall_fBlendEquation(_eMode);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBlendEquation( ") + gzU8("_eMode|") + gzStrUI(_eMode) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBlendFuncSeparate(gzUInt _eSFactorRGB, gzUInt _eDFactorRGB, gzUInt _eSFactorAlpha, gzUInt _eDFactorAlpha, const char* _file , gzUInt _line){
	glCall_fBlendFuncSeparate(_eSFactorRGB, _eDFactorRGB, _eSFactorAlpha, _eDFactorAlpha);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBlendFuncSeparate( ") + gzU8("_eSFactorRGB|") + gzStrUI(_eSFactorRGB) + gzU8("|, ") + gzU8("_eDFactorRGB|") + gzStrUI(_eDFactorRGB) + gzU8("|, ") + gzU8("_eSFactorAlpha|") + gzStrUI(_eSFactorAlpha) + gzU8("|, ") + gzU8("_eDFactorAlpha|") + gzStrUI(_eDFactorAlpha) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBlendFunc(gzUInt _eSrcFactor, gzUInt _eDstFactor, const char* _file , gzUInt _line){
	glCall_fBlendFunc(_eSrcFactor, _eDstFactor);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBlendFunc( ") + gzU8("_eSrcFactor|") + gzStrUI(_eSrcFactor) + gzU8("|, ") + gzU8("_eDstFactor|") + gzStrUI(_eDstFactor) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGenVertexArrays(gzInt _nNb, gzUInt* _aArrays, const char* _file , gzUInt _line){
	glCall_fGenVertexArrays(_nNb, _aArrays);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGenVertexArrays( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aArrays|") + gzStrI(*_aArrays)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGenBuffers(gzInt _nNb, gzUInt* _aBuffers, const char* _file , gzUInt _line){
	glCall_fGenBuffers(_nNb, _aBuffers);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGenBuffers( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aBuffers|") + gzStrI(*_aBuffers)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBindVertexArray(gzUInt _nVAO, const char* _file , gzUInt _line){
	glCall_fBindVertexArray(_nVAO);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindVertexArray( ") + gzU8("_nVAO|") + gzStrI(_nVAO) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBindBuffer(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzVal _nBuffer, const char* _file , gzUInt _line){
	glCall_fBindBuffer(_hTarget, _nBuffer);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindBuffer( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nBuffer|") + gzStrI(_nBuffer) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBufferSubData(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzIntX _nOffset, gzIntX _nSize, void* _pData, const char* _file , gzUInt _line){
	glCall_fBufferSubData(_hTarget, _nOffset, _nSize, _pData);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBufferSubData( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nOffset|") + gzStrI(_nOffset) + gzU8("|, ") + gzU8("_nSize|") + gzStrI(_nSize) + gzU8("|, ") + gzU8("_pData|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetShaderInfoLog(gzVal _nShaderId, gzInt _nMaxLength, gzInt* _aLength, gzUInt8* _cLogInfo, const char* _file , gzUInt _line){
	glCall_fGetShaderInfoLog(_nShaderId, _nMaxLength, _aLength, _cLogInfo);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetShaderInfoLog( ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("|, ") + gzU8("_nMaxLength|") + gzStrI(_nMaxLength) + gzU8("|, ") + gzU8("_aLength|") + gzStrI(*_aLength)+ gzU8("*") + gzU8("|, ") + gzU8("_cLogInfo|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzVal  glDbg_fCreateProgram(const char* _file , gzUInt _line){
	gzVal _Ret = glCall_fCreateProgram();
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glCreateProgram( ") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
void  glDbg_fLinkProgram(gzVal _nIdProgram, const char* _file , gzUInt _line){
	glCall_fLinkProgram(_nIdProgram);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glLinkProgram( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetProgramiv(gzVal _nIdProgram, Lib_GZ_OpenGL::OpenGL::eProgramInfo _hInfo, gzInt* _aParams, const char* _file , gzUInt _line){
	glCall_fGetProgramiv(_nIdProgram, _hInfo, _aParams);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetProgramiv( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("|, ") + gzU8("_hInfo|") + gzStrUI(_hInfo) + gzU8("|, ") + gzU8("_aParams|") + gzStrI(*_aParams)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUseProgram(gzVal _nIdProgram, const char* _file , gzUInt _line){
	glCall_fUseProgram(_nIdProgram);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUseProgram( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDeleteProgram(gzVal _nIdProgram, const char* _file , gzUInt _line){
	glCall_fDeleteProgram(_nIdProgram);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDeleteProgram( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetProgramInfoLog(gzVal _nProgramId, gzInt _nMaxLength, gzInt* _aLength, gzUInt8* _cLogInfo, const char* _file , gzUInt _line){
	glCall_fGetProgramInfoLog(_nProgramId, _nMaxLength, _aLength, _cLogInfo);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetProgramInfoLog( ") + gzU8("_nProgramId|") + gzStrI(_nProgramId) + gzU8("|, ") + gzU8("_nMaxLength|") + gzStrI(_nMaxLength) + gzU8("|, ") + gzU8("_aLength|") + gzStrI(*_aLength)+ gzU8("*") + gzU8("|, ") + gzU8("_cLogInfo|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzVal  glDbg_fGetUniformLocation(gzVal _nIdProgram, gzUInt8* _cName, const char* _file , gzUInt _line){
	gzVal _Ret = glCall_fGetUniformLocation(_nIdProgram, _cName);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetUniformLocation( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("|, ") + gzU8("_cName|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
gzVal  glDbg_fGetAttribLocation(gzVal _nIdProgram, gzUInt8* _cName, const char* _file , gzUInt _line){
	gzVal _Ret = glCall_fGetAttribLocation(_nIdProgram, _cName);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetAttribLocation( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("|, ") + gzU8("_cName|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
void  glDbg_fBindAttribLocation(gzVal _nIdProgram, gzUInt _nIndex, gzUInt8* _cName, const char* _file , gzUInt _line){
	glCall_fBindAttribLocation(_nIdProgram, _nIndex, _cName);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindAttribLocation( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_cName|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzVal  glDbg_fCreateShader(Lib_GZ_OpenGL::OpenGL::eShader _hType, const char* _file , gzUInt _line){
	gzVal _Ret = glCall_fCreateShader(_hType);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glCreateShader( ") + gzU8("_hType|") + gzStrUI(_hType) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
void  glDbg_fShaderSource(gzVal _nShaderId, gzInt _nCount, gzUInt8** _cSourceCode, gzInt* _pLength, const char* _file , gzUInt _line){
	glCall_fShaderSource(_nShaderId, _nCount, _cSourceCode, _pLength);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glShaderSource( ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_cSourceCode|") + gzU8("*") + gzU8("|, ") + gzU8("_pLength|") + gzStrI(*_pLength) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fCompileShader(gzVal _nShaderId, const char* _file , gzUInt _line){
	glCall_fCompileShader(_nShaderId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glCompileShader( ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGetShaderiv(gzVal _nShaderId, Lib_GZ_OpenGL::OpenGL::eShaderInfo _hInfo, gzInt* _aParams, const char* _file , gzUInt _line){
	glCall_fGetShaderiv(_nShaderId, _hInfo, _aParams);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetShaderiv( ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("|, ") + gzU8("_hInfo|") + gzStrUI(_hInfo) + gzU8("|, ") + gzU8("_aParams|") + gzStrI(*_aParams)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDeleteShader(gzVal _nShaderId, const char* _file , gzUInt _line){
	glCall_fDeleteShader(_nShaderId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDeleteShader( ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fAttachShader(gzVal _nIdProgram, gzVal _nShaderId, const char* _file , gzUInt _line){
	glCall_fAttachShader(_nIdProgram, _nShaderId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glAttachShader( ") + gzU8("_nIdProgram|") + gzStrI(_nIdProgram) + gzU8("|, ") + gzU8("_nShaderId|") + gzStrI(_nShaderId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fActiveTexture(gzUInt _eTexture, const char* _file , gzUInt _line){
	glCall_fActiveTexture(_eTexture);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glActiveTexture( ") + gzU8("_eTexture|") + gzStrUI(_eTexture) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fTexImage2D(gzUInt _eTarget, gzInt _nLevel, gzInt _nInternalformat, gzInt _nWidth, gzInt _nHeight, gzInt _nBorder, gzUInt _eFormat, gzUInt _eType, void* _pPixel, const char* _file , gzUInt _line){
	glCall_fTexImage2D(_eTarget, _nLevel, _nInternalformat, _nWidth, _nHeight, _nBorder, _eFormat, _eType, _pPixel);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glTexImage2D( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nLevel|") + gzStrI(_nLevel) + gzU8("|, ") + gzU8("_nInternalformat|") + gzStrI(_nInternalformat) + gzU8("|, ") + gzU8("_nWidth|") + gzStrI(_nWidth) + gzU8("|, ") + gzU8("_nHeight|") + gzStrI(_nHeight) + gzU8("|, ") + gzU8("_nBorder|") + gzStrI(_nBorder) + gzU8("|, ") + gzU8("_eFormat|") + gzStrUI(_eFormat) + gzU8("|, ") + gzU8("_eType|") + gzStrUI(_eType) + gzU8("|, ") + gzU8("_pPixel|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fTexImage3D(gzUInt _eTarget, gzInt _nLevel, gzInt _nInternalformat, gzInt _nWidth, gzInt _nHeight, gzInt _nDepth, gzInt _nBorder, gzUInt _eFormat, gzUInt _eType, void* _pPixel, const char* _file , gzUInt _line){
	glCall_fTexImage3D(_eTarget, _nLevel, _nInternalformat, _nWidth, _nHeight, _nDepth, _nBorder, _eFormat, _eType, _pPixel);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glTexImage3D( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nLevel|") + gzStrI(_nLevel) + gzU8("|, ") + gzU8("_nInternalformat|") + gzStrI(_nInternalformat) + gzU8("|, ") + gzU8("_nWidth|") + gzStrI(_nWidth) + gzU8("|, ") + gzU8("_nHeight|") + gzStrI(_nHeight) + gzU8("|, ") + gzU8("_nDepth|") + gzStrI(_nDepth) + gzU8("|, ") + gzU8("_nBorder|") + gzStrI(_nBorder) + gzU8("|, ") + gzU8("_eFormat|") + gzStrUI(_eFormat) + gzU8("|, ") + gzU8("_eType|") + gzStrUI(_eType) + gzU8("|, ") + gzU8("_pPixel|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fTexSubImage3D(gzUInt _eTarget, gzInt _nLevel, gzInt _nOffsetX, gzInt _nOffsetY, gzInt _nOffsetZ, gzInt _nWidth, gzInt _nHeight, gzInt _nDepth, gzUInt _eFormat, gzUInt _eType, void* _pPixel, const char* _file , gzUInt _line){
	glCall_fTexSubImage3D(_eTarget, _nLevel, _nOffsetX, _nOffsetY, _nOffsetZ, _nWidth, _nHeight, _nDepth, _eFormat, _eType, _pPixel);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glTexSubImage3D( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nLevel|") + gzStrI(_nLevel) + gzU8("|, ") + gzU8("_nOffsetX|") + gzStrI(_nOffsetX) + gzU8("|, ") + gzU8("_nOffsetY|") + gzStrI(_nOffsetY) + gzU8("|, ") + gzU8("_nOffsetZ|") + gzStrI(_nOffsetZ) + gzU8("|, ") + gzU8("_nWidth|") + gzStrI(_nWidth) + gzU8("|, ") + gzU8("_nHeight|") + gzStrI(_nHeight) + gzU8("|, ") + gzU8("_nDepth|") + gzStrI(_nDepth) + gzU8("|, ") + gzU8("_eFormat|") + gzStrUI(_eFormat) + gzU8("|, ") + gzU8("_eType|") + gzStrUI(_eType) + gzU8("|, ") + gzU8("_pPixel|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBindTexture(gzUInt _eTarget, gzUInt _nTextureId, const char* _file , gzUInt _line){
	glCall_fBindTexture(_eTarget, _nTextureId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindTexture( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nTextureId|") + gzStrI(_nTextureId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fTexParameterf(gzUInt _eTarget, gzUInt _eName, gzFloat32 _nParam, const char* _file , gzUInt _line){
	glCall_fTexParameterf(_eTarget, _eName, _nParam);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glTexParameterf( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_eName|") + gzStrUI(_eName) + gzU8("|, ") + gzU8("_nParam|") + gzStrF(_nParam) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fTexParameteri(gzUInt _eTarget, gzUInt _eName, gzInt _nParam, const char* _file , gzUInt _line){
	glCall_fTexParameteri(_eTarget, _eName, _nParam);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glTexParameteri( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_eName|") + gzStrUI(_eName) + gzU8("|, ") + gzU8("_nParam|") + gzStrI(_nParam) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGenTextures(gzInt _nNb, gzUInt* _aTextures, const char* _file , gzUInt _line){
	glCall_fGenTextures(_nNb, _aTextures);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGenTextures( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aTextures|") + gzStrI(*_aTextures)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fClear(Lib_GZ_OpenGL::OpenGL::eClearBuffer _hMask, const char* _file , gzUInt _line){
	glCall_fClear(_hMask);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glClear( ") + gzU8("_hMask|") + gzStrUI(_hMask) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fClearColor(gzFloat32 _nRed, gzFloat32 _nGreen, gzFloat32 _nBlue, gzFloat32 _nAlpha, const char* _file , gzUInt _line){
	glCall_fClearColor(_nRed, _nGreen, _nBlue, _nAlpha);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glClearColor( ") + gzU8("_nRed|") + gzStrF(_nRed) + gzU8("|, ") + gzU8("_nGreen|") + gzStrF(_nGreen) + gzU8("|, ") + gzU8("_nBlue|") + gzStrF(_nBlue) + gzU8("|, ") + gzU8("_nAlpha|") + gzStrF(_nAlpha) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBufferData(Lib_GZ_OpenGL::OpenGL::eBufferTarget _hTarget, gzIntX _nSize, void* _pData, Lib_GZ_OpenGL::OpenGL::eDrawFlow _hUsage, const char* _file , gzUInt _line){
	glCall_fBufferData(_hTarget, _nSize, _pData, _hUsage);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBufferData( ") + gzU8("_hTarget|") + gzStrUI(_hTarget) + gzU8("|, ") + gzU8("_nSize|") + gzStrI(_nSize) + gzU8("|, ") + gzU8("_pData|") + gzU8("*") + gzU8("|, ") + gzU8("_hUsage|") + gzStrUI(_hUsage) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDrawElements(Lib_GZ_OpenGL::OpenGL::eDrawMode _hMode, gzInt _nCount, Lib_GZ_OpenGL::OpenGL::eVarType _hVarType, void* _pOffset, const char* _file , gzUInt _line){
	glCall_fDrawElements(_hMode, _nCount, _hVarType, _pOffset);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDrawElements( ") + gzU8("_hMode|") + gzStrUI(_hMode) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_hVarType|") + gzStrUI(_hVarType) + gzU8("|, ") + gzU8("_pOffset|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fDrawElementsInstanced(Lib_GZ_OpenGL::OpenGL::eDrawMode _hMode, gzInt _nCount, Lib_GZ_OpenGL::OpenGL::eVarType _hVarType, void* _pIndicesLocation, gzInt _nInstanceCount, const char* _file , gzUInt _line){
	glCall_fDrawElementsInstanced(_hMode, _nCount, _hVarType, _pIndicesLocation, _nInstanceCount);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDrawElementsInstanced( ") + gzU8("_hMode|") + gzStrUI(_hMode) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_hVarType|") + gzStrUI(_hVarType) + gzU8("|, ") + gzU8("_pIndicesLocation|") + gzU8("*") + gzU8("|, ") + gzU8("_nInstanceCount|") + gzStrI(_nInstanceCount) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGenFramebuffers(gzInt _nNb, gzUInt* _aFrameBuffers, const char* _file , gzUInt _line){
	glCall_fGenFramebuffers(_nNb, _aFrameBuffers);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGenFramebuffers( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aFrameBuffers|") + gzStrI(*_aFrameBuffers)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBindFramebuffer(gzUInt _eTarget, gzUInt _nFrameBufferId, const char* _file , gzUInt _line){
	glCall_fBindFramebuffer(_eTarget, _nFrameBufferId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindFramebuffer( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nFrameBufferId|") + gzStrI(_nFrameBufferId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fGenRenderbuffers(gzInt _nNb, gzUInt* _aRenderBuffers, const char* _file , gzUInt _line){
	glCall_fGenRenderbuffers(_nNb, _aRenderBuffers);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGenRenderbuffers( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aRenderBuffers|") + gzStrI(*_aRenderBuffers)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fBindRenderbuffer(gzUInt _eTarget, gzUInt _nRenderBufferId, const char* _file , gzUInt _line){
	glCall_fBindRenderbuffer(_eTarget, _nRenderBufferId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindRenderbuffer( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nRenderBufferId|") + gzStrI(_nRenderBufferId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fRenderbufferStorage(gzUInt _eTarget, gzUInt _eInternalFormat, gzInt _nWidth, gzInt _nHeight, const char* _file , gzUInt _line){
	glCall_fRenderbufferStorage(_eTarget, _eInternalFormat, _nWidth, _nHeight);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glRenderbufferStorage( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_eInternalFormat|") + gzStrUI(_eInternalFormat) + gzU8("|, ") + gzU8("_nWidth|") + gzStrI(_nWidth) + gzU8("|, ") + gzU8("_nHeight|") + gzStrI(_nHeight) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fFramebufferTexture2D(gzUInt _eTarget, gzUInt _eAttachement, gzUInt _eTextureTarget, gzUInt _nTexture, gzInt _nLevel, const char* _file , gzUInt _line){
	glCall_fFramebufferTexture2D(_eTarget, _eAttachement, _eTextureTarget, _nTexture, _nLevel);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glFramebufferTexture2D( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_eAttachement|") + gzStrUI(_eAttachement) + gzU8("|, ") + gzU8("_eTextureTarget|") + gzStrUI(_eTextureTarget) + gzU8("|, ") + gzU8("_nTexture|") + gzStrI(_nTexture) + gzU8("|, ") + gzU8("_nLevel|") + gzStrI(_nLevel) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fFramebufferRenderbuffer(gzUInt _eTarget, gzUInt _eAttachement, gzUInt _eRenderBufferTarget, gzUInt _nRenderBufferId, const char* _file , gzUInt _line){
	glCall_fFramebufferRenderbuffer(_eTarget, _eAttachement, _eRenderBufferTarget, _nRenderBufferId);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glFramebufferRenderbuffer( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_eAttachement|") + gzStrUI(_eAttachement) + gzU8("|, ") + gzU8("_eRenderBufferTarget|") + gzStrUI(_eRenderBufferTarget) + gzU8("|, ") + gzU8("_nRenderBufferId|") + gzStrI(_nRenderBufferId) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzUInt  glDbg_fCheckFramebufferStatus(gzUInt _eTarget, const char* _file , gzUInt _line){
	gzUInt _Ret = glCall_fCheckFramebufferStatus(_eTarget);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glCheckFramebufferStatus( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
void  glDbg_fDeleteBuffers(gzInt _nNb, gzUInt* _aBuffers, const char* _file , gzUInt _line){
	glCall_fDeleteBuffers(_nNb, _aBuffers);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glDeleteBuffers( ") + gzU8("_nNb|") + gzStrI(_nNb) + gzU8("|, ") + gzU8("_aBuffers|") + gzStrI(*_aBuffers)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1f(gzVal _nLocation, gzFloat32 _n0, const char* _file , gzUInt _line){
	glCall_fUniform1f(_nLocation, _n0);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1f( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrF(_n0) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1, const char* _file , gzUInt _line){
	glCall_fUniform2f(_nLocation, _n0, _n1);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2f( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrF(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrF(_n1) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1, gzFloat32 _n2, const char* _file , gzUInt _line){
	glCall_fUniform3f(_nLocation, _n0, _n1, _n2);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3f( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrF(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrF(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrF(_n2) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4f(gzVal _nLocation, gzFloat32 _n0, gzFloat32 _n1, gzFloat32 _n2, gzFloat32 _n3, const char* _file , gzUInt _line){
	glCall_fUniform4f(_nLocation, _n0, _n1, _n2, _n3);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4f( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrF(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrF(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrF(_n2) + gzU8("|, ") + gzU8("_n3|") + gzStrF(_n3) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1i(gzVal _nLocation, gzInt32 _n0, const char* _file , gzUInt _line){
	glCall_fUniform1i(_nLocation, _n0);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1i( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1, const char* _file , gzUInt _line){
	glCall_fUniform2i(_nLocation, _n0, _n1);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2i( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1, gzInt32 _n2, const char* _file , gzUInt _line){
	glCall_fUniform3i(_nLocation, _n0, _n1, _n2);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3i( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrI(_n2) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4i(gzVal _nLocation, gzInt32 _n0, gzInt32 _n1, gzInt32 _n2, gzInt32 _n3, const char* _file , gzUInt _line){
	glCall_fUniform4i(_nLocation, _n0, _n1, _n2, _n3);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4i( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrI(_n2) + gzU8("|, ") + gzU8("_n3|") + gzStrI(_n3) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform1fv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform2fv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform3fv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4fv(gzVal _nLocation, gzInt _nCount, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform4fv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform1iv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1iv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform2iv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2iv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform3iv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3iv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4iv(gzVal _nLocation, gzInt _nCount, gzInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform4iv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4iv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix2fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix2fv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix2fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix3fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix3fv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix3fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix4fv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix4fv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix4fv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1d(gzVal _nLocation, gzFloat64 _nX, const char* _file , gzUInt _line){
	glCall_fUniform1d(_nLocation, _nX);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1d( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nX|") + gzStrF(_nX) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY, const char* _file , gzUInt _line){
	glCall_fUniform2d(_nLocation, _nX, _nY);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2d( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nX|") + gzStrF(_nX) + gzU8("|, ") + gzU8("_nY|") + gzStrF(_nY) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY, gzFloat64 _nZ, const char* _file , gzUInt _line){
	glCall_fUniform3d(_nLocation, _nX, _nY, _nZ);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3d( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nX|") + gzStrF(_nX) + gzU8("|, ") + gzU8("_nY|") + gzStrF(_nY) + gzU8("|, ") + gzU8("_nZ|") + gzStrF(_nZ) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4d(gzVal _nLocation, gzFloat64 _nX, gzFloat64 _nY, gzFloat64 _nZ, gzFloat64 _nW, const char* _file , gzUInt _line){
	glCall_fUniform4d(_nLocation, _nX, _nY, _nZ, _nW);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4d( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nX|") + gzStrF(_nX) + gzU8("|, ") + gzU8("_nY|") + gzStrF(_nY) + gzU8("|, ") + gzU8("_nZ|") + gzStrF(_nZ) + gzU8("|, ") + gzU8("_nW|") + gzStrF(_nW) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform1dv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform2dv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform3dv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4dv(gzVal _nLocation, gzInt _nCount, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform4dv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix2dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix2dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix3dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix3dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix4dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix4dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix2x3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix2x3dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix2x3dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix2x4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix2x4dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix2x4dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix3x2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix3x2dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix3x2dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix3x4dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix3x4dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix3x4dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix4x2dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix4x2dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix4x2dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformMatrix4x3dv(gzVal _nLocation, gzInt _nCount, gzBool _bTranspose, gzFloat64* _aValue, const char* _file , gzUInt _line){
	glCall_fUniformMatrix4x3dv(_nLocation, _nCount, _bTranspose, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformMatrix4x3dv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_bTranspose|") + gzStrB(_bTranspose) + gzU8("|, ") + gzU8("_aValue|") + gzStrF(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1ui(gzVal _nLocation, gzUInt32 _n0, const char* _file , gzUInt _line){
	glCall_fUniform1ui(_nLocation, _n0);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1ui( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1, const char* _file , gzUInt _line){
	glCall_fUniform2ui(_nLocation, _n0, _n1);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2ui( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1, gzUInt32 _n2, const char* _file , gzUInt _line){
	glCall_fUniform3ui(_nLocation, _n0, _n1, _n2);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3ui( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrI(_n2) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4ui(gzVal _nLocation, gzUInt32 _n0, gzUInt32 _n1, gzUInt32 _n2, gzUInt32 _n3, const char* _file , gzUInt _line){
	glCall_fUniform4ui(_nLocation, _n0, _n1, _n2, _n3);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4ui( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_n0|") + gzStrI(_n0) + gzU8("|, ") + gzU8("_n1|") + gzStrI(_n1) + gzU8("|, ") + gzU8("_n2|") + gzStrI(_n2) + gzU8("|, ") + gzU8("_n3|") + gzStrI(_n3) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform1uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform1uiv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform1uiv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform2uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform2uiv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform2uiv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform3uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform3uiv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform3uiv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniform4uiv(gzVal _nLocation, gzInt _nCount, gzUInt32* _aValue, const char* _file , gzUInt _line){
	glCall_fUniform4uiv(_nLocation, _nCount, _aValue);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniform4uiv( ") + gzU8("_nLocation|") + gzStrI(_nLocation) + gzU8("|, ") + gzU8("_nCount|") + gzStrI(_nCount) + gzU8("|, ") + gzU8("_aValue|") + gzStrI(*_aValue)+ gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
gzUInt  glDbg_fGetUniformBlockIndex(gzUInt _nPorgramId, gzUInt8* _cUboName, const char* _file , gzUInt _line){
	gzUInt _Ret = glCall_fGetUniformBlockIndex(_nPorgramId, _cUboName);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glGetUniformBlockIndex( ") + gzU8("_nPorgramId|") + gzStrI(_nPorgramId) + gzU8("|, ") + gzU8("_cUboName|") + gzU8("*") + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
	return _Ret;
}
void  glDbg_fBindBufferBase(gzUInt _eTarget, gzUInt _nIndex, gzUInt _nBuffer, const char* _file , gzUInt _line){
	glCall_fBindBufferBase(_eTarget, _nIndex, _nBuffer);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glBindBufferBase( ") + gzU8("_eTarget|") + gzStrUI(_eTarget) + gzU8("|, ") + gzU8("_nIndex|") + gzStrI(_nIndex) + gzU8("|, ") + gzU8("_nBuffer|") + gzStrI(_nBuffer) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}
void  glDbg_fUniformBlockBinding(gzUInt _nPorgramId, gzUInt _nUniformBlickId, gzUInt _nBindPoint, const char* _file , gzUInt _line){
	glCall_fUniformBlockBinding(_nPorgramId, _nUniformBlickId, _nBindPoint);
	gzInt nErr = GL_fGetError();
	if(nErr){
	GZ_Debug_fError(_SysGpuInfo::fGetErrorString(nErr) + gzU8(": glUniformBlockBinding( ") + gzU8("_nPorgramId|") + gzStrI(_nPorgramId) + gzU8("|, ") + gzU8("_nUniformBlickId|") + gzStrI(_nUniformBlickId) + gzU8("|, ") + gzU8("_nBindPoint|") + gzStrI(_nBindPoint) + gzU8("| ") + gzU8(") ") + gzU8(" File: ") + fGetFile(_file) + gzU8(" Line: ") + gzStrUI(_line) );
	}
}

#else
gzBool Lib_GZ_OpenGL::SysGpuFunc::fGetGpuFunctions(){return false;}
#endif