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
		
		
		override function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture, _hInternalFormat : eImgFormat, _hFormat : eImgFormat, _bBorder : Bool = true):Val{
		
			oGpuTexLayer = _oGpuTexLayer;
				
			if(_nWidth = 0 && _nHeight == 0){
				return null;
			}
			if(oGpuTexLayer == null){
				Debug.fError("Error, you must specify a Texture Layer to send Image on GPU");
				return null;
			}
			
			OpenGL.fActiveTexture(TEXTURE0 + oGpuTexLayer.nSlot);
			
			oTexId = OpenGL.fCreateTexture();
			OpenGL.fBindTexture(TEXTURE_2D, oTexId);

	//WebGL 2.0		
	//Sized internal formats are supported in WebGL 2.0 and internalformat is no longer required to be the same as format. Instead, the combination of internalformat, format, and type must be listed in the following table:		
	//RGBA :	RGBA : UNSIGNED_BYTE/UNSIGNED_SHORT_4_4_4_4/UNSIGNED_SHORT_5_5_5_1
	
		//https://developer.mozilla.org/fr/docs/Web/API/WebGLRenderingContext/texImage2D
		
			
		var _nBWidth : UInt =   _nWidth;
		var _nBHeight : UInt =   _nWidth;
		if(_bBorder){
			_nBWidth+=2;
			_nBHeight+=2;
		}
		

		if(_hFormat == eImgFormat.Default){
			<cpp>
			#ifdef GZ_D_CpuRenderer_Reverse_BlueAndRed
			</cpp>
				OpenGL.fTexImage2D(TEXTURE_2D, 0, _hInternalFormat, _nBWidth ,_nBHeight, 0, RGBA, UNSIGNED_BYTE, _aImg);
			<cpp>
			#else
			</cpp>
				OpenGL.fTexImage2D(TEXTURE_2D, 0, _hInternalFormat, _nBWidth ,_nBHeight, 0, BGRA, UNSIGNED_BYTE, _aImg);
			<cpp>
			#endif
			</cpp>
		}else{
			OpenGL.fTexImage2D(TEXTURE_2D, 0, _hInternalFormat, _nBWidth ,_nBHeight, 0, _hFormat, UNSIGNED_BYTE, _aImg);
		}
		
		
			
		if(oGpuTexLayer == null){
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
	
		}else{
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
		}	
			
	
	
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT); // Repeat on Y axis 

	
			
		//	OpenGL.fBindTexture(TEXTURE_2D, null);  //Must keep bounded
			//TODO Texture must keep being bound to a texture unit ->
			
			if(oTexId != null){
				//Debug.fPass("Image Gpu Loaded: " + oTexId);
				Debug.fPass("Image Gpu Loaded |" + oGpuTexLayer.nSlot + "| [" + (_nBWidth) + " x " +  (_nBHeight) + "]" );

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