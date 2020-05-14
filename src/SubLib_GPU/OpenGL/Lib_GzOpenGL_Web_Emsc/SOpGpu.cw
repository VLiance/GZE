package  { 

	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
//	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Raymarching;
	import GzOpenGL.OpGpu;
	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Sys.Interface.Context;
	
	<cpp>
		Lib_GZ::Gpu::ShaderModel::GzModel::cGzShModel* ptrGzShModel = 0;
		
		
//extern "C" {
	
		gzInt UpdateFragmentShader(std::string _sSrc) {
			
			GZ_printf("\n\nCalllll UpdateFragmentShader %s\n", _sSrc.c_str());
			if(ptrGzShModel->oFragement->fUpdateShader(gzStrC(_sSrc.c_str()))){
				ptrGzShModel->oProgram->fAttachShader(ptrGzShModel->oFragement);
				if(ptrGzShModel->oProgram->fLink()){
					ptrGzShModel->oProgram->fReLoad_Uniform();
					Lib_GZ::Debug::Debug::GetInst(ptrGzShModel->thread)->fPass(gzU8("Link Success"));
					//Debug->fPass("Link Success");
				}
			}
			
			
			return 1;
		}

		EMSCRIPTEN_BINDINGS(my_module) {
			function("UpdateFragmentShader", &UpdateFragmentShader);
		}
		
//	}
	</cpp>
	
	
	

	public class SOpGpu overplace OpGpu  {
		
		public function SOpGpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
		
		}
		
		
		override function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
		//			 Debug.fTrace("fContextIni blit disabled");
		//	return true;
		
			Debug.fTrace("*********** SOP EMSC!! fContextIni GPU : " );
			
			
			//OpenGL.fClearColor(1.0, 0.0, 0.0, 0.5);
			OpenGL.fClearColor(0.0, 0.0, 0.0, 0.0);
			OpenGL.fClear(COLOR_BUFFER_BIT);
			
			//fLoadDefaultShader();
			
			Debug.fTrace("Finish" );
			
		
			
			return true;
		}
		
		
		
		override public function fIniRender():Void {
			oGzShModel.fIniRender();
		}
		
				
		 override public function fBlit():Void {
		 
		 
		//	 Debug.fTrace("GPU blit disabled");
			// return;
			 
			 <cpp>
			 
			 /*
			 static int _nTest = 0;
			_nTest++;
			if(_nTest == 200){
				val GZE = val::global("GZE");
				if(!GZE.isUndefined()){
					 GZE.call<Void>("After200Frames");
				}
			}*/
			 
			 
			 /*
			//val window = val::global("window");
			val FPSMeter = val::global("meter");
			if(!FPSMeter.isUndefined()){
				 FPSMeter.call<Void>("tickStart");
			}
			*/
		
		   </cpp>
			var _nColor : UInt32 =  Context.nBgColor;
			 if(_nColor & 0x000000FF) != 0){ //Not for completly alpha
				var _nRed : Float = ((_nColor & 0xFF000000) >> 24) / 256.0;
				var _nGreen : Float = ((_nColor & 0x00FF0000) >> 16) / 256.0;
				var _nBlue : Float = ((_nColor & 0x0000FF00) >> 4) / 256.0;
				var _nAlpha : Float = ((_nColor & 0x000000FF) ) / 256.0;
			
				OpenGL.fClearColor(_nRed,_nGreen,_nBlue,_nAlpha); //Just to change background color, TODO maybe faster to use shader, or maybe not (Blend is slow)
				OpenGL.fClear(COLOR_BUFFER_BIT);
			}
			
			//val FPSMeter = window.get("FPSMeter");
			
			// Debug.fTrace("fBlit: Gpu");
			oGzShModel.fUpdate();
			oGzShModel.fRenderFrame();
			<cpp>
			/*
			if(!FPSMeter.isUndefined()){
				FPSMeter.call<Void>("tick");
			}
			*/
			</cpp>
		 }
		
		
		
		 override public function fSetShader(_oShader: GzShModel):Void {
			oGzShModel = _oShader;
			
			<cpp>
				ptrGzShModel = oGzShModel.get();
			</cpp> 
		 }
		
		
		 override public function fLoadDefaultShader():Bool {
			
			oGzShModel = new GzShModel_Raymarching();
			
			<cpp>
				ptrGzShModel = oGzShModel.get();
			</cpp> 
			
		 }
		
		
		 override public function fClear():Void {
		
		 }
		 
		 
		 
		

	}
}