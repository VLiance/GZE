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
		
		
		override function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int, _oGpuTexLayer : Texture, _hPixFormat : ePixFormat, _bBorder : Bool = true):Val{
		
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


//Lib_GzOpenGL::OpenGL::eTargetTexture::TEXTURE_2D
//Lib_GzOpenGL::OpenGL::ePixelFormat::RGBA
	
		// Lib_GZ::Gpu::GpuObj::GpuRcImg::ePixFormat _hPixFormat
		//ePixelType
		
		var _aFormat : CArray<UInt, 1>;
		
<cpp>
using namespace Lib_GZ::Gpu::GpuObj;
using namespace Lib_GzOpenGL;
//Please refer to:  GpuRcImg.cw
/*
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
R8UI 							;
RG8UI 							;
RGB8UI 							;
RGBA8UI 						;
RG16UI							;
RG32UI 							;
*/
//TODO
//	//https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/renderbufferStorage
	
static gzUInt32 _aCompFormat[][4] =  
{ 	
{GpuRcImg::ePixFormat::Default, 		OpenGL::eInternalPixelFormat::RGBA8,  			OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R8, 				OpenGL::eInternalPixelFormat::R8,  				OpenGL::ePixelFormat::RED, 			OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RG8, 			OpenGL::eInternalPixelFormat::RG8,  			OpenGL::ePixelFormat::RG, 			OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGB8, 			OpenGL::eInternalPixelFormat::RGB8,  			OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGBA8, 			OpenGL::eInternalPixelFormat::RGBA8,  			OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::SRGB8, 			OpenGL::eInternalPixelFormat::SRGB8,  			OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGB565, 			OpenGL::eInternalPixelFormat::RGB565,  			OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::SRGB8_APLHA8,	OpenGL::eInternalPixelFormat::SRGB8_APLHA8,  	OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGB5_A1, 		OpenGL::eInternalPixelFormat::RGB5_A1,  		OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGB10_A2, 		OpenGL::eInternalPixelFormat::RGB10_A2,  		OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGBA4, 			OpenGL::eInternalPixelFormat::RGBA4,  			OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R16F, 			OpenGL::eInternalPixelFormat::R16F,  			OpenGL::ePixelFormat::RED, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::R32F, 			OpenGL::eInternalPixelFormat::R32F,  			OpenGL::ePixelFormat::RED, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RG16F, 			OpenGL::eInternalPixelFormat::RG16F,  			OpenGL::ePixelFormat::RG, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RG32F, 			OpenGL::eInternalPixelFormat::RG32F,  			OpenGL::ePixelFormat::RG, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::R11F_G11F_B10F, 	OpenGL::eInternalPixelFormat::R11F_G11F_B10F,  	OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RGB9_E5, 		OpenGL::eInternalPixelFormat::RGB9_E5,  		OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RGB16F, 			OpenGL::eInternalPixelFormat::RGB16F,  			OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RGB32F, 			OpenGL::eInternalPixelFormat::RGB32F,  			OpenGL::ePixelFormat::RGB, 			OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RGBA16F, 		OpenGL::eInternalPixelFormat::RGBA16F,  		OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::RGBA32F, 		OpenGL::eInternalPixelFormat::RGBA32F,  		OpenGL::ePixelFormat::RGBA, 		OpenGL::ePixelType::FLOAT},
{GpuRcImg::ePixFormat::R8I, 			OpenGL::eInternalPixelFormat::R8I,  			OpenGL::ePixelFormat::RED_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R8UI, 			OpenGL::eInternalPixelFormat::R8UI,  			OpenGL::ePixelFormat::RED_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RG8UI, 			OpenGL::eInternalPixelFormat::RG8UI,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGB8UI, 			OpenGL::eInternalPixelFormat::RGB8UI,  			OpenGL::ePixelFormat::RGB_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RGBA8UI, 		OpenGL::eInternalPixelFormat::RGBA8UI,  		OpenGL::ePixelFormat::RGBA_INTEGER, OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R16I, 			OpenGL::eInternalPixelFormat::R16I,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R16UI, 			OpenGL::eInternalPixelFormat::R16UI,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RG16UI, 			OpenGL::eInternalPixelFormat::RG16UI,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R32I, 			OpenGL::eInternalPixelFormat::R32I,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::R32UI, 			OpenGL::eInternalPixelFormat::R32UI,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},
{GpuRcImg::ePixFormat::RG32UI, 			OpenGL::eInternalPixelFormat::RG32UI,  			OpenGL::ePixelFormat::RG_INTEGER, 	OpenGL::ePixelType::UNSIGNED_BYTE},

};
_aFormat = (gzUInt32*)_aCompFormat;
</cpp>



			
			
		var _nBWidth : UInt =   _nWidth;
		var _nBHeight : UInt =   _nWidth;
		if(_bBorder){
			_nBWidth+=2;
			_nBHeight+=2;
		}
		

		if(_hPixFormat == ePixFormat.Default){
			<cpp>
			#ifdef GZ_D_CpuRenderer_Reverse_BlueAndRed
			</cpp>
				OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nBWidth ,_nBHeight, 0, RGBA, UNSIGNED_BYTE, _aImg);
			<cpp>
			#else
			</cpp>
				OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, _nBWidth ,_nBHeight, 0, BGRA, UNSIGNED_BYTE, _aImg);
			<cpp>
			#endif
			</cpp>
		}else{
			<cpp>
			
			printf("\nTest: %d\n", _hPixFormat);
			</cpp>
			var _nIdx : UInt = (_hPixFormat- 1) * 4 ;
			Debug.fInfo("_nIdx:  " + _nIdx);
			if(_aFormat[_nIdx] != _hPixFormat){
				Debug.fError("Format does not mach!");
				return null;
			}
			Debug.fInfo("111:  "  + _aFormat[_nIdx + 1]);
			Debug.fInfo("222:  "  + _aFormat[_nIdx + 2]);
			Debug.fInfo("333:  "  + _aFormat[_nIdx + 3]);
			OpenGL.fTexImage2D(TEXTURE_2D, 0, _aFormat[_nIdx + 1], _nBWidth ,_nBHeight, 0, _aFormat[_nIdx + 2], _aFormat[_nIdx + 3], _aImg);
			Debug.fInfo("bbbb:  " );
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