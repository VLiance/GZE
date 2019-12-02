package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gfx.Object;
	import GZ.Gpu.GpuObj.GpuRcImg;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.Base.Texture;
	
	public class OpGpuRcImg overplace GpuRcImg  {

	
		public function OpGpuRcImg( ):Void;
		
		public function fIni(_oInterface : Interface):Void;

		public function fIniRender():Void;
		public function fFinishRender():Void;
		
		public var oTexId : Val = null;
			
		public var oUvTexDimFetch : UnVec2;
		public var oUvTexDimNorm : UnVec2;
		
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture):Val{
		
			oGpuTexLayer = _oGpuTexLayer;
				
			if(_nWidth = 0 && _nHeight == 0){
				return null;
			}
			if(oGpuTexLayer == null){
				Debug.fError("Error, you must specify a Texture Layer to send Image on GPU");
				return null;
			}
			
			if(oGpuTexLayer.nSlot == 0){
				OpenGL.fActiveTexture(TEXTURE0);
			}
			if(oGpuTexLayer.nSlot == 1){
				OpenGL.fActiveTexture(TEXTURE1);
			}
			if(oGpuTexLayer.nSlot == 2){
				OpenGL.fActiveTexture(TEXTURE2);
			}
			
			
			/*
			if(oGpuTexLayer == null){ //TODO link text layer
				OpenGL.fActiveTexture(TEXTURE0);
			}else{
				OpenGL.fActiveTexture(TEXTURE1);
				Debug.fInfo("Enable TEXTURE1 !!!!!!!!");
			}*/
			
			
			oTexId = OpenGL.fCreateTexture();
			OpenGL.fBindTexture(TEXTURE_2D, oTexId);

	//WebGL 2.0		
	//Sized internal formats are supported in WebGL 2.0 and internalformat is no longer required to be the same as format. Instead, the combination of internalformat, format, and type must be listed in the following table:		
	//RGBA :	RGBA : UNSIGNED_BYTE/UNSIGNED_SHORT_4_4_4_4/UNSIGNED_SHORT_5_5_5_1

			
		<cpp>
		#ifdef GZ_D_CpuRenderer_Reverse_BlueAndRed
		</cpp>
			OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nWidth+2 ,_nHeight+2, 0, RGBA, UNSIGNED_BYTE, _aImg);
		<cpp>
		#else
		</cpp>
			OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nWidth+2 ,_nHeight+2, 0, BGRA, UNSIGNED_BYTE, _aImg);
		<cpp>
		#endif
		</cpp>
			
			
			
		if(oGpuTexLayer == null){
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
	
		}else{
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
		}	
			
	
	
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis 

	
			
		//	OpenGL.fBindTexture(TEXTURE_2D, null);  //Must keep bounded
			//TODO Texture must keep being bound to a texture unit ->
			
			if(oTexId != null){
				//Debug.fPass("Image Gpu Loaded: " + oTexId);
				Debug.fPass("Image Gpu Loaded [" + (_nWidth +2) + " x " +  (_nHeight+2) + "]" );

			//if(oGpuTexLayer != null){
				
				oGpuTexLayer.fSendSize(_nWidth+2, _nHeight+2);
				/*
				oUvTexDimNorm = new UnVec2(Attribute_Quad.oProgram, "vTexDimNorm");
				oUvTexDimNorm.vVal.nX = _nWidth+2;
				oUvTexDimNorm.vVal.nY = _nHeight+2;
				oUvTexDimNorm.fSend();
				*/
			//}
				/*
				oUvTexDimFetch = new UnVec2(Attribute_Quad.oProgram, "vTexDimFetch");
				oUvTexDimFetch.vVal.nX = _nWidth+2;
				oUvTexDimFetch.vVal.nY = _nHeight+2;
				oUvTexDimFetch.fSend();
				*/

			}else{
				Debug.fError("Image Gpu Loaded Failed");
			}

			return oTexId;
			
		}
		
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		
		}
	}
}