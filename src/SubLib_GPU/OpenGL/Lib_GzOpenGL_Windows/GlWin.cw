//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


package  { 

	import GZ.Gpu.GpuInfo;
	import GzOpenGL.OpenGL;
	
	<cpp_h>
	
		#include "Lib_GzWindows/MainHeader.h"
	
		#define GZ_Debug_fError Lib_GZ::Debug::pDebug::fConsole
		//#define GZ_Debug_fError Lib_GZ::Debug::Debug::GetInst(thread)->fError

	
		typedef BOOL (WINAPI * PFNWGLCHOOSEPIXELFORMATARBPROC) (HDC hdc, const int *piAttribIList, const gzFloat32 *pfAttribFList, gzUInt32 nMaxFormats, int *piFormats, gzUInt32 *nNumFormats);
		typedef HGLRC (WINAPI * PFNWGLCREATECONTEXTATTRIBSARBPROC) (HDC hDC, HGLRC hShareContext, const int *attribList);

		typedef const char* (WINAPI* PFNWGLGETEXTENSIONSSTRINGARBPROC)(HDC hdc);

		

		
		
	</cpp_h>
	
	
	<cpp>
namespace Lib_GzOpenGL{namespace OpenGL{
		gzStr fGetLastErrorString(gzUInt _nError){
		  if (_nError)
		  {
			LPVOID lpMsgBuf;
			DWORD bufLen = FormatMessageW(
				FORMAT_MESSAGE_ALLOCATE_BUFFER |
				FORMAT_MESSAGE_FROM_SYSTEM |
				FORMAT_MESSAGE_IGNORE_INSERTS,
				NULL,
				_nError,
				MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
				(LPTSTR) &lpMsgBuf,
				0, NULL );
			if (bufLen)
			{
			  LPCSTR lpMsgStr = (LPCSTR)lpMsgBuf;
			  //std::string result(lpMsgStr, lpMsgStr+bufLen);
			 //   gzStr _sError = gzStr(lpMsgStr,(gzUInt)(bufLen) - 1);
				gzStr _sError = gzStr16( gzStrC((gzUInt16*) lpMsgStr)).fToUTF8();

			//_sError.fEnd().fPrev(); //Remove last char
			//_sError = _sError.fRevSubStr(gzStrToEnd);
			  LocalFree(lpMsgBuf);

			  return _sError;
			}
		  }
		  return gzU8("Unknow");
		}
		void fResetLastError(){
			gzUInt _nErr = GetLastError();
			if(_nErr){
				GZ_Debug_fError(gzU8("Previous Win GetLastError detected (") +  gzStrUI(_nErr)  + gzU8("): ") +  Lib_GzOpenGL::OpenGL::fGetLastErrorString(_nErr) );
			}
			SetLastError(0);
		}
}}
		
	</cpp>
	
	
	
	public class GlWin  {

	
/*
		public pure function fGetLastErrorString( _nError : UInt):String{
			<cpp>
			  if (_nError)
			  {
				LPVOID lpMsgBuf;
				DWORD bufLen = FormatMessageW(
					FORMAT_MESSAGE_ALLOCATE_BUFFER |
					FORMAT_MESSAGE_FROM_SYSTEM |
					FORMAT_MESSAGE_IGNORE_INSERTS,
					NULL,
					_nError,
					MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
					(LPTSTR) &lpMsgBuf,
					0, NULL );
				if (bufLen)
				{
				  LPCSTR lpMsgStr = (LPCSTR)lpMsgBuf;
				  //std::string result(lpMsgStr, lpMsgStr+bufLen);
				 //   gzStr _sError = gzStr(lpMsgStr,(gzUInt)(bufLen) - 1);
					gzStr _sError = gzStr((gzUInt16*) lpMsgStr);
//TODO
		//		_sError.fEnd().fPrev(); //Remove last char
		//		_sError = _sError.fRevSubStr(gzStrToEnd);
//TODO
		
				  LocalFree(lpMsgBuf);

				  return _sError;
				}
			  }
			  return gzStrL("Unknow");
			  </cpp>
		}
		*/
		/*
		public pure function fResetLastError():Void{
			<cpp>
				gzUInt _nErr = GetLastError();
				if(_nErr){
					GZ_Debug_fError(gzU8("Previous Win GetLastError detected (") +  gzStrUI(_nErr)  + gzU8("): ") +  System::fGetLastErrorString(_nErr) );
				}
				SetLastError(0);
			</cpp>
		}
		*/
	
	
		
		

}

