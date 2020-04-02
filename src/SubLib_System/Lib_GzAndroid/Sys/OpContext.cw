package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;

	import GzOpenGL.OpenGL;
	import GZ.Sys.System;

	
	<cpp_h>
//	#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	//gzVal oHtmlCanvas;
	</cpp_h>
	
	<cpp>
//	#include "Lib_GzWeb_Emsc/Emscripten/Helper/html5_mouse.cpp"
//	#include "Lib_GzWeb_Emsc/Emscripten/Helper/html5_keyboard.cpp"



	</cpp>
	
	<cpp_class_h>
	gzInt* aPixels;
	gzUIntX nArraySize;
	</cpp_class_h>
	
	public class OpContext overplace Context {
		
	
		public var nGpuId : Int = -1;
		public var bContext2d : Bool = false;

		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF): Void {
			Debug.fTrace("---New OpWindows--");
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
			//bWinGPU = false;
			
			_oInterface.bFrBasedOnTime = false;
			
			if(_oInterface.bGpuDraw == false){
				bContext2d = true;
			}
			
		}
		 
		 static public function fManageMessageOp():Void {
		 }

		 
		override public function fCreateContext(): Void {
		
			Debug.fTrace("Please Insert CreateContextHandle code here");

		}
		
		
		override public function fInitialised(): Void {
			Debug.fPass("Context Initialised");
		
		}
	
		
		override public function fIniPixelDrawZone(): CArray<Int32>{
			Debug.fTrace("Please Insert IniPixelDrawZone code here");
			Debug.fTrace("nFrameWidth : "  +nFrameWidth);
			Debug.fTrace("nFrameHeight : "  +nFrameHeight);
			<cpp>
			
			nArraySize = nFrameWidth * nFrameHeight * sizeof(gzUInt32);
			aPixels = (gzInt*)GZ_fMalloc(nFrameWidth * nFrameHeight, sizeof(gzUInt32));

			return aPixels;
			</cpp>
		}
		
		override public function fBlit():UIntX {
			//Debug.fTrace("fBlit");
			if(bIniDrawZone){
			
				if( bContext2d == false && nGpuId >= 0){ //WebGl supported
					
				}else{
				
				}
				
			}
		}
		
		
		
		
		override function fGetWindowSize():Bool{
			
		//		nFrameWidth = _oHtmlCanvas["width"].as<int>();
		//		nFrameHeight = _oHtmlCanvas["height"].as<int>();
			return false; //TODO set winsize
		}
		
		
		override function fGetMousePosition():Void{
			
		}
		
		/*
		    var canvasOffset=$("#canvas").offset();
    var offsetX=canvasOffset.left;
    var offsetY=canvasOffset.top;
		*/
		
		
		
		
		
				
	}
		
}
