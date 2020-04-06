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
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Tiles.GzShModel_Tiles_Vertex;
	
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Tiles;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public class GzShModel_Tiles extends GzShModel_Tiles_Vertex {

		public var oAt : Attribute_Quad;
		
		public var oAtTiles : Attribute_Tiles;

		public var nTest : Int = 0;
		
		public var oVbo : Vbo;
		
	
		public function GzShModel_Quad():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
		}
		
		

		override public function fIni_Base():Void {
		
			oVbo = new Vbo(oProgram);
			
			oAt = new Attribute_Quad(oVbo);
			Attribute_Quad = oAt; //Singleton
								
			oAtTiles = new Attribute_Tiles(oVbo);
			Attribute_Tiles = oAtTiles; //Singleton
		}
				.
		override public function fLoad_Base():Void {

			//oVertex.fLoad();
			//oFragement.fLoad();

			////////////// TODO Create Vertext ID since ES2/WebGl_1.0 not support gl_VertexID  //////////////
			oProgram.fSetDefaultAttribDivisor(1);
	
			oVboBatch  = oProgram.fAddVbo();
			oGpuBatch = new GpuBatch(this);

			
			var _oAtVertexID : Attribute =  new Attribute("atVertexID", oVboBatch, 0);//TODO null!
		
			oAt.fLocateAttribute(oProgram);
			oAtTiles.fLocateAttribute(oProgram);

			oUiTime = new UnFloat(oProgram, "iTime");
			oUiMouse = new UnVec2(oProgram, "iMouse");
			oUiResolution = new UnVec2(oProgram, "iResolution");
			
			oUnType = new UnInt(oProgram, "nType");
			oUvPersp = new UnVec4(oProgram, "vPersp");

			GzShCommun_Light.fIniData(oProgram);
		}
		

		override public function fIniRender():Void {

			//Debug.fTrace("Total Face : "  + Context.oItf.nTotalFaces) ;
			oVbo.fIniData(Context.oItf.nTotalFaces, 4, 13);
		
			oAt.fIniData( );
			oAtTiles.fIniData();
			
			
		}
		
		
		override public function fUpdate():Void {
		
			oVbo.fSendData();

			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
		

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
			oUvPersp.vVal.nZ = Context.oItf.oPerspective.nValue;//nValue
			oUvPersp.vVal.nW = Context.oItf.oPerspective.nType; //nType
			oUvPersp.fSend();
			
			
			GzShCommun_Light.fSetEyePos();
			GzShCommun_Light.fSetAmbiant();
			
			
			oGpuBatch.fDraw();

			if(nTest  < 4){
				Debug.fTrace("------------------------------- " + nTest);
				Debug.fTrace("----Size ---- " + oVbo.aData.nSize);
				//for(var i : Int = 0; i  < oAtQuad.oVbo.aData.nSize; i+=4){
				//for(var i : Int = 0; i  < oVbo.aData.nSize; i+=8){
				for(var i : Int = 0; i  < 15 * Context.oItf.nTotalFaces; i+=Context.oItf.nTotalFaces){
					Debug.fTrace("[" +  oVbo.aData[i] + "," +  oVbo.aData[i+1] + "," +  oAt.oVbo.aData[i+2] + "," +  oAt.oVbo.aData[i+3] + "]" );
				}
				nTest++;
			}

		}
		
		
	}
}