package  { 

	import GZ.Gpu.Gpu;
	import GZ.Gfx.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Context;
	import GZ.Sys.Window;
	import GZ.Sys.System;
	//import GzWindows.Sys.Message.OpContextLink;
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	<cpp>
		#include "Lib_GZ/Lib.h"
		extern gzUIntX nTestProgInstance;
	</cpp>	
		

	
	<cpp_namespace_h>
	LRESULT CALLBACK AppWndProc(HWND _hWnd, gzUInt uMsg, WPARAM wParam, LPARAM lParam);
	</cpp_namespace_h>
	

		
	public class OpContext overplace Context {
		
	//	public var  nHandleId : UInt;
	
		
		
	//	public static var receiveGate : Gate<ClassAppWndProc>;
		
		
	//	public var hWinClickNew : eWinClick;
	
	/**
		public enum eWinState : Int {
			Normal;
			Minimised;
			Maximised;
			Hidden; 
		}*/
		
		
		public var sIcon : String;

		//public var bCloseBox : Bool = true;

		
		private static var qaShort : QArray<Int, 1>;

	
		public var hWinClickNew : eWinClick = eWinClick.None;
		//public var hWinClickNew : eWinClick;
		
		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF  ) : Void{
			Debug.fTrace("--Okays--");
			Debug.fTrace("---New OpWindows--");
			
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
		//	fCreateForm
		}
		 
		 override static public function fManageMessageOp():Void {
		 	//Debug.fTrace1("---OP mange MSG--");
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
		override public function fCompleteContext(_nHandleId : UIntX) :Void {
			  Debug.fTrace1("fCompleteContext : " + _nHandleId);

		}
		*/
		
		
		
		
		
		
		
		
		

	}
}