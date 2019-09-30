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
		
		public var nTexId : Int = -1;
			
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Int{

		
			
			OpenGL.fActiveTexture(TEXTURE0);
			nTexId = OpenGL.fCreateTexture();
			OpenGL.fBindTexture(TEXTURE_2D, nTexId);
			
			OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nWidth+2,_nHeight+2, 0, BGRA, UNSIGNED_BYTE, _aImg);
			
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
	
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
			OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis 

			OpenGL.fBindTexture(TEXTURE_2D, null);
			
			if(nTexId != -1){
				Debug.fPass("Image Gpu Loaded: " + nTexId);
			}else{
				Debug.fError("Image Gpu Loaded: " + nTexId);
			}
			return nTexId;
			
		}
		
		public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		
		}
	}
}