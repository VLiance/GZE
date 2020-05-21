package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.UnVec4;
	import GZ.Gpu.Base.UnFloat;
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Shadertoy.GzShModel_Shadertoy_Vertex;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;
	import GZ.Input.Key;
	import GzOpenGL.OpenGL;
	
	public class GzShModel_Shadertoy extends GzShModel_Shadertoy_Vertex {

		public var oAt : Attribute_Quad;
		
		public var nTest : Int = 0;
		
		public var oVbo : Vbo;
		
	
		public function GzShModel_Shadertoy():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
		}
		
		
		
		
		override public function fIni_Base():Void {
			Debug.fDebug("fIni_Base Quad");
			oVbo = new Vbo(oProgram);
			
			oAt = new Attribute_Quad(oVbo);
			Attribute_Quad = oAt; //Singleton
		}
				.
		override public function fLoad_Base():Void {

		
			Debug.fPass("Load Shader GzModel_Quad");
			
			//oVertex.fLoad();
			//oFragement.fLoad();

			////////////// TODO Create Vertext ID since ES2/WebGl_1.0 not support gl_VertexID  //////////////
			oProgram.fSetDefaultAttribDivisor(1);
	
			oVboBatch  = oProgram.fAddVbo();
			oGpuBatch = new GpuBatch(this);
			
			
			var _oAtVertexID : Attribute =  new Attribute("atVertexID", oVboBatch, 0);//TODO null!
		
			oAt.fLocateAttribute(oProgram);

			oUiTime = new UnFloat(oProgram, "iTime");
			oUiMouse = new UnVec2(oProgram, "iMouse");
			oUiResolution = new UnVec2(oProgram, "iResolution");
			
			oUnType = new UnInt(oProgram, "nType");
			oUvPersp = new UnVec4(oProgram, "vPersp");
			
			oUvPosition = new UnVec2(oProgram, "vPosition");
			
			GzShCommun_Light.fIniData(oProgram);
		}
		

		override public function fIniRender():Void {

			//Debug.fTrace("fIniData -- Total Face : "  + Context.oItf.nTotalFaces) ;
			oVbo.fIniData(Context.oItf.nTotalFaces, 4, 13);
		
			oAt.fIniData( );
		}
		
		override public function fUpdate():Void {
		
			oVbo.fSendData();

			
			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
		
		
			<cpp>
				static gzFloat _nTime = 0;
				_nTime+=0.01666; //60fps
				oUiTime->nVal = _nTime;
			</cpp>
		
			oUiTime.fSend();
			
			
			//Key
			var _nSpeed : Float = 0.1;
			if(Key.fIsDown(Up)){
				oUvPosition.vVal.nY += _nSpeed;
			}
			if(Key.fIsDown(Down)){
				oUvPosition.vVal.nY -= _nSpeed;
			}
			if(Key.fIsDown(Left)){
				oUvPosition.vVal.nX -= _nSpeed;
				//Debug.fTrace("Left");
			}
			if(Key.fIsDown(Right)){
				oUvPosition.vVal.nX += _nSpeed;
			}
			oUvPosition.fSend();
		
		

			oUiMouse.vVal.nX = Context.nMouseX/Context.nFrameWidth - 0.5;
			oUiMouse.vVal.nY = Context.nMouseY/Context.nFrameHeight - 0.5;
			oUiMouse.fSend();
			
			oUiResolution.vVal.nX  = Context.nFrameWidth;
			oUiResolution.vVal.nY  = Context.nFrameHeight;
			oUiResolution.fSend();
			

			//Default Perspective
			//TODO get perspective from current buffer!
			
			oUvPersp.vVal.nX = Context.oItf.oPerspective.nFromX;//nFromX
			oUvPersp.vVal.nY = Context.oItf.oPerspective.nFromY;//nFromY
			oUvPersp.vVal.nZ = Context.oItf.oPerspective.nFromZ;//nValue
			oUvPersp.vVal.nW = Context.oItf.oPerspective.nType; //nType
			oUvPersp.fSend();
			
			GzShCommun_Light.fSetEyePos();
			GzShCommun_Light.fSetAmbiant();
			GzShCommun_Light.fSendLight();
			
	//oGpuBatch.fSetDestination(null); For test
			OpenGL.fClearColor(0.0, 0.0, 0.0, 0.0);
			
			oGpuBatch.fDraw();
			
		//	for(var i : Int = 0; i < 50; i++){
			if(oGpuBatch.oFBO_Destination != null){ //We must render on screen now
				oGpuBatch.oFBO_Destination.fToDefaultFrameBuffer();
			}
			//}
			
		
		}
		
		
	}
}