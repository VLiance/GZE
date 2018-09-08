package  { 
	

	import GZ.Sys.Debug;

	public extension OpDebug overplace Debug  {
		
	<cpp_h>
		#include "Lib_GZ_Platform/Windows/MainHeader.h"
		#include <locale.h> //Console
	</cpp_h>

			/*
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
				if(bPipe){
					gzUTF16 _sPrint16(_sValue);
					wprintf(L"%s\n", (const wchar_t*)_sPrint16.get());
				}else{
					DWORD slen = _sValue.GnSize();
					WriteConsoleA(GetStdHandle(STD_OUTPUT_HANDLE),_sValue.sStr->array + 1,slen,&slen,NULL);
					wprintf(L"\n");
				}
			}
			
			
			 void fPrint(char* _sPrefix , gzUInt _nPredixFlag, gzPStr _sMsg, gzUInt _nMsgFlag ){
				Color(_nPredixFlag );
				if(bPrefix){
					 wprintf(L"%s ", _sPrefix);
				}
				Color(_nMsgFlag);
				fMsgPrint(_sMsg);
			    Color(FOREGROUND_WHITE);
			}

		</cpp_namespace>
		
		*/
		
		public function OpDebug():Void{
			/*
			Debug();
			
			var _nWidth : UInt = 1000;
			var _nHeight : UInt = 600;
			
			var _nPosX : UInt = 0;
			var _nPosY : UInt = 0;
			
			<cpp>
				#ifdef GZ_tDebug
				
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
				   // wprintf(L"ÉTAGE île noël âtre forêt repère être ça\n");
					_::Color(FOREGROUND_WHITE);
					
				#endif
				
			</cpp>
`			*/
			
		}
		
		
		static function fTrace1(_sValue:String):Void {
			<cpp>
	//			_::fPrint((char*)L"1:", FOREGROUND_GREEN, _sValue, FOREGROUND_GREEN |FOREGROUND_INTENSITY);
			 //   printf("1:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}	
			
		static function fTrace2(_sValue:String):Void{
			<cpp>
	//			_::fPrint((char*)L"2:", FOREGROUND_BLUE | FOREGROUND_RED, _sValue, FOREGROUND_BLUE | FOREGROUND_RED|FOREGROUND_INTENSITY);
			  //  printf("2:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}
		
		static function fTrace3(_sValue:String):Void{
			<cpp>
	//			_::fPrint((char*)L"3:", FOREGROUND_GREEN | FOREGROUND_RED, _sValue, FOREGROUND_GREEN | FOREGROUND_RED| FOREGROUND_INTENSITY);
			   // printf("3:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}

		static function fWarning(_sValue:String):Void{
			<cpp>
	//			_::fPrint((char*)L"W:", _::FgColor::YELLOW, _sValue, _::FgColor::YELLOW | FOREGROUND_INTENSITY);
			//    printf("W:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}
		static function fError(_sValue:String):Void{
			<cpp>
			//    printf("E:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}
		static function fPass(_sValue:String):Void{
			<cpp>
			//    printf("P:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}
		static function fFatal(_sValue:String):Void{
			<cpp>
			//    printf("F:%s\n", (char*)_sValue.fcStr());
			</cpp>
		}
}