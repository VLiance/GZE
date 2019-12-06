package  { 
	

	import GZ.Debug.Debug;

	public class OpDebug overplace Debug  {
		
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
		#include <locale.h> //Console
	</cpp_h>

			
		<cpp_namespace>
		
		
			namespace FgColor{
			  enum {
				BLACK             = 0,
				DARKBLUE          = FOREGROUND_BLUE,
				DARKGREEN         = FOREGROUND_GREEN,
				DARKCYAN          = FOREGROUND_GREEN | FOREGROUND_BLUE,
				DARKRED           = FOREGROUND_RED,
				DARKMAGENTA       = FOREGROUND_RED | FOREGROUND_BLUE,
				DARKYELLOW        = FOREGROUND_RED | FOREGROUND_GREEN,
				DARKGRAY          = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,
				GRAY              = FOREGROUND_INTENSITY,
				BLUE              = FOREGROUND_INTENSITY | FOREGROUND_BLUE,
				GREEN             = FOREGROUND_INTENSITY | FOREGROUND_GREEN,
				CYAN              = FOREGROUND_INTENSITY | FOREGROUND_GREEN | FOREGROUND_BLUE,
				RED               = FOREGROUND_INTENSITY | FOREGROUND_RED,
				MAGENTA           = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_BLUE,
				YELLOW            = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN,
				WHITE             = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,
			  };
			}
			
		  #ifndef GZ_D_Monothread
			CRITICAL_SECTION m_cs;
		  #endif
		  bool bIni = false;
		  bool bPrefix = true;
		  bool bPipe = false;
		  void  fPrint(gzPStr _sValue);
		
			#define FOREGROUND_WHITE (FOREGROUND_BLUE| FOREGROUND_RED | FOREGROUND_GREEN)
			 void Color(gzUInt flags)
			{
				HANDLE H=GetStdHandle(STD_OUTPUT_HANDLE);
				SetConsoleTextAttribute(H,(WORD)flags);
			}
			
			 void  fMsgPrint(gzPStr _sValue){
			 
			 
			 
			 	_sValue.fPrint();
				
				
				
			 /*
				if(bPipe){
					gzUTF16 _sPrint16(_sValue);
					wprintf(L"%s\n", (const wchar_t*)_sPrint16.get());
				}else{
					DWORD slen = _sValue.GnSize();
					WriteConsoleA(GetStdHandle(STD_OUTPUT_HANDLE),_sValue.sStr->array + 1,slen,&slen,NULL);
					wprintf(L"\n");
				//}*/
			}
			
			
			 void fPrint(gzInt _nThreadId, char* _sPrefix , gzUInt _nPredixFlag, gzPStr _sMsg, gzUInt _nMsgFlag ){
					//	fWrite(gzU8("[") + gzStrUI(thread->nId) + gzU8("]"));
					
				// Lock the Critical section
				#ifndef GZ_D_Monothread
					EnterCriticalSection(&m_cs); 
				#endif
					
				Color(_nPredixFlag );
				if(bPrefix){
					 wprintf(L"\n%s[%d]:", _sPrefix, _nThreadId);
				}
				Color(_nMsgFlag);
				fMsgPrint(_sMsg);
			    Color(FOREGROUND_WHITE);
					////
					
				//Release the Critical section
				#ifndef GZ_D_Monothread	
					LeaveCriticalSection(&m_cs);	
				#endif
			}

		</cpp_namespace>
		

		
		public function OpDebug():Void{
			
			Debug();
			
			
			var _nWidth : UInt = 1000;
			var _nHeight : UInt = 600;
			
			var _nPosX : UInt = 0;
			var _nPosY : UInt = 0;
			
			<cpp>
				 #ifndef GZ_D_Monothread
				InitializeCriticalSection(&_::m_cs); 
				#endif
				
				#ifdef D_Debug
				
					COORD coord;
					coord.X=_nWidth/8 * 1.5;
					coord.Y=_nHeight/12 * 50;
					SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE),coord);

					HWND hConsole = GetConsoleWindow();
					MoveWindow(hConsole, _nPosX, _nPosY, _nWidth, _nHeight + 300, true);


					SMALL_RECT windowSize = {0, 0, (gzInt16)(_nWidth-1), (gzInt16)(_nHeight-1)};
					SetConsoleWindowInfo(hConsole, true, &windowSize);
					//ShowWindow( hConsole, SW_MAXIMIZE );
				   // setlocale(LC_CTYPE, ".1252");
					setlocale(LC_ALL, ".65001");
					SetConsoleOutputCP(CP_UTF8);
					//Color(FOREGROUND_RED|FOREGROUND_INTENSITY);
					_::Color(FOREGROUND_WHITE);
					
				#endif
				
			</cpp>
`			
			
		}
			
		public  function fWrite(_sValue:String):Void {
			<cpp>
				#ifndef GZ_D_Monothread
					EnterCriticalSection(&m_cs); 
				#endif
				_::fMsgPrint(_sValue);
				#ifndef GZ_D_Monothread	
					LeaveCriticalSection(&m_cs);	
				#endif
			</cpp>
		}
		
		
		public override  function fTrace(_sValue:String):Void {
			<cpp>
				_::fPrint(thread->nId, (char*)L"T:", FOREGROUND_GREEN, _sValue, FOREGROUND_GREEN |FOREGROUND_INTENSITY);
			   // printf("1:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}	
		

		public override  function fInfo(_sValue:String):Void {
			<cpp>
				_::fPrint(thread->nId, (char*)L"I:", _::FgColor::MAGENTA, _sValue, _::FgColor::MAGENTA | FOREGROUND_INTENSITY);
			</cpp>
		}	
		
		public override  function fWarning(_sValue:String):Void{
			<cpp>
				_::fPrint(thread->nId, (char*)L"W:", _::FgColor::YELLOW, _sValue, _::FgColor::YELLOW | FOREGROUND_INTENSITY);
			</cpp>
		}
		public override  function fError(_sValue:String):Void{
			<cpp>
			   _::fPrint(thread->nId, (char*)L"E:", _::FgColor::RED, _sValue, _::FgColor::RED | FOREGROUND_INTENSITY);
			</cpp>
		}
		public	override  function fPass(_sValue:String):Void{
			<cpp>
				_::fPrint(thread->nId, (char*)L"P:", FOREGROUND_GREEN, _sValue, FOREGROUND_GREEN |FOREGROUND_INTENSITY);
			</cpp>
		}
		public override  function fFatal(_sValue:String):Void{
			<cpp>
				_::fPrint(thread->nId, (char*)L"F:", _::FgColor::RED, _sValue, _::FgColor::RED | FOREGROUND_INTENSITY);
			</cpp>
		}
		
		destructor  {
			<cpp>
				#ifndef GZ_D_Monothread
				DeleteCriticalSection(&_::m_cs);
				#endif
			</cpp>
		}
		
		
}