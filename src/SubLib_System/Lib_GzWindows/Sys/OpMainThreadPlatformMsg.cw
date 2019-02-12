package  { 

	import GZ.Gpu.Gpu;
	import GZ.Gfx.Interface;
	import GZ.Input.Key;
	import GZ.Sys.MainThreadPlatformMsg;
	import GZ.Sys.Context;
	import GZ.Sys.Window;
	import GZ.Sys.System;
	import GZ.Base.Rect;
	//import GzWindows.Sys.Message.OpContextLink;
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	<cpp>
		HDC hmemdc;
		gzInt* aPixels;
		gzInt** p2DArray;
		HDC dcScreen;
		SIZE frameSize;
		HWND hWnd;
		HBITMAP hbmp;
	</cpp>
	
	/*
	<cpp>«
		#include "Lib_GZ/Lib.h"
		extern gzUIntX nTestProgInstance;
	</cpp>	
		*/

	
	<cpp_namespace_h>
	LRESULT CALLBACK AppWndProc(HWND _hWnd, gzUInt uMsg, WPARAM wParam, LPARAM lParam);
	</cpp_namespace_h>
	



	public class OpMainThreadPlatformMsg overplace MainThreadPlatformMsg {
	
			use Window.ePositioning;
		
			public	var nHandleId : UIntX = 0;
			public	var nFrameWidth : UInt = 800;
			public	var nFrameHeight : UInt = 600;
			public	var nWinHandleId : UIntX = 0;
	

	
		
		public function OpMainThreadPlatformMsg() : Void{
			Debug.fTrace("--OpMainThreadPlatformMsg--");
			
			MainThreadPlatformMsg();
		}
	
		 
		 override public function fManageMessage():Void {
		 
			
			gMainThreadGate.ExecuteAll();
			
			/*
			
		 	var  _oMsg  : ThreadMsg = gMainThreadGate.Receive();
			if(_oMsg){
				Debug.fTrace("---fReceived message!!!!!-- : " );
				_oMsg.fRun();
				Debug.fTrace("---Finish!!!!!-- : " );
			}
			*/
		 
		 
	//	 	Debug.fTrace("---OP mange MSG--");
			<cpp>
				static MSG msg;
				while (PeekMessage(&msg, GZ_Null, 0, 0, PM_REMOVE) > 0){
					if (msg.message == WM_QUIT){
					  break;
					 }
					TranslateMessage(&msg);
					DispatchMessage(&msg);
				}
			</cpp>
		 }
		 
		 
		override public function fRegisterContext(_gFrom : Gate<Context>, _vFrame : Rect<Int>, hPos : ePositioning):Void{
		//override function fCreateForm(  _nPosX : Int,  _nPosY : Int,  _nWinWidth : UInt, _nWinHeight : UInt,  _nStart : eWinState = eWinState.Normal,   _bGpuDraw : Bool = true, _bResizable : Bool = false, _bDragAndDrop: Bool = false, _bVisible : Bool = true):Void{
			Debug.fError("fCreateForm! from thread!!!");
		//	Debug.fTrace("---fCreateForm!!!!!-- : "  +_nPosX + ":"  +_nPosY );
	
			Debug.fTrace("RECTxxxx "  + _vFrame.nX);
			Debug.fTrace("RECTyyyy"  + _vFrame.nY);
			Debug.fTrace("RECTywww"  + _vFrame.nWidth);
			Debug.fTrace("RECTyhhh"  + _vFrame.nHeight);
			
		//	var hBorder : Window.eWinBorder;
			var _hBorder : Window.eWinBorder = Window.eWinBorder.Normal;

			var _bBorder : Bool = true;
			var _bTransparent : Bool = false;
			var _bCloseBox : Bool = false;
			var _sName : String = "Test";
			var _sIconName : String = "Icon";
			
			var _nX : UInt = _vFrame.nX;
			var _nY : UInt = _vFrame.nY;
			

			<cpp>
				using namespace OpMainThreadPlatformMsg;
				using namespace Lib_GzWindows::Sys;
				using namespace Lib_GZ::Sys::Window;

				// HWND hWnd;//Temp
				HINSTANCE hInstance = GetModuleHandle(NULL);
				
				WNDCLASSEX wClass;
				wClass.cbClsExtra=GZ_Null;
				wClass.cbSize=sizeof(WNDCLASSEX);
				wClass.cbWndExtra=GZ_Null;
				wClass.hbrBackground=GZ_Null;
				wClass.hCursor = LoadCursor( GZ_Null, IDC_ARROW );
						

				wClass.hIcon = LoadIcon(hInstance,   GZ_WStr(_sIconName) );
				wClass.hIconSm = LoadIcon(hInstance, GZ_WStr(_sIconName) );

				WCHAR _buffer[10];
				static gzUInt _nUniqueId = 0;
				wsprintf(_buffer, L"GZ_%d", _nUniqueId);
				_nUniqueId ++;
				
				WCHAR* WinClassName =  _buffer;
				wClass.lpszClassName =  WinClassName;
				wClass.hInstance = hInstance;
				wClass.lpfnWndProc = OpMainThreadPlatformMsg::AppWndProc;
				wClass.lpszMenuName = GZ_Null;

				if(!_bCloseBox){
					wClass.style = CS_NOCLOSE;
				}else{
					wClass.style = 0;
				}
				
				if ( !RegisterClassEx(&wClass) ) {
					MessageBox( GZ_Null, L"Failed to register window class.", L"Error", MB_OK );
					//::GZ::Global::nAppReturn = 0;
					//return false;
					return; //TODO
				}
				
				/////////////////////////
				gzUInt _nExStyleFlag = 0;
				gzUInt _hBorderFlag = 0;
				if(_bTransparent){
					_nExStyleFlag = WS_EX_LAYERED ;
					_hBorderFlag = WS_POPUP;
					_bBorder = false;
				}else{
					switch(_hBorder){

						case eWinBorder::Normal :
							_nExStyleFlag = WS_EX_APPWINDOW;
							_hBorderFlag = WS_SYSMENU | WS_CAPTION;
						break;

						case eWinBorder::NormalDouble :
							_nExStyleFlag = WS_EX_APPWINDOW |WS_EX_CLIENTEDGE;
							_hBorderFlag = WS_SYSMENU | WS_CAPTION;
						break;

						case eWinBorder::None :
							_nExStyleFlag = WS_EX_APPWINDOW;
							_hBorderFlag = WS_POPUP;
							_bBorder = false;
						break;

						case eWinBorder::BorderOnly :
							_nExStyleFlag = WS_EX_APPWINDOW;
							_hBorderFlag = WS_POPUP | WS_SIZEBOX;
						break;

						case eWinBorder::BorderOnlyDouble :
							_nExStyleFlag = WS_EX_APPWINDOW |WS_EX_CLIENTEDGE;
							_hBorderFlag = WS_POPUP | WS_SIZEBOX;
						break;

						case eWinBorder::Title :
							_nExStyleFlag = WS_EX_APPWINDOW;
							_hBorderFlag = WS_POPUP | WS_CAPTION;
						break;

						case eWinBorder::TitleDouble :
							_nExStyleFlag = WS_EX_APPWINDOW |WS_EX_CLIENTEDGE;
							_hBorderFlag = WS_POPUP | WS_CAPTION;
						break;
					}
					
					_nExStyleFlag = WS_EX_APPWINDOW;//Temp
					_hBorderFlag = WS_SYSMENU | WS_CAPTION;//Temp
				}
				
				hWnd = CreateWindowEx(
					_nExStyleFlag | WS_EX_NOPARENTNOTIFY,
					WinClassName,
					GZ_WStr(_sName),
		
					_hBorderFlag
					| WS_CLIPCHILDREN | WS_CLIPSIBLINGS    // Required for OpenGL
					,_nX, _nY, _vFrame.nWidth, _vFrame.nHeight,
					GZ_Null, GZ_Null, hInstance, this);
				
				if (!hWnd){
					 gzInt nResult = GetLastError();
					 WCHAR buffer[100];
					  wsprintf(buffer, L"Window Class Failed, error : %i", nResult);
					MessageBox(GZ_Null, buffer, L"Window Creation Failed!", MB_ICONERROR);
				}
				dcScreen = GetDC(hWnd);		
				nHandleId = (gzUIntX)dcScreen;
				nWinHandleId = (gzUIntX)hWnd;
				
				//TODO
//				fClientResize(hWnd, nFrameWidth, nFrameHeight); //Set correct client size
				ShowWindow( hWnd, SW_SHOWDEFAULT );
	
							
			</cpp>

//			ThreadMsg.fSend(new MsgCreateWindow("MonMessage!"));
			Debug.fTrace("Finsish Create: " + nHandleId);
			
			_gFrom.fContextRegistred();
		}
		
		
		
		
		<cpp>
			HINSTANCE hInstance;
			WCHAR*  WinClassName;
		
			#define WM_CAPTURE 0x900
			#define WM_CAPTURE_RELEASE 0x901
			#ifndef GWL_USERDATA
			#define GWL_USERDATA -21
			#endif
			LRESULT CALLBACK AppWndProc(HWND _hWnd, gzUInt uMsg, WPARAM wParam, LPARAM lParam){
				
				using namespace Lib_GZ::Sys::Window;
				using namespace Lib_GZ::Sys::Message;
				//using namespace GZ_Windows::Sys::Message;
				
				//return DefWindowProc(_hWnd, uMsg, wParam, lParam);
				cContextLink *_this = (cContextLink*)GetWindowLongPtr(_hWnd, GWL_USERDATA);
				if(_this == 0  ){ //|| _this->hWinClickNew == eWinClick::Close || ::GZ::Global::nNumWindows == 0
					switch(uMsg){
						case WM_NCCREATE:
							//Create "this pointer"
							SetWindowLongPtr(_hWnd, GWL_USERDATA, (LONG_PTR) ((CREATESTRUCT*)lParam)->lpCreateParams);
						 break;
					}
					return DefWindowProc(_hWnd, uMsg, wParam, lParam);
				}

				return DefWindowProc(_hWnd, uMsg, wParam, lParam);
			}
		</cpp>
		
		
		
		
		
		
		/*
		
		public function fMove( _nPosX : Int, _nPosY : Int):Void;
        public function fMoveAndSize(_nPosX : Int, _nPosY : Int, _nWidth : Int, _nHeight: Int):Void;
        public function fShow(_bActive : Bool = true):Void;
        public function fHide():Void;
		public function fIniProcess():Void;
        public function fMinimize():Void;
        public function fMaximize():Void;
        public function fRestore():Void;
        public function fDisable():Void;
		
	
		
		public function fSendData(_nOtherWinId : UInt):Void;
		private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage

        public function drawPixel():Void;
        public function fKeyIsDown(_nKeyVal : Int):Int;

        public function fCpuVSyncOnGpu():Void;
		
		
		public function fIsWindowReady():Bool;
		public function fIniRender():Void;

		public function fGetMousePosition():Void;
		public function fStartCaptureOutside():Void;
		public function fStopCaptureOutside():Void;
		//public function fFrameStart():Void;
		public function fFrameEnd():Void;
		public function fGetPixelArray():CArray<Int, 2>;
		public function  fGetKey(_oKey : Key):Void;
		

		
		
		*/
		/*
		override public function fCompleteContext(_nHandleId : UIntX) :Void {
			  Debug.fTrace1("fCompleteContext : " + _nHandleId);

		}
		*/
		
		
		
		
		
		
		
		
		

	}
}