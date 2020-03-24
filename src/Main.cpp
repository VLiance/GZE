//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.






#ifndef GZ_tLib_GZ
	#error Please Include <GZE.h> before <Main>
#endif

#ifdef GZ_tMainInclued
	#error Please include <Main> only once, in your "main" .cpp
#endif
#define GZ_tMainInclued


#include "Lib_GZ/Base/Thread/Thread.h" //Temp

	
//////// Include base of GZE //////////
#ifndef tLib_GZ
//#include "MinGZE.gcpp"
#endif
#ifndef tLib_NoGPU
//#include "GPU.gcpp"
#endif
//////////////////////////////////

#ifdef D_GZE_CPP_ONLY //GEN With c~
	#include "Lib_GZ/Lib_GZ.cpp"
#endif




gzInt nMainIsAlive = 1;
gzInt nMainUpdateMs = 16; // (60 fps if available)
gzInt Main(gzText8 _sArg, gzUIntX _nId = 0, gzInt _nCmd = 0);
gzInt Update(gzFloat _nDelta = 0);
gzInt Close(gzInt _nExitCode);

#define endl_cr "\r"


#ifdef GZ_tJit

	extern "C" int Jit_Main(void* _dTest) {
		nMainIsAlive = Main("");
		return nMainIsAlive;
	}

	extern "C" int Jit_Update() {
		if( nMainIsAlive){
			nMainIsAlive = Update(0);
		}
		return nMainIsAlive;
	}

	
//#elif defined D_Platform_Windows
#elif defined D_Platform_Windows

	extern "C" Lib_GZ::uLib* IniLib_Lib_GzWindows(); //Overplace must be present
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzOpenGL(); //Overplace must be present
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzOpenGL_Windows(); //Overplace must be present
		
	#define UNICODE
	#define _UNICODE

	#include <io.h>
	#include <fcntl.h>

	#include <Windows.h>
	#include <locale.h> //Console

LRESULT CALLBACK MainHwndProcedure(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam){
 //GZ_printf("\nmsg: 0x%03x\n",message );
  switch (message) {
    case WM_CLOSE:
            DestroyWindow(hwnd);
        break;
        case WM_DESTROY:
            PostQuitMessage(0);
			nMainIsAlive = 0;
        break;

		case WM_QUIT:
		case WM_QUERYENDSESSION:
			nMainIsAlive = 0;
            break;

        default:
            return DefWindowProc(hwnd, message, wParam, lParam);
    }
    return 0;
}


#ifdef D_Platform_CpcDos
//////////////////////////////////////////////////////////
#include "CpcDos/CPC_WPR.cpp"
extern bool bOnCpcDos;
#endif

	#ifdef D_Platform_CpcDos_REMOVED
//////////////////////////////////////////////////////////
//#include "CpcDos/CPC_WPR.cpp"
//extern bool bOnCpcDos;
/*
//extern "C" int cpc_main( int argc, const char* argv[] ){GZ_printf("\n\nYeeeee CPC\n\n");}
extern "C" int cpc_main( int argc, const char* argv[] ){

	puts("\n\nCPC MAIN Yeeeee CPC\n\n");
	puts("\n\nTry GZ_printf\n\n");
	 fprintf(stdout," TEST  fprintf");
	 	puts("\n\TEST---\n\n");
	GZ_printf(" TEST  ");
	puts("\n\nEnd\n\n");
 return 0;}
*/
/*
int fBreakMe(){
	puts("\nBreakMe");
	return 1;
}
int breakme = fBreakMe();
*/


extern "C" int main( int argc, const char* argv[] ){

HINSTANCE hThisInstance = GetModuleHandle(NULL);
int nCmdShow = 10;//SW_SHOWDEFAULT
//////////////////////////////////////////////////////////
bOnCpcDos = fIniCpcDosFunctions();


	#else
//////////////////////////////////////////////////////////
int WINAPI WinMain (HINSTANCE hThisInstance,  HINSTANCE hPrevInstance,  LPSTR lpszArgument, int nCmdShow){
SetConsoleOutputCP(CP_UTF8);
//////////////////////////////////////////////////////////
	#endif
	
	setbuf(stdout, NULL);
	
	#ifdef D_Debug
	GZ_nArrayTotalAlloc = 0;
	#endif
	
	HWND MainEventHwnd = {0}; //Create a Dummy Windows to handle main events
	MSG messages = {0};
	static const TCHAR* class_name = TEXT("LibRT_Class");
	WNDCLASSEX wx = {0};
	//WNDCLASSEXA wx = {0};
	wx.cbSize = sizeof(WNDCLASSEX);
//	wx.cbSize = sizeof(WNDCLASSEXA);
	wx.lpfnWndProc = MainHwndProcedure;        // function which will handle messages
	wx.hInstance = hThisInstance;
	wx.lpszClassName = class_name;
	if ( RegisterClassEx(&wx) ) {
	  MainEventHwnd = CreateWindowEx( WS_EX_TOOLWINDOW, class_name,  TEXT("MainHwnd"), 0, 0, 0, 0, 0, HWND_DESKTOP, NULL, hThisInstance, NULL );
	}
	ShowWindow(MainEventHwnd, SW_SHOWNOACTIVATE); //Necessary to handle windows events
	
	Lib_GZ::Lib::fLoadAllLib();
	
	#ifndef D_GZE_CPP_ONLY
	Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzWindows()); //OverPlace
	Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL()); //OverPlace
	Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL_Windows()); //OverPlace
	
	
	//Lib_GZ::Lib::fIniClassLib(IniLib_Lib_GzWindows()); //Todo generic, not only windows..
	Lib_GZ::Base::Thread::Thread::bAppIsAlive = true;
	#endif
	

	
	nMainIsAlive = Main("", (gzUIntX)hThisInstance, (gzInt)nCmdShow );

	
	
	while(nMainIsAlive){
		fflush(stdout);
		Sleep(nMainUpdateMs);
		nMainIsAlive = Update(0);
		
		#ifdef D_GZE_CPP_ONLY
		//Minimal msg handle
		while(PeekMessage(&messages, NULL, 0, 0, PM_REMOVE)) {
			TranslateMessage(&messages);
			DispatchMessage(&messages);

			if(messages.message == WM_QUIT){
				 nMainIsAlive = 0;
			}
		}
		#endif
		
	}
	
	
	
	
	
	int _nClose = Close(messages.wParam);
	fflush(stdout);
	return _nClose;
    //return messages.wParam;   //The program return-value is 0 - The value that PostQuitMessage() gave
}

extern "C" Lib_GZ::uLib* IniLib_Lib_GzCpcDos(); //Overplace must be present


#ifdef D_Platform_CpcDos
	

int _nTest = 7;
extern bool bOnCpcDos;
extern int nCpcVerMajor;
extern int nCpcVerMinor;
//extern "C" int cpc_main( int argc, const char* argv[] ){
extern "C" int main_entry( int argc, const char* argv[] ){

	puts("\n--CpcDos Main--\n"); 
		
	bOnCpcDos = fIniCpcDosFunctions();
		
	_nTest++;
	GZ_printf("\n_nTest: %d \n", _nTest); 
	
	//bOnCpcDos = true;//Temp
	
	Lib_GZ::Base::Thread::Thread::bAppIsAlive = true;
	Lib_GZ::Lib::fLoadAllLib();
	if(bOnCpcDos){
		GZ_printf("\n--On CpcDos--");
		setbuf(stdout, NULL);//Not sure
		GZ_printf("\n\nCpcDos ver%d.%d \n\n", nCpcVerMajor, nCpcVerMinor);
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzCpcDos()); //OverPlace
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL()); //OverPlace
		GZ_printf("\nIni OGL");
	}else{
		GZ_printf("\n\n --On Windows-- \n\n ");
		setbuf(stdout, NULL);
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzWindows()); //OverPlace
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL()); //OverPlace
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL_Windows()); //OverPlace
	}
	
	nMainIsAlive = Main("");
	while(nMainIsAlive){
		nMainIsAlive = Update();
	}
	GZ_printf("\n--End - ");
	return nMainIsAlive;
}

extern "C" int main( int argc, const char* argv[] ){
	main_entry(argc, argv);
}


#else
 /*Important for avoiding Name decoration*/

	GzExport  int gze_entry(char* _sArg){
		printf("\n main_entry found !! \n ");
		WinMain(0,0,0,0);
		return 0;
	}
	GzExport void test(  ){
		printf("\n test found !! \n ");
	}

 
#endif


#elif defined D_Platform_Web_Emsc ////////////////////// Web //////////////////////////////////////

	#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"


//	#include <emscripten/emscripten.h>
	//#include <emscripten/bind.h>

	#undef endl_cr
	#define endl_cr "\n"

	void Emsc_Update(){
		if(nMainIsAlive){

			val FPSMeter = val::global("meter");
			if(!FPSMeter.isUndefined()){
				 FPSMeter.call<void>("tickStart");
			}

			nMainIsAlive = Update(0);

			if(!FPSMeter.isUndefined()){
				FPSMeter.call<void>("tick");
			}
			fflush(stdout);

		}
	}
	
	//Overplace list
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzWeb_Emsc(); //Overplace must be present
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzOpenGL(); //Overplace must be present
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzOpenGL_Web_Emsc(); //Overplace must be present
	
	gzInt main(){
		//GZ_nArrayTotalAlloc = 0;
		
		Lib_GZ::Lib::fLoadAllLib();
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzWeb_Emsc()); //OverPlace
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL()); //OverPlace
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzOpenGL_Web_Emsc()); //OverPlace
		
		
		nMainIsAlive = Main("");
		if(nMainIsAlive){
			emscripten_set_main_loop(Emsc_Update, 0, 1);
		}
		return nMainIsAlive;
	}


/*
#elif defined GZ_tCpcDos

	#include "Cpcdos/CPC_WPR.cpp"

	extern "C" int cpc__gze_main() {
		Lib_GZ::Lib::fLoadAllLib();
		Main();
		while( nMainIsAlive){
			nMainIsAlive = Update(0);
		}
		return nMainIsAlive;
	}
*/

#elif defined D_Platform_Android ////////////////////// Web //////////////////////////////////////
	
	
	extern "C" Lib_GZ::uLib* IniLib_Lib_GzAndroid(); //Overplace must be present
	int main() {
		Lib_GZ::Lib::fLoadAllLib();
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzAndroid()); //OverPlace
		nMainIsAlive = Main("");
		while(nMainIsAlive){
			Update(0);
		}
		return nMainIsAlive;
	}



#else ////// Others //////

	int main() {
		Lib_GZ::Lib::fLoadAllLib();
		Lib_GZ::Lib::fLoadLib(IniLib_Lib_GzWindows()); //OverPlace
		nMainIsAlive = Main("");
		while(nMainIsAlive){
			Update(0);
		}
		return nMainIsAlive;
	}

#endif

#ifndef D_Platform_Web_Emsc
////#include<conio.h> //getch
#endif
/*
struct End { //Place before any global strurt to be sure it was called after everything, note this may not be called at the every end, this can be a false negative
  ~End(){
	  	GZ_printf("\nTotal: Alloc / Free   ---  %d / %d ", GZ_nArrayTotalAlloc, GZ_nArrayTotalFree);
		if(GZ_nArrayTotalAlloc == GZ_nArrayTotalFree){
			GZ_printf("\nP: *-- No memory leak --* \n");
		}else{
			GZ_printf("\n\nE:---!!! MEMORY BROKEN !!!---\n\n");
		}
	  GZ_printf("\n--- End! ---");
	  
	 // #ifndef  D_Platform_Web_Emsc
	 //// getch();
	  //#endif
	  
  }
};End oEnd;
*/
