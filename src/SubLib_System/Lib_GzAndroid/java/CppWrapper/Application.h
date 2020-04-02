//This file is a part of GZE: https://github.com/VLiance/GZE

#ifndef APPLICATION_H_
#define APPLICATION_H_

#include "RendererES2.h"
//#include "Demo/Demo.h"

class Application
{

public:
	Application( int _nWidth, int _nHeight);
	static Application& Get();

	void Step();

	void OnPause();
	void OnResume();
	void OnUpdate( const float fDeltaSeconds );
	void OnDraw();
	void OnContextCreated();
	void OnWindowResize( int _nWidth, int _nHeight );
	void OnTouch( int _nPointerID, float _nPosX, float _nPosY, int _nAction );
	
//	Demo_Demo* oExample;
	virtual ~Application();
	
private:
	static Application* s_pApplication;
	RendererES2* 	m_pRenderer;

	bool 			m_bPaused;
	uint64_t 		m_Time;
};

#endif
