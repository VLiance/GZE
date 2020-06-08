package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.Base.Texture;
		
	public overclass GpuRcImg  {
	
	//Refer to "Lib_GzOpenGL\GpuObj\OpGpuRcImg.cw"
	//https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/renderbufferStorage
		public enum ePixFormat : Int {
		
			Default                         ;
			R8						  	    ;
			RG8 							;
			RGB8 							;
			RGBA8                           ;
			SRGB8 							;
			RGB565 							;
			SRGB8_APLHA8 					;
			RGB5_A1 						;
			RGB10_A2 						;
			RGBA4 							;
			R16F						    ;
			R32F						    ;
			RG16F							;
			RG32F 							;
			R11F_G11F_B10F 					;
			RGB9_E5 						;
			RGB16F 							;
			RGB32F 							;
			RGBA16F 						;
			RGBA32F 						;
			R8I 							;
			R8UI 							;
			RG8UI 							;
			RGB8UI 							;
			RGBA8UI 						;
			R16I							;
			R16UI							;
			RG16UI							;
			R32I 							;
			R32UI 							;
			RG32UI 							;
		}
		
		
		


		public var oGpuTexLayer : Texture;
	
		public function GpuRcImg( ):Void;

		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture, _hInternalFormat : ePixFormat, _bBorder : Bool = true):Val;

	}
}