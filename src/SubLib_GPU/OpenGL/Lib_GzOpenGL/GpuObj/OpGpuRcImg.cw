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
		
//
///Most languages don't have built-in types for half-floats. So you either will have to write a few lines of code to do the conversion from float to half-float, or use code that somebody else wrote

//InternalFormat	Format			Type  
//////////////////////////////////////////////////////////////////////////////////
// RGB8				RGB				[UNSIGNED_BYTE]
// SRGB8			RGB				[UNSIGNED_BYTE]
// RGB				RGB				[UNSIGNED_BYTE, UNSIGNED_SHORT_5_6_5]	 						 //UNSIGNED_BYTE = RGB8
//////////////////////////////////////////////////////////////////////////////////
// RGBA8			RGBA			[UNSIGNED_BYTE]				
// RGBA				RGBA			[UNSIGNED_BYTE, UNSIGNED_SHORT_4_4_4_4, UNSIGNED_SHORT_5_5_5_1]	 //UNSIGNED_BYTE = RGBA8
//////////////////////////////////////////////////////////////////////////////////
// LUMINANCE_ALPHA	LUMINANCE_ALPHA	[UNSIGNED_BYTE]				//Not used
// LUMINANCE		LUMINANCE		[UNSIGNED_BYTE]				//Not used
//////////////////////////////////////////////////////////////////////////////////
// ALPHA			ALPHA			[UNSIGNED_BYTE]
// R8				RED				[UNSIGNED_BYTE]
// RG8				RG				[UNSIGNED_BYTE]
//////////////////////////////////////////////////////////////////////////////////
// R16F				RED				[HALF_FLOAT, FLOAT]
// R32F				RED				[FLOAT]
// RG16F			RG				[HALF_FLOAT, FLOAT]	
// RG32F			RG				[FLOAT]
// RGB16F			RGB				[HALF_FLOAT, FLOAT]
// RGB32F			RGB				[FLOAT]
// RGB9_E5			RGB				[HALF_FLOAT, FLOAT]
// RGBA16F			RGBA			[HALF_FLOAT, FLOAT]
// RGBA32F			RGBA			[FLOAT]
// R11F_G11F_B10F	RGB				[UNSIGNED_INT_10F_11F_11F_REV, HALF_FLOAT, FLOAT]
//////////////////////////////////////////////////////////////////////////////////
// RGB565			RGB				[UNSIGNED_BYTE, UNSIGNED_SHORT_5_6_5]
// SRGB8_ALPHA8		RGBA			[UNSIGNED_BYTE]
// RGB5_A1			RGBA			[UNSIGNED_BYTE, UNSIGNED_SHORT_5_5_5_1]
// RGB10_A2			RGBA			[UNSIGNED_INT_2_10_10_10_REV]
// RGBA4			RGBA			[UNSIGNED_BYTE, UNSIGNED_SHORT_4_4_4_4]
//////////////////////////////////////////////////////////////////////////////////
// R8UI				RED_INTEGER		[UNSIGNED_BYTE]
// RG8UI			RG_INTEGER		[UNSIGNED_BYTE]
// RGB8UI			RGB_INTEGER		[UNSIGNED_BYTE]
// RGBA8UI			RGBA_INTEGER	[UNSIGNED_BYTE]
// RG16UI			RG_INTEGER		[UNSIGNED_BYTE] //Added from original table
// RG32UI			RG_INTEGER		[UNSIGNED_BYTE] //Added from original table
//////////////////////////////////////////////////////////////////////////////////


/*

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

*/

//Lib_GzOpenGL::OpenGL::eTargetTexture::TEXTURE_2D





			
			
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