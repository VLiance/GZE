#skipContent
package  { 
	
		
	import GZ.Sys.System;
	import GZ.Sys.Message.ContextLink;
	import GzWindows.Sys.OpContext;
	import GZ.Sys.ContextHandle;
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
	</cpp_h>
	
	<cpp>
	/*
		HDC hmemdc;
		gzInt* aPixels;
		gzInt** p2DArray;
		HDC dcScreen;
		SIZE frameSize;
		HWND hWnd;
		HBITMAP hbmp;*/
	</cpp>
	
	public class OpContextHandle overplace ContextHandle {
		
		public var nMainInst : UIntX;

		
		
		public function OpContextHandle(_oLink : ContextLink): Void {
			ContextHandle(_oLink);
		}
		
		override public function fCreateContextHandle(): Bool {

			nMainInst = System.nInstance;

	
			var _nX : UInt = oLink.oPos.nX;
			var _nY : UInt = oLink.oPos.nY;
			
			<cpp>
			/*
				using namespace OpContextHandle;
				using namespace Lib_GzWindows::Sys;
				using namespace Lib_GZ::Sys::Window;

				// HWND hWnd;//Temp
				HINSTANCE hInstance = (HINSTANCE)nMainInst;
				
				WNDCLASSEX wClass;
				wClass.cbClsExtra=GZ_Null;
				wClass.cbSize=sizeof(WNDCLASSEX);
				wClass.cbWndExtra=GZ_Null;
				wClass.hbrBackground=GZ_Null;
				wClass.hCursor = LoadCursor( GZ_Null, IDC_ARROW );
						
				
				gzStr16 _sIcon(oLink->sIcon.fToUTF16());
				WCHAR _bufferIcon[255];//TODO FixARRAY 
				_sIcon.fToChar((gzUInt**)_bufferIcon);
				
				//gzUTF16 _sIcon(oLink->sIcon);

				wClass.hIcon = LoadIcon(hInstance, (LPCWSTR)(gzUInt16*)_bufferIcon);
				wClass.hIconSm = LoadIcon(hInstance, (LPCWSTR)(gzUInt16*)_bufferIcon);

				WCHAR _buffer[10];
				static gzUInt _nUniqueId = 0;
				wsprintf(_buffer, L"GZ_%d", _nUniqueId);
				_nUniqueId ++;
				
				WCHAR* WinClassName =  _buffer;
				wClass.lpszClassName =  WinClassName;
				wClass.hInstance = hInstance;
				wClass.lpfnWndProc = OpContext::AppWndProc;
				wClass.lpszMenuName = GZ_Null;

				if(!oLink->bCloseBox){
					wClass.style = CS_NOCLOSE;
				}else{
					wClass.style = 0;
				}
				
				if ( !RegisterClassEx(&wClass) ) {
					MessageBox( GZ_Null, L"Failed to register window class.", L"Error", MB_OK );
					//::GZ::Global::nAppReturn = 0;
					return false;
				}
				
				/////////////////////////
				oLink->bTransparent = false;
				oLink->bBorder = true;
				gzUInt _nExStyleFlag = 0;
				gzUInt _hBorderFlag = 0;
				if(oLink->bTransparent){
					_nExStyleFlag = WS_EX_LAYERED ;
					_hBorderFlag = WS_POPUP;
					oLink->bBorder = false;
				}else{
					switch(oLink->hBorder){

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
							oLink->bBorder = false;
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
				
				
								
				gzStr16 _sWinName(oLink->sName.fToUTF16());
				WCHAR _bufferName[255];//TODO FixARRAY 
				_sWinName.fToChar((gzUInt**)_bufferName);
				
				//gzUTF16 _sWinName(oLink->sName);
				WCHAR* _WinName = (WCHAR*)(gzUInt16*)_bufferName;
					
				hWnd = CreateWindowEx(
				_nExStyleFlag | WS_EX_NOPARENTNOTIFY,
				WinClassName,
				_WinName,
				_hBorderFlag
				| WS_CLIPCHILDREN | WS_CLIPSIBLINGS    // Required for OpenGL
				,_nX, _nY, nFrameWidth, nFrameHeight,
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
				
				fClientResize(hWnd, nFrameWidth, nFrameHeight); //Set correct client size
				ShowWindow( hWnd, SW_SHOWDEFAULT );
	
					*/		
			</cpp>

//			ThreadMsg.fSend(new MsgCreateWindow("MonMessage!"));
			Debug.fTrace("Finsish Create: " + nHandleId);
		}
		
		<cpp>
			void fClientResize(HWND _hWnd, int _nWidth, int _nHeight){
				RECT rcClient, rcWindow;
				POINT ptDiff;
				GetClientRect(_hWnd, &rcClient);
				GetWindowRect(_hWnd, &rcWindow);
				ptDiff.x = (rcWindow.right - rcWindow.left) - rcClient.right;
				ptDiff.y = (rcWindow.bottom - rcWindow.top) - rcClient.bottom;
				MoveWindow(_hWnd,rcWindow.left, rcWindow.top, _nWidth + ptDiff.x, _nHeight + ptDiff.y, TRUE);
			}
		</cpp>



		override public function fIniPixelDrawZone(): CArray<Int32>{
			
			Debug.fTrace("fIniPixelDrawZone");
			<cpp>
				frameSize.cx = nFrameWidth;
				frameSize.cy = nFrameHeight;
				
			</cpp>
			
			if(oLink.bGpuDraw == false){
				<cpp>
					hmemdc = CreateCompatibleDC(dcScreen);
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
					/*
					p2DArray = new gzInt*[nFrameHeight];
					for (gzInt y = 0; y < nFrameHeight; ++y){
						p2DArray[y] =  (gzInt*)&aPixels[y * nFrameWidth];
					}*/
					
					//p2DArray[1][1] = 0xFFFFFFFF;
					//			printf("\nOKI %p, ", p2DArray);
					//	aHandleDrawZone = p2DArray;
						//		printf("\nIniPix,  %p,", aHandleDrawZone);
								
					//return p2DArray;
					return aPixels;
				</cpp>
				
				//return aHandleDrawZone;
			}
		}
		
		
		override public function fBlit():UIntX {
			//Debug.fTrace1("Blit!!");
			<cpp>
			 if (hWnd && dcScreen) {
				if(oLink->bGpuDraw){
					
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

				}else{
					//printf("\nsss");
					//if(!oLink->bTransparent){
						BitBlt( dcScreen, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, SRCCOPY );
					
						/*
						if(nResFacX == 1 && nResFacY == 1){
							BitBlt( dcScreen, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, SRCCOPY );
						}else{
							StretchBlt( dcScreen, 0, 0, nFrameWidth, nFrameHeight, hmemdc, 0, 0, nFrameWidth/nResFacX, nFrameHeight/nResFacY, SRCCOPY );
						}*/
			
				/*
						}else{

						static BLENDFUNCTION bf = {AC_SRC_OVER, 0, nWinAlpha, AC_SRC_ALPHA};
						static POINT ptSrc = {0,0};
						UpdateLayeredWindow(hWnd, dcScreen, GZ_Null, &frameSize, hmemdc, &ptSrc, 0, &bf, ULW_ALPHA);
					}*/
				}
			 }
			</cpp>
			return 0;
		}
		
		
		
		
		
		
		
	}
}