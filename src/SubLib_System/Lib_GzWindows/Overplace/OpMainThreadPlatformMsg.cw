package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.MainThreadPlatformMsg;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;
	import GZ.Base.Rect;
	//import GzWindows.Sys.Message.OpContextLink;
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	<cpp>
		#include "Lib_GzWindows/Helper/Window.cpp_inc"
		#include "Lib_GzWindows/Helper/ProcessMessage.cpp_inc"
	</cpp>

	
	<cpp_namespace>
		HDC dcScreen;
		HWND hWnd;
	</cpp_namespace>
	
	<cpp_namespace_h>
	LRESULT CALLBACK AppWndProc(HWND _hWnd, gzUInt uMsg, WPARAM wParam, LPARAM lParam);
	</cpp_namespace_h>
	

	public class OpMainThreadPlatformMsg overplace MainThreadPlatformMsg {
	
		use Window.ePositioning;
		
		public var nHandleId : UIntX;
		public var nWinHandleId : UIntX;
	
		
		
		public function OpMainThreadPlatformMsg() : Void{
			//Debug.fTrace("--OpMainThreadPlatformMsg--");
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
		 
		 override public function fSetTitle(_sTitle : String):Void {
			<cpp>
			SetWindowText((HWND)nWinHandleId, _sTitle.fToWStr().get());
			</cpp>
		}
		 
		 
		 
		override public function fRegisterContext(_gFrom : Gate<Context>, _oWindow : Window):Void {
/*
			Debug.fTrace("RECTxxxx "  + _oWindow.vFrame.nX);
			Debug.fTrace("RECTyyyy"  + _oWindow.vFrame.nY);
			Debug.fTrace("RECTwww"  + _oWindow.vFrame.nWidth);
			Debug.fTrace("RECThhh"  + _oWindow.vFrame.nHeight);
			*/
					
			//var _nHandleId : UIntX = 0;
			//var _nWinHandleId : UIntX = 0;
	
		//	var hBorder : Window.eWinBorder;
			var _hBorder : Window.eWinBorder = Window.eWinBorder.Normal;

			var _bBorder : Bool = true;
			var _bTransparent : Bool = false;
			var _bCloseBox : Bool = true;
			
			var _sName : String = _oWindow.sName;
			var _sIconName : String = "Icon";
			
			var _nX : UInt = _oWindow.vFrame.nX;
			var _nY : UInt = _oWindow.vFrame.nY;
			
			<cpp>
				using namespace OpMainThreadPlatformMsg;
				using namespace Lib_GzWindows::Overplace;
				using namespace Lib_GZ::Sys::Interface::Window;
				
				//if center:
				_nX  = CW_USEDEFAULT; //CW_USEDEFAULT for correct monitor detection (center)

				// HWND hWnd;//Temp
				HINSTANCE hInstance = GetModuleHandle(NULL);
				
				WNDCLASSEX wClass;
				wClass.cbClsExtra=GZ_Null;
				wClass.cbSize=sizeof(WNDCLASSEX);
				wClass.cbWndExtra=GZ_Null;
				wClass.hbrBackground=GZ_Null;
				wClass.hCursor = LoadCursor( GZ_Null, IDC_ARROW );
						

				wClass.hIcon = LoadIcon(hInstance,   _sIconName.fToWStr().get() );
				wClass.hIconSm = LoadIcon(hInstance, _sIconName.fToWStr().get() );

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
/*
  if (bMinimizeBox) {
        _hBorderFlag = _hBorderFlag | WS_MINIMIZEBOX;
    }
    if (bMaximizeBox) {
        _hBorderFlag = _hBorderFlag | WS_MAXIMIZEBOX;
    }

    if(_bResizable){
        _hBorderFlag = _hBorderFlag | WS_SIZEBOX;
    }

    if(hState != eWinState::Hidden){
        _hBorderFlag = _hBorderFlag | WS_VISIBLE;
    }*/
				
				
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
							_hBorderFlag = WS_SYSMENU | WS_CAPTION ;
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
					_sName.fToWStr().get(),
		
					_hBorderFlag

					| WS_CLIPCHILDREN | WS_CLIPSIBLINGS    // Required for OpenGL
					,CW_USEDEFAULT, _nY, _oWindow->vFrame.nWidth, _oWindow->vFrame.nHeight,
					GZ_Null, GZ_Null, hInstance, _gFrom.get());
				
				if (!hWnd){
					 gzInt nResult = GetLastError();
					 WCHAR buffer[100];
					  wsprintf(buffer, L"Window Class Failed, error : %i", nResult);
					MessageBox(GZ_Null, buffer, L"Window Creation Failed!", MB_ICONERROR);
				}
				dcScreen = GetDC(hWnd);		
				nHandleId = (gzUIntX)dcScreen;
				nWinHandleId = (gzUIntX)hWnd;
				
				int _nTitleOffset = fClientResize(hWnd, _oWindow->vFrame.nWidth, _oWindow->vFrame.nHeight); //Set correct client size
				ClipOrCenterWindowToMonitor(hWnd, MONITOR_CENTER | MONITOR_WORKAREA, _nTitleOffset);
				
				ShowWindow( hWnd, SW_SHOWDEFAULT );
			
			</cpp>

//			ThreadMsg.fSend(new MsgCreateWindow("MonMessage!"));
			Debug.fTrace("Finsish Create: " + nHandleId);

			_gFrom.fContextRegistred(nHandleId, nWinHandleId);
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
			
			using namespace Lib_GZ::Sys::Interface::Window;
			//using namespace GZ_Windows::Sys::Message;
			Lib_GZ::cHoldGate* _pGate = (Lib_GZ::cHoldGate*)GetWindowLongPtr(_hWnd, GWL_USERDATA);
			
			//return DefWindowProc(_hWnd, uMsg, wParam, lParam);
			//cContextLink *_this = (cContextLink*)GetWindowLongPtr(_hWnd, GWL_USERDATA);
			if(_pGate == 0  ){ //|| _this->hWinClickNew == eWinClick::Close || ::GZ::Global::nNumWindows == 0
				switch(uMsg){
					case WM_NCCREATE:
						//Create "this pointer"
						SetWindowLongPtr(_hWnd, GWL_USERDATA, (LONG_PTR) ((CREATESTRUCT*)lParam)->lpCreateParams);
					 break;
				}
				return DefWindowProc(_hWnd, uMsg, wParam, lParam);
			}else{
				fProcessMessage(_pGate,  _hWnd, uMsg, wParam, lParam);
				return DefWindowProc(_hWnd, uMsg, wParam, lParam);
			}
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
			  Debug.fTrace("fCompleteContext : " + _nHandleId);
		}
		*/
		
	}
}