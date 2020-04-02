package  { 


	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	//import GZ.Gpu.ShaderModel.GzModel.GzShModel_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Raymarching;

	import GzOpenGL.OpGpu;
	import GzOpenGL.OpGpuInfo;


	
	
	public class SOpGpu overplace OpGpu  {
		
	//	public var oGzShModel : GzShModel;

				
		public function SOpGpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
		
		}
		
		override function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
			
			Debug.fTrace("*********** OP Android!! fContextIni GPU : " + _nHandleId);
			
			
			
			return true;
		}
		
		override public function fIniRender():Void {
			oGzShModel.fIniRender();
		}
				
		 override public function fBlit():Void {
		 	OpenGL.fClearColor(0.1, 0.5, 0.2, 0.5);
			OpenGL.fClear(COLOR_BUFFER_BIT );
			oGzShModel.fUpdate();
			oGzShModel.fRenderFrame();
		 }
		
		 override public function fSetShader(_oShader: GzShModel):Void {
			oGzShModel = _oShader;
			
			//OpenGL.fClearColor(0.7, 0.2, 0.2, 0.5);//				gl.call<Void>("clearColor",  0.5, val(0.7), val(0.2), val(1.0));
			//OpenGL.fClear(COLOR_BUFFER_BIT );
			<cpp>
			//SwapBuffers(hDC); //Window func //Double buffer must clear both
			</cpp>
			//OpenGL.fClear(COLOR_BUFFER_BIT );  //Double buffer must clear both
			//fClear(); //TODO Verify
			//fBlit();  //TODO Verify
			//fClear();
		 }
		
		
		 override function fLoadDefaultShader():Bool {
			 
			<cpp>
			 const char* _file = __FILE__; //Temp
			 gzUInt _line = __LINE__; //Temp
			 //Default options
			//#define GL_BLEND                          0x0BE2
			//GL_fEnable(GL_BLEND);
			////////////////////
		    </cpp>
			oGzShModel = new GzShModel_Raymarching();
			
			//fClear(); //TODO Verify
			//fBlit();  //TODO Verify
			fClear(); //Double buffer must clear both
		 }
		
		
		
		 override public function fClear():Void {
			
			
		 }
		

	}
}