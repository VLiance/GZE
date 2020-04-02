//This file is a part of GZE: https://github.com/VLiance/GZE

#ifndef RENDERERES2_H_
#define RENDERERES2_H_

#include <EGL/egl.h>

class RendererES2{
	public:
		enum ContextState{
			Initialised = 0,
			Invalid,
			Restored,
			RenderStateCount
		};

		RendererES2();

		ContextState OnContextCreated();
		void SetViewport(int _nWidth, int _nHeight);

		void ClearScreen(float _nRed, float _nGreen, float _nBlue, float _nAlpha = 0.0, bool _bClearDepth = true);
		~RendererES2();

	private:
		EGLContext m_EglContext;
};

#endif
