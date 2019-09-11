package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.GpuObj.GpuBuffer;
	import GZ.Gfx.Buffer;
	import GZ.Gfx.Object;
	
	<cpp>
		#define GL_DEPTH_COMP_X GL_DEPTH_COMPONENT
		#ifdef GZ_tAndroid
			#undef GL_DEPTH_COMP_X
			#define GL_DEPTH_COMP_X GL_DEPTH_COMPONENT16
		#endif
	</cpp>
	
	
	

	
	public class OpGpuBuffer overplace GpuBuffer  {
		public var nTexId : Int;
		public var nIdBuff : Int;
	
	/*
    GZ::cBuffer* oBuffer;

    void fIniBatchArray();
    void fConstructBatchArray();
    int nTotalObj;
    int nCurrIndex;

    GZ::cShape* oShape;
    gzInt nNbPoints;
    gzUInt nTexId;
    gzUInt nAtlasId;
    gzUInt ;
    gzBool bAutoClear;
  //  gzUInt nTexWidth;
   // gzUInt nTexHeight;

    gzUInt nVAO;
*/

//public var nAtlasId : Int = -1;
	
		
		public function OpGpuBuffer(_oBuffer : Buffer, _bAutoClear: Bool = true ):Void {
			GpuBuffer(_oBuffer, _bAutoClear);
		}
		
		
		
		override public function fIni():Void{
			fCreate();
		}
		
		
		override public function fCreate():Void{
				
				OpenGL.fActiveTexture(TEXTURE1);
				
				//New Texture of buffer size
				OpenGL.fGenTextures(1, nTexId);
				OpenGL.fBindTexture(TEXTURE_2D, nTexId);
				OpenGL.fTexImage2D(TEXTURE_2D, 0, BGRA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, BGRA, UNSIGNED_BYTE, 0);
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis
				OpenGL.fBindTexture(TEXTURE_2D, 0);
				
				//FBO
				OpenGL.fGenFramebuffers(1, nIdBuff);
				OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
				
				//RENDERBUFFER
				var _nIdRbo : Int = 0;
				OpenGL.fGenRenderbuffers(1, _nIdRbo);
				OpenGL.fBindRenderbuffer(RENDERBUFFER, _nIdRbo);
				OpenGL.fRenderbufferStorage(RENDERBUFFER, DEPTH_COMPONENT,  oBuffer.nBuffWidth, oBuffer.nBuffHeight); //ES2 requie GL_DEPTH_COMPONENT16?
				OpenGL.fBindRenderbuffer(RENDERBUFFER, 0);
				
				//Attach the created texture to FBO color attachement point: nTexId = COLOR_ATTACHMENT0
				OpenGL.fFramebufferTexture2D(FRAMEBUFFER, COLOR_ATTACHMENT0, TEXTURE_2D, nTexId, 0);
			   // glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, nLastTexture, 0);

				// Attach a renderbuffer object the binded framebuffer object: _nIdRbo => nIdBuff
				OpenGL.fFramebufferRenderbuffer(FRAMEBUFFER, DEPTH_ATTACHMENT, RENDERBUFFER, _nIdRbo);

				
				//aTexCoord[0] = 0.0f;   aTexCoord[1] =  oBuffer->nBuffHeight;   aTexCoord[2] =  oBuffer->nBuffWidth;   aTexCoord[3] = oBuffer->nBuffHeight;
				//aTexCoord[4] = oBuffer->nBuffWidth;   aTexCoord[5] = 0.0f ;   aTexCoord[6] = 0.0f ;       aTexCoord[7] = 0.0f ;


				if(bAutoClear){
					//Clear
					OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
					OpenGL.fClearColor(1.0, 1.0, 1.0, 1.0);
					OpenGL.fClear(COLOR_BUFFER_BIT );
					//GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
					//GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind
				}


				OpenGL.fBindFramebuffer(FRAMEBUFFER, 0);
				
				
				
					
				/*
				/////////////////////////////////////////////////////////////////
				GL_fActiveTexture( GL_TEXTURE1 );

				//Create a texture fbo
				GL_fGenTextures(1, &nTexId);
				GL_fBindTexture(GL_TEXTURE_2D, nTexId);

				GL_fTexImage2D(GL_TEXTURE_2D, 0, GL_INTERNAL_FOMAT, oBuffer->nBuffWidth, oBuffer->nBuffHeight, 0, GL_TEXTURE_FOMAT, GL_UNSIGNED_BYTE, 0);

				GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER , GL_LINEAR);
				GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
				//GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER , GL_NEAREST);
				//GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

				GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT); // Repeat on X axis
				GL_fTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);  // Stretch on Y axis

				GL_fBindTexture(GL_TEXTURE_2D, 0);

				GL_fGenFramebuffers(1, &nIdBuff);
				GL_fBindFramebuffer(GL_FRAMEBUFFER, nIdBuff);

				gzUInt rboId = 0;
				GL_fGenRenderbuffers(1, &rboId);
				GL_fBindRenderbuffer(GL_RENDERBUFFER, rboId);
			  //  glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, nTexWidth, nTexHeight);
				GL_fRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMP_X,  oBuffer->nBuffWidth, oBuffer->nBuffHeight); //ES2 requie GL_DEPTH_COMPONENT16?

				GL_fBindRenderbuffer(GL_RENDERBUFFER, 0);

				// attach a texture to FBO color attachement point
				GL_fFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, nTexId, 0);
			   // glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, nLastTexture, 0);

				// attach a renderbuffer to depth attachment point
				GL_fFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, rboId);

				aTexCoord[0] = 0.0f;   aTexCoord[1] =  oBuffer->nBuffHeight;   aTexCoord[2] =  oBuffer->nBuffWidth;   aTexCoord[3] = oBuffer->nBuffHeight;
				aTexCoord[4] = oBuffer->nBuffWidth;   aTexCoord[5] = 0.0f ;   aTexCoord[6] = 0.0f ;       aTexCoord[7] = 0.0f ;


				if(!bAutoClear){
					//Clear
					GL_fBindFramebuffer(GL_FRAMEBUFFER, nIdBuff);
					GL_fClearColor(1.0, 1.0, 1.0, 1.0);
					GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
					GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind
				}


				GL_fBindFramebuffer(GL_FRAMEBUFFER, 0);
			*/
			
		}
		
		
		

		override public function fIniRender():Void{
		
		}
		override public function fFinishRender():Void{
		
		}
		
		override public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		}
		
		
	
		
	}
}