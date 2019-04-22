package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;

	//import GzOpenGL.OpenGL;
	import GZ.Sys.System;

	
	<cpp_h>
	#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	</cpp_h>
	
	<cpp_class_h>
	val oCanvas = val::global("Null");
	val aData = val::global("Null");
	val pixelArray  = val::global("Null");
	val buf8  = val::global("Null");
	val imageData = val::global("Null");
	gzInt* aPixels;
	</cpp_class_h>

	
	<cpp>
		extern "C" {
		/*
				 EMSCRIPTEN_KEEPALIVE
				float  lerp()  {
					
					printf("\ncall lerp");
					return 66;
				}*/
				/*
				EMSCRIPTEN_KEEPALIVE
				 __attribute__((noinline)) int int_sqrt(int x) {
					 	printf("\ncall int_sqrt");
				  return (x);
				}*/
				
				//float *gblvals;
				
				/*
				EMSCRIPTEN_KEEPALIVE
				__attribute__((noinline)) float my_emscripten_func(float *vals, size_t num_floats){
					vals[0] = 66;
					vals[1] = 5;
					vals[2] = 34;
					vals[3] = 88;
					gblvals = vals;
					
					printf("\n *** call my_emscripten_func");
					return 66.0;
				}*/
				
			}

		
	</cpp>
	
	
	public class OpContext overplace Context {
		
	
		public var bContext2d : Bool = true;
		//public var bContext2d : Bool = false;
			
		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF): Void {
			Debug.fTrace("---New OpWindows--");
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
			bWinGPU = false;
		}
		 
		 override static public function fManageMessageOp():Void {
		 }
		 
		 
		 
		 
		override public function fCreateContext(): Void {
		
			
				var _nGpuId : Int;
			
				Debug.fTrace("Please Insert CreateContextHandle code here");
				
			
				
				<cpp>
				
				///////////// DETECT GPU ///////////////
				using namespace emscripten;
				_nGpuId = EM_ASM_INT_V({

					if (!!window.WebGLRenderingContext) {
						var names = (['webgl2', 'webgl', 'experimental-webgl', 'moz-webgl']);
						var gl = false;
						var canvas = document.createElement("canvas");

						for(var i in names) {
							try {
								gl = canvas.getContext(names[i]);
								if (gl && typeof gl.getParameter == "function") {
								   // Module.print('GL: ' + names[i]);
								   // return names[i];
								   //"WebGL is supported"
									return i;
								}
							} catch(e) {}
						}
						// WebGL is supported, but disabled
						return -1;
					}
					//WebGL not supported
					return -2;
				});
				///////////// 	///////////// 	///////////// 
				
				
				 const char* aGLContextName[] = {"webgl2", "webgl", "experimental-webgl", "moz-webgl"};
				if(_nGpuId >= 0){
				  Lib_GZ::Debug::Debug::GetInst(thread)->fTrace(  gzU8("--Test GPU Context:") + gzStrC(aGLContextName[_nGpuId]));
				}else{
				  Lib_GZ::Debug::Debug::GetInst(thread)->fError( gzU8("--Gpu not supported"));
				  bContext2d = true;
				}
				
				
				//WebGl detect
				val document = val::global("document");
				val canvas = document.call<val>("getElementById", val("canvas"));
				canvas.set("width", val(800));
				canvas.set("height", val(600));
				//val gl = canvas.call<val>("getContext", val("webgl"));

				if( bContext2d == false && _nGpuId >= 0){ //WebGl supported
					
					val gl = canvas.call<val>("getContext", val(aGLContextName[_nGpuId]));
					
					gzStr _sVersion = gzStrC(((char*)((std::string)(gl.call<std::string>("getParameter", gl["VERSION"]))).c_str()));
					
					
					Lib_GZ::Debug::Debug::GetInst(thread)->fPass( gzU8("OpenGL avalaible: ") + _sVersion);
					
					gl.call<Void>("clearColor",  0.5, val(0.7), val(0.2), val(1.0));
				//	gl.call<Void>("clear",  gl["COLOR_BUFFER_BIT"]  );
				//  gl.call<Void>("clear",  0x00004000 );
				  
					val window = val::global("window");
					window.set("OpenGL", gl);
					
			
			//		Lib_GZ_OpenGL::OpenGL::Get(thread)->oGL = gl; //Temp
					
					
					
					/*
				   EM_ASM_ARGS({
					  var _sContexte = Pointer_stringify($0);
					OpenGL = canvas.getContext(_sContexte);
					},aGLContextName[_nGpuId]);
					*/
					
					
					EM_ASM_ARGS({
					//  OpenGL.clear($0);             
					  OpenGL.clear($0);             
					},0x00004000);
					
					
					
					/*
					EM_ASM_ARGS({
						var msg = Pointer_stringify($0); // Convert message to JS string                              
						alert(msg);                      // Use JS version of alert                                   
					}, "Alllo");
				  */
				  
				  	/*
				  	val Uint8Array = val::global("Uint8Array");
				    val dataTypedArray = Uint8Array.new_(val("wwdwwewaeaeawewa")); // Don't need to do this if the data is already in a typed array
    
				    val texture = gl.call<val>("createTexture");
					  */
					  
					  
				 // 	  int ntest = 6;
				//  gl.call<Void>("bindTexture",  gl["TEXTURE_2D"], val(ntest)  );
				//  gl.call<Void>("bindTexture",  gl["TEXTURE_2D"], val(ntest)  );
				
				  
				}else{
					
					///// Test context 2d //////////
					int _nWidth = 800;
					int _nHeight = 600;
					
					oCanvas = canvas.call<val>("getContext", val("2d"));
					imageData = oCanvas.call<val>("createImageData", val(_nWidth), val(_nHeight));
		
					pixelArray = imageData["data"];
			
					val ArrayBuffer = val::global("ArrayBuffer");
					val Uint8ClampedArray = val::global("Uint8ClampedArray");
					val Uint32Array = val::global("Uint32Array");
			
					val buf = ArrayBuffer.new_(pixelArray["length"]);
					buf8 = Uint8ClampedArray.new_(buf);
					aData = Uint32Array.new_(buf);
					//val data = new Uint32Array(buf);
					
					
					
					
				}
				
				
				
		
				
				//val h264_decoder = val::global("h264_decoder");
				//val _aTest = h264_decoder.call<val>("test");
				
				
				
				
			</cpp>	
			
			if(_nGpuId >= 0){ //WebGl supported
				
			}
			
			
		}
		override public function fIniPixelDrawZone(): CArray<Int32>{
			Debug.fTrace("Please Insert IniPixelDrawZone code here");
			<cpp>
			aPixels = new gzInt[nFrameWidth * nFrameHeight];
			return aPixels;
			</cpp>
		}
		override public function fBlit():UIntX {
			//Debug.fTrace("fBlit");
			
			if(bContext2d){
				if(bIniDrawZone){
			<cpp>
			
			//return 0; ///////////////////////////DISABLED
				int _nLength = nFrameWidth * nFrameHeight;
				
				#pragma unroll 8
				for (int i = 0; i < _nLength; i++) {
					gzUInt _nVal = aPixels[i];
					aData.set(i, (_nVal & 0xFF00FF00) | ((_nVal & 0x00FF0000) >> 16)  | ((_nVal & 0x000000FF) << 16)); //Reverse Blue & Red
					//aData.set(i, _nVal);
				}
				
				/*
				for (int i = 0; i < _nLength*4; i++) {
					pixelArray.set( i, val(aPixels[i>>1]));
				}*/

				pixelArray.call<Void>("set", val(buf8));
				oCanvas.call<Void>("putImageData", imageData, val(0), val(0)); // at coords 0,0
			</cpp>
				}
			}
		}
				
	}
		
}