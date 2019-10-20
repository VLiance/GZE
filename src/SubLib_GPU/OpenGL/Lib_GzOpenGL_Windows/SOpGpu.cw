package  { 


	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Raymarching;
	import GzOpenGL_Windows.GlWin;
	import GzOpenGL.OpGpu;
	import GzOpenGL.OpGpuInfo;


	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
		namespace Lib_GzOpenGL{namespace OpenGL{extern void fResetLastError();}}
		namespace Lib_GzOpenGL{namespace OpenGL{extern gzStr fGetLastErrorString(gzUInt _nError);}}
	</cpp>
	
	<cpp_class_h>
		HDC hDC;
		HGLRC hRC;
	</cpp_class_h>
	

	
	
	<cpp>
	void* Lib_GzOpenGL::SysGpuFunc::fGetFuncGL(const char *_cName, gzBool _bRequired){
		using namespace Lib_GZ;
		Lib_GzOpenGL::OpenGL::fResetLastError();
		void *p = (void *)wglGetProcAddress(_cName);
		gzUInt _nErr = GetLastError();
		if(_nErr == 127){
			SetLastError(0);
			HMODULE _pModule = LoadLibraryA("opengl32.dll");
			p = (void *)GetProcAddress(_pModule, _cName);
			if(p == 0 && _bRequired){
				GZ_Debug_fError(gzU8("Error OGL function Missing: ") + gzStrC(_cName));
			}
		}else{
			if(_nErr){ 
				SetLastError(0);
				GZ_Debug_fError(gzU8("Error loading OGL function (")  + gzStrUI(_nErr)  + gzU8("): ") +  Lib_GzOpenGL::OpenGL::fGetLastErrorString(_nErr) + gzStrC(_cName));
			}
		}
		return p;
	}
	</cpp>
	
	
	
	public class SOpGpu overplace OpGpu  {
		
	//	public var oGzShModel : GzShModel;

				
		public function SOpGpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
		
		}
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			
			Debug.fTrace("*********** OP Windows!! fContextIni GPU : " + _nHandleId);
			
			
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
				return fFatal(gzU8("Can't find a suitable PixelFormat or valid handle"));
			}

			if(!SetPixelFormat(hDC,PixelFormat,&pfd)){
				return fFatal(gzU8("Can't Set The PixelFormat"));
			}
			DescribePixelFormat(hDC, PixelFormat, sizeof(PIXELFORMATDESCRIPTOR), &pfd);

			if (!(hRC=wglCreateContext(hDC))){  //ReqOgl
				return fFatal(gzU8("Can't get A Rendering Context"));
			}

			if(!wglMakeCurrent(hDC,hRC)) { //ReqOgl
				return fFatal(gzU8("Can't Activate The GL Rendering Context"));
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
                return fFatal(gzU8("Can't get A Rendering Context >= 3.3"));
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
                    return fFatal(gzU8("Can't Set The Pixel Format On Context >= 3.3"));
              }

              hRC = glCreateContextAttribs(hDC, 0, iContextAttribs);

            if(!wglMakeCurrent(hDC,hRC)) {
                return fFatal(gzU8("Can't Activate The GL Rendering Context >= 3.3"));
            }
			
			</cpp>
			
			//fLoadDefaultShader();
		
			
			return true;
		}
		
		override public function fIniRender():Void {
			oGzShModel.fIniRender();
		}
				
		 override public function fBlit():Void {
			// Debug.fTrace("fBlit: Gpu");
			oGzShModel.fUpdate();
			oGzShModel.fRenderFrame();
			<cpp>
			SwapBuffers(hDC); //Window func
			</cpp>
	
		 }
		
		 override public function fSetShader(_oShader: GzShModel):Void {
			oGzShModel = _oShader;
			
			//fClear(); //TODO Verify
			//fBlit();  //TODO Verify
			fClear(); //Double buffer must clear both
		 }
		
		
		 public function fLoadDefaultShader():Bool {
			 
			<cpp>
			 const char* _file = __FILE__; //Temp
			 gzUInt _line = __LINE__; //Temp
			 //Default options
			#define GL_BLEND                          0x0BE2
			GL_fEnable(GL_BLEND);
			////////////////////
		    </cpp>
			oGzShModel = new GzShModel_Raymarching();
			
			//fClear(); //TODO Verify
			//fBlit();  //TODO Verify
			fClear(); //Double buffer must clear both
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
			//	OpenGL.fClearColor(1.0, 0.0, 0.0, 0.5);
			//OpenGL.fClear(COLOR_BUFFER_BIT);
			
			
		 }
		

	}
}