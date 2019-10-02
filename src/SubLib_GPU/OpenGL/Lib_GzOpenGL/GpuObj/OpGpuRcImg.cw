package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	
	import GZ.Gfx.Object;
	import GZ.Gpu.GpuObj.GpuRcImg;
	import GZ.Sys.Interface.Interface;
	
	public class OpGpuRcImg overplace GpuRcImg  {

	
		public function OpGpuRcImg( ):Void;
		
		public function fIni(_oInterface : Interface):Void;

		public function fIniRender():Void;
		public function fFinishRender():Void;
		
		public var oTexId : Val = null;
			
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Val{

		
			OpenGL.fActiveTexture(TEXTURE0);
			oTexId = OpenGL.fCreateTexture();
			OpenGL.fBindTexture(TEXTURE_2D, oTexId);

	//WebGL 2.0		
	//Sized internal formats are supported in WebGL 2.0 and internalformat is no longer required to be the same as format. Instead, the combination of internalformat, format, and type must be listed in the following table:		
	//RGBA :	RGBA : UNSIGNED_BYTE/UNSIGNED_SHORT_4_4_4_4/UNSIGNED_SHORT_5_5_5_1

			OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nWidth+2,_nHeight+2, 0, RGBA, UNSIGNED_BYTE, _aImg);
			
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
	
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis 

			OpenGL.fBindTexture(TEXTURE_2D, null);
			
			if(oTexId != null){
				//Debug.fPass("Image Gpu Loaded: " + oTexId);
				Debug.fPass("Image Gpu Loaded" );
			}else{
				Debug.fError("Image Gpu Loaded Failed");
			}
			return oTexId;
			
		}
		
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		
		}
	}
}