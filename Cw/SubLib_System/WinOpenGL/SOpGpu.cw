package  { 

	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GzOpenGL.OpGpu;

	<cpp_h>
		#include "Lib_GZ/SysUtils/WindowsHeader.h"
	</cpp>
	
	<cpp_class_h>
		HDC hDC;
		HGLRC hRC;
	</cpp_class_h>
	

		
	
	public class SOpGpu overplace OpGpu  {
		
	//	public var oGzShModel : GzShModel;

		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace1("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			
			Debug.fTrace1("*********** OP Windows!! fContextIni GPU : " + _nHandleId);
			
			
			<cpp>
		
				hDC = (HDC)_nHandleId;
				
				
				static gzUInt		PixelFormat;			    // Holds The Results After Searching For A Match
				static	PIXELFORMATDESCRIPTOR pfd =				// pfd Tells Windows How We Want Things To Be
				{
					sizeof(PIXELFORMATDESCRIPTOR),				// Size Of This Pixel Format Descriptor
					1,											// Version Number
					PFD_DRAW_TO_WINDOW |						// Format Must Support Window
					PFD_SUPPORT_OPENGL |						// Format Must Support OpenGL
					PFD_DOUBLEBUFFER,							// Must Support Double Buffering
					PFD_TYPE_RGBA,								// Request An RGBA Format
					32,									    	// Select Our Color Depth
					0, 0, 0, 0, 0, 0,							// Color Bits Ignored
					0,											// No Alpha Buffer
					0,											// Shift Bit Ignored
					0,											// No Accumulation Buffer
					0, 0, 0, 0,									// Accumulation Bits Ignored
					24,
																// 16Bit Z-Buffer (Depth Buffer)
					8,											// No Stencil Buffer
					0,											// No Auxiliary Buffer
					PFD_MAIN_PLANE,						    	// Main Drawing Layer
					0,											// Reserved
					0, 0, 0										// Layer Masks Ignored
				};

			//////////////////////////////////////////////////////////// 
			 ////////////// OPENGL 2 Compatibility context //////////////
			if (!(PixelFormat = ChoosePixelFormat(hDC,&pfd))){
				return fFatal(gzStrL("Can't find a suitable PixelFormat or valid handle"));
			}

			if(!SetPixelFormat(hDC,PixelFormat,&pfd)){
				return fFatal(gzStrL("Can't Set The PixelFormat"));
			}
			DescribePixelFormat(hDC, PixelFormat, sizeof(PIXELFORMATDESCRIPTOR), &pfd);

			if (!(hRC=wglCreateContext(hDC))){  //ReqOgl
				return fFatal(gzStrL("Can't get A Rendering Context"));
			}

			if(!wglMakeCurrent(hDC,hRC)) { //ReqOgl
				return fFatal(gzStrL("Can't Activate The GL Rendering Context"));
			}
			///////////////////////////////////////////////////////////
			//////////////////////////////////////////////////////////// 
			</cpp>
			
			//Context GL2 created we can now get GL3 functions
			oGpuInfo.fIniFunctions();
			
			if(oGpuInfo.fGetVersion() == false){
				return fFatal("Mininal version required not supported >= 3.3");
			}
			
			var _nMin : Int = GpuInfo.nVersionMinor;
			var _nMaj : Int = GpuInfo.nVersionMajor;
			
			<cpp>
			////////////// OPENGL 3+ core context //////////////
			PFNWGLCHOOSEPIXELFORMATARBPROC glChoosePixelFormat = (PFNWGLCHOOSEPIXELFORMATARBPROC)wglGetProcAddress("wglChoosePixelFormatARB");
			PFNWGLCREATECONTEXTATTRIBSARBPROC glCreateContextAttribs = (PFNWGLCREATECONTEXTATTRIBSARBPROC)wglGetProcAddress("wglCreateContextAttribsARB");
			
			if(!(glChoosePixelFormat && glCreateContextAttribs)){
                return fFatal(gzStrL("Can't get A Rendering Context >= 3.3"));
            }
			//Delete OGL 2 Context
            wglMakeCurrent(0, 0);
            wglDeleteContext(hRC);
			
			////Create OPENGL 3 context ////
			const int iPixelFormatAttribList[] =
              {
                 WGL_DRAW_TO_WINDOW, true,
                 WGL_SUPPORT_OPENGL, true,
                 WGL_DOUBLE_BUFFER, true,
                 WGL_PIXEL_TYPE, WGL_TYPE_RGBA,
                 WGL_COLOR_BITS, 32,
                 WGL_DEPTH_BITS, 24,
                 WGL_STENCIL_BITS, 8,
                 0
              };
			  
			  #define WGL_CONTEXT_CORE_PROFILE_BIT 0x00000001
			  
              int iContextAttribs[] =
              {
                 WGL_CONTEXT_MAJOR_VERSION, _nMaj,
                 WGL_CONTEXT_MINOR_VERSION, _nMin,
                 WGL_CONTEXT_FLAGS, WGL_CONTEXT_CORE_PROFILE_BIT,
                 0
              };

              int iPixelFormat, iNumFormats;
              glChoosePixelFormat(hDC, iPixelFormatAttribList, NULL, 1, &iPixelFormat, (gzUInt*)&iNumFormats);

              if(!SetPixelFormat(hDC, iPixelFormat, &pfd)){
                    return fFatal(gzStrL("Can't Set The Pixel Format On Context >= 3.3"));
              }

              hRC = glCreateContextAttribs(hDC, 0, iContextAttribs);

            if(!wglMakeCurrent(hDC,hRC)) {
                return fFatal(gzStrL("Can't Activate The GL Rendering Context >= 3.3"));
            }
			
			</cpp>
			
			fLoadDefaultShader();
			fClear();
			fBlit();
			fClear(); //Double buffer must clear both
			
			return true;
		}
		
		
				
		 override public function fBlit():Void {
			// Debug.fTrace1("fBlit: Gpu");
			oGzShModel.fDraw();
			<cpp>
			SwapBuffers(hDC); //Window func
			</cpp>
	
		 }
		
		
		
		 public function fLoadDefaultShader():Bool {
			 
			<cpp>
			 //Default options
			#define GL_BLEND                          0x0BE2
			GL_fEnable (GL_BLEND);
			////////////////////
		    </cpp>
			oGzShModel = new GzShModel();
		 }
		
		
		
		 override public function fClear():Void {
			<cpp>
			// ClearBufferMask
			#define GL_DEPTH_BUFFER_BIT               0x00000100
			#define GL_STENCIL_BUFFER_BIT             0x00000400
			#define GL_COLOR_BUFFER_BIT               0x00004000
	//		GL_fClearColor(0.0, 0.0, 1.0, 0.0);
	//		GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			</cpp>
		 }
		

	}
}