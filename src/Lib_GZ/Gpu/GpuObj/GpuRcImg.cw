package  { 

	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.Base.Texture;
		
	public overclass GpuRcImg  {
	
	
		public enum eImgFormat : Int {	//Follow OGL spec Default = RGBA
			Default 					    = 0x1908;
			RGB                             = 0x1907;
			RGBA                            = 0x1908;
			R8						  	    = 0x8229;
			RG8 							= 0x822B;
			RGB8 							= 0x8051;
			R16F						    = 0x822E;
			R32F						    = 0x8230;
			RG16F							= 0x822F;
			RG32F 							= 0x8230;
			R8UI 							= 0x8232;
			RG8UI 							= 0x8238;
			RGB8UI 							= 0x8D7D;
			RGBA8UI 						= 0x8D7C;
			RG16UI							= 0x823A;
			RG32UI 							= 0x823C;
			SRGB8 							= 0x8C41;
			RGB565 							= 0x8D62;
			R11F_G11F_B10F 					= 0x8C3A;
			RGB9_E5 						= 0x8C3D;
			RGB16F 							= 0x881B;
			RGB32F 							= 0x8815;
			RGBA8 							= 0x8058;
			SRGB8_APLHA8 					= 0x8C43;
			RGB5_A1 						= 0x8057;
			RGB10_A2 						= 0x8059;
			RGBA4 							= 0x8056;
			RGBA16F 						= 0x881A;
			RGBA32F 						= 0x8814;
		}
		
		
		


		public var oGpuTexLayer : Texture;
	
		public function GpuRcImg( ):Void;

		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture, _hInternalFormat : eImgFormat, _hFormat : eImgFormat, _bBorder : Bool = true):Val;

	}
}