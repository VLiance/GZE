package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;
	//import GzWindows.Sys.Message.OpContextLink;
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	<cpp>
		#include "Lib_GZ/Lib.h"
		extern gzUIntX nTestProgInstance;
	</cpp>	
		
		
	<cpp_namespace>
		HDC hmemdc;
		gzInt* aPixels;
		gzInt** p2DArray;
		SIZE frameSize;
		HBITMAP hbmp;
	</cpp_namespace>
	

		
	public class OpContext overplace Context {
		

		public var sIcon : String;

		//public var bCloseBox : Bool = true;

		
	//	private static var qaShort : QArray<Int, 1>;

	
		public var hWinClickNew : eWinClick = eWinClick.None;
		//public var hWinClickNew : eWinClick;
		
		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF  ) : Void{
			Debug.fTrace("--Okays--");
			Debug.fTrace("---New OpWindows--");
			
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
		//	fCreateForm
		}
		 
		
		override public function fIniPixelDrawZone(): CArray<Int32>{
			
			Debug.fTrace("fIniPixelDrawZone");
			<cpp>
				frameSize.cx = nFrameWidth;
				frameSize.cy = nFrameHeight;
			</cpp>
			
			
			//if(oLink.bGpuDraw == false){
				<cpp>
					//_::hmemdc = CreateCompatibleDC(dcScreen);
					hmemdc = CreateCompatibleDC((HDC)nHandleId);
					BITMAPINFO bmi;
					bmi.bmiHeader.biSize = sizeof(BITMAPINFO);
					bmi.bmiHeader.biWidth = nFrameWidth;
					bmi.bmiHeader.biHeight =  -nFrameHeight; // Negative -> order pixels from top to bottom
					bmi.bmiHeader.biPlanes = 1;
					bmi.bmiHeader.biBitCount = 32;
					bmi.bmiHeader.biCompression = BI_RGB;
					bmi.bmiHeader.biSizeImage = 0;
					bmi.bmiHeader.biXPelsPerMeter = 0;
					bmi.bmiHeader.biYPelsPerMeter = 0;
					bmi.bmiHeader.biClrUsed = 0;
					bmi.bmiHeader.biClrImportant = 0;
					bmi.bmiColors[0].rgbBlue = 0;
					bmi.bmiColors[0].rgbGreen = 0;
					bmi.bmiColors[0].rgbRed = 0;
					bmi.bmiColors[0].rgbReserved = 0;

					hbmp = CreateDIBSection( hmemdc, &bmi, DIB_RGB_COLORS, (void**)&aPixels, GZ_Null, 0 );
					SelectObject( hmemdc, hbmp );
					
					return aPixels;
				</cpp>
				
			//}
			
			<cpp>//lite?
			//aPixels = new gzInt[nFrameWidth * nFrameHeight];
			//return aPixels;
			</cpp>
			
			<cpp>//Cpcdos
			// Retourner le pointeur du contexte depuis Cpcdos
			//return (gzInt32*) oCpcdos->Init_Get_Context_PTR(nIdContextGZE);
			</cpp>
		}
		
		
		override public function fBlit():UIntX {
		//	Debug.fTrace("Blit!!");
			
			if(nHandleId && nWinHandleId){
				<cpp>
			// if (hWnd && dcScreen) {
				//if(oLink->bGpuDraw){
					
					/*	
					static gzBool _bOneTime  = false;
					if(!bOnRezize){
						_bOneTime = false;
						 oGpu->fWinBlit(dcScreen,0);

					}else{
						if(!_bOneTime){
							_bOneTime = true;
							bResizeRenderReady = true;
						}
					}*/

				//}else{
					//GZ_printf("\nsss");
					if(!bTransparent){
						//BitBlt( dcScreen, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, SRCCOPY );
					
						if(nResFacX == 1 && nResFacY == 1){
						
							BitBlt( (HDC)nHandleId, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, SRCCOPY );
						}else{
							StretchBlt( (HDC)nHandleId, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, nFrameWidth/nResFacX, nFrameHeight/nResFacY, SRCCOPY );
						}
				
					}else{

						static BLENDFUNCTION bf = {AC_SRC_OVER, 0, nWinAlpha, AC_SRC_ALPHA};
						static POINT ptSrc = {0,0};
						UpdateLayeredWindow((HWND)nWinHandleId, (HDC)nHandleId, GZ_Null, &frameSize, hmemdc, &ptSrc, 0, &bf, ULW_ALPHA);
					}
				//}
				//_nHandleId = (gzUIntX)dcScreen;
				//_nWinHandleId = (gzUIntX)hWnd;
				
				</cpp>
			 }
		
			return 0;
		}
		
		
	
		
		override function fMove( _nPosX : Int, _nPosY : Int):Void;
        override function fMoveAndSize(_nPosX : Int, _nPosY : Int, _nWidth : Int, _nHeight: Int):Void;
        override function fShow(_bActive : Bool = true):Void;
        override function fHide():Void;
		override function fIniProcess():Void;
        override function fMinimize():Void;
        override function fMaximize():Void;
        override function fRestore():Void;
        override function fDisable():Void;
		
	
		
//		public function fSendData(_nOtherWinId : UInt):Void;
//		private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage

        override function drawPixel():Void;
    //    public function fKeyIsDown(_nKeyVal : Int):Int;

        override function fCpuVSyncOnGpu():Void;
		
		
		override function fIsWindowReady():Bool;
	

		override function fGetMousePosition():Void{
			<cpp>
				CURSORINFO ci;
				ci.cbSize = sizeof(CURSORINFO);
				GetCursorInfo(&ci);

				POINT point;
				point.x = ci.ptScreenPos.x;
				point.y = ci.ptScreenPos.y;

				ScreenToClient((HWND)nWinHandleId, &point);

				nLastMouseX = nMouseX;
				nLastMouseY = nMouseY;
				nMouseX =  gzFloat(point.x) / nResFacX;
				nMouseY =  gzFloat(point.y) / nResFacY;

				bFirstMouseOver = false;
			</cpp>
		}
		
		
		override function fStartCaptureOutside():Void;
		override function fStopCaptureOutside():Void;
		//public function fFrameStart():Void;
		override function fFrameEnd():Void;
		override function fGetPixelArray():CArray<Int, 2>;
		
		/*
			gzInt** cSysWindow::fGetPixelArray() {
				return p2DArray;
			}
		*/
		
		override function  fGetKey(_oKey : Key):Void;
		

		
		
		
	}
}