//This file is a part of GZE: https://github.com/VLiance/GZE

#include "RendererES2.h"
#include <GLES3/gl3.h>

RendererES2::RendererES2(){
	m_EglContext = 0;
}

RendererES2::ContextState RendererES2::OnContextCreated(){

	RendererES2::ContextState eState = Initialised;

	EGLContext eglContext = eglGetCurrentContext();
//	if ( m_EglContext != 0 && m_EglContext != eglContext )
	if ( m_EglContext != 0){
		//We need to recreate your resources (buffers, shader programs, etc...)
		eState = RendererES2::Restored;
	}else{
		eState = RendererES2::Initialised;
	}

	m_EglContext = eglContext;
	return eState;
}

void RendererES2::SetViewport(int _nWidth, int _nHeight){

	glViewport( 0, 0, _nWidth, _nHeight );
}

void RendererES2::ClearScreen(float _nRed, float _nGreen, float _nBlue, float _nAlpha, bool _bClearDepth){
	glClearColor(_nRed, _nGreen, _nBlue, _nAlpha );
	if(_bClearDepth){
		glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
	}else{
		glClear( GL_COLOR_BUFFER_BIT );
	}
}

RendererES2::~RendererES2(){
}
