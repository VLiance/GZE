package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.GpuObj.GpuBuffer;
	import GZ.Gfx.Buffer;
	import GZ.Gfx.Object;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Base.PtA;
	import GZ.Base.Pod.Point;
	import GZ.Base.Pod.Rotation;
	import GZ.Base.Pod.Size;
	import GZ.Base.Pod.Color;
	import GZ.Base.Quaternion;
	import GZ.Base.Vec4;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.ProgramShader;

	<cpp>
		#define GL_DEPTH_COMP_X GL_DEPTH_COMPONENT
		#ifdef GZ_tAndroid
			#undef GL_DEPTH_COMP_X
			#define GL_DEPTH_COMP_X GL_DEPTH_COMPONENT16
		#endif
	</cpp>
	
	
	

	
	public class OpGpuBuffer overplace GpuBuffer  {
		public var oTexId : Val;
		public var nIdBuff : Val;
		public var nIdRender : Val;
		
		public var oAt : Attribute_Quad;
		
		public var oTexture : Texture;
	
	/*
    GZ::cBuffer* oBuffer;

    void fIniBatchArray();
    void fConstructBatchArray();
    int nTotalObj;
    int nCurrIndex;

    GZ::cShape* oShape;
    gzInt nNbPoints;
    gzUInt oTexId;
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
		
		
		
		override public function fIni(_oProgram : ProgramShader):Void{
			oProgram = _oProgram;
			fCreate();
			
		}
		
	
		
		public function fCreate():Void{
				//return;
				
				bAutoClear = true;

		//FBO
				nIdBuff = OpenGL.fCreateFramebuffer();
				OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
				
				
				
				oTexture = new Texture(oProgram, "ID_FBO");
				OpenGL.fActiveTexture(TEXTURE0 + oTexture.nSlot);

				
				oTexId = OpenGL.fCreateTexture();
				OpenGL.fBindTexture(TEXTURE_2D, oTexId);
				
			
			
	//WebGL 2.0		
	//Sized internal formats are supported in WebGL 2.0 and internalformat is no longer required to be the same as format. Instead, the combination of internalformat, format, and type must be listed in the following table:		
	//RGBA :	RGBA : UNSIGNED_BYTE/UNSIGNED_SHORT_4_4_4_4/UNSIGNED_SHORT_5_5_5_1

				//OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, BGRA, UNSIGNED_BYTE, 0);
				//OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, RGBA, UNSIGNED_BYTE, 0);
				OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, BGRA, UNSIGNED_BYTE, 0);

				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
		
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
				OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis 
			//	OpenGL.fBindTexture(TEXTURE_2D, null);
				
				
			
		
				//Attach the created texture to FBO color attachement point: oTexId = COLOR_ATTACHMENT0
				OpenGL.fFramebufferTexture2D(FRAMEBUFFER, COLOR_ATTACHMENT0  + oTexture.nSlot, TEXTURE_2D, oTexId, 0);
			   // glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, nLastTexture, 0);
				
				
				
				
				//RENDERBUFFER
				nIdRender = OpenGL.fCreateRenderBuffer();
				OpenGL.fBindRenderbuffer(RENDERBUFFER, nIdRender);
				OpenGL.fRenderbufferStorage(RENDERBUFFER, DEPTH_COMPONENT,  oBuffer.nBuffWidth, oBuffer.nBuffHeight); //ES2 requie GL_DEPTH_COMPONENT16?
				
				OpenGL.fBindRenderbuffer(RENDERBUFFER, 0);
				
				// Attach a renderbuffer object the binded framebuffer object: _nIdRbo => nIdBuff
				OpenGL.fFramebufferRenderbuffer(FRAMEBUFFER, DEPTH_ATTACHMENT, RENDERBUFFER, nIdRender);
				
				
				
		
				//if(status != GL_FRAMEBUFFER_COMPLETE)

							
				
				//aTexCoord[0] = 0.0f;   aTexCoord[1] =  oBuffer->nBuffHeight;   aTexCoord[2] =  oBuffer->nBuffWidth;   aTexCoord[3] = oBuffer->nBuffHeight;
				//aTexCoord[4] = oBuffer->nBuffWidth;   aTexCoord[5] = 0.0f ;   aTexCoord[6] = 0.0f ;       aTexCoord[7] = 0.0f ;

				if(bAutoClear){
					//Clear
					OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
					OpenGL.fClearColor(0.5, 1.0, 0.5, 0.5);
					OpenGL.fClear(COLOR_BUFFER_BIT );
					//GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
					//GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind
				}

				
				fGetStatus();
				
				OpenGL.fBindFramebuffer(FRAMEBUFFER, null);
	
	
			//	Debug.fPass("FBO Created|" + nIdBuff + "|Slot:" + oTexture.nSlot + "| [" + (oBuffer.nBuffWidth) + " x " +  (oBuffer.nBuffHeight) + "]" );
				Debug.fPass("FBO Created|"  + "|Slot:" + oTexture.nSlot + "| [" + (oBuffer.nBuffWidth) + " x " +  (oBuffer.nBuffHeight) + "]" );

				/*
				/////////////////////////////////////////////////////////////////
				GL_fActiveTexture( GL_TEXTURE1 );

				//Create a texture fbo
				GL_fGenTextures(1, &oTexId);
				GL_fBindTexture(GL_TEXTURE_2D, oTexId);

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
				GL_fFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, oTexId, 0);
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

		
				GL_fBindFramebuffer(GL_FRAMEBUFFER, null);
			*/
			
		}
		
		override public function fBind():Void{
			OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
		}	
		
		
		public function fGetStatus():UInt{
			var _nStatus : UInt = OpenGL.fCheckFramebufferStatus(FRAMEBUFFER);
			
			if(_nStatus == OpenGL.eFrameBufferStatus.FRAMEBUFFER_COMPLETE){
				return _nStatus;
			}
			if(_nStatus == OpenGL.eFrameBufferStatus.INCOMPLETE_ATTACHMENT){
				Debug.fError("FBO Error: INCOMPLETE_ATTACHMENT");
			}else if(_nStatus == OpenGL.eFrameBufferStatus.INCOMPLETE_MISSING_ATTACHMENT){
				Debug.fError("FBO Error: INCOMPLETE_MISSING_ATTACHMENT");
			}else if(_nStatus == OpenGL.eFrameBufferStatus.INCOMPLETE_DIMENSIONS){
				Debug.fError("FBO Error: INCOMPLETE_DIMENSIONS");
			}else if(_nStatus == OpenGL.eFrameBufferStatus.UNSUPPORTED){
				Debug.fError("FBO Error: UNSUPPORTED");
			}else if(_nStatus == OpenGL.eFrameBufferStatus.INCOMPLETE_MULTISAMPLE){
				Debug.fError("FBO Error: INCOMPLETE_MULTISAMPLE");
			}else if(_nStatus == OpenGL.eFrameBufferStatus.RENDERBUFFER_SAMPLES){
				Debug.fError("FBO Error: RENDERBUFFER_SAMPLES");
			}
			Debug.fError("FBO Error: " + _nStatus);
			
			return _nStatus;
		}
		
		
		
		
		
		
		
		

		override public function fIniRender():Void{
		
		}
		override public function fFinishRender():Void{
		
		}
		
		
		override public function fToDefaultFrameBuffer():Void {
		
			
			
			var _vPt : Vec4<Float> ;
			oAt = Attribute_Quad;
			oAt.oVbo.fIniData(1,4,13);
			oAt.fSetIndex(0);
				
				
			var _vPos  : Point<Float> = new Point<Float>(0,0,0);
			var _vSize  : Size<Float> = new Size<Float>(1,1,1);
			var _vQuaternion : Quaternion<Float> = new Quaternion<Float>();
			_vQuaternion.fReset();
			
			
			oAt.oAtObjPos.fSet(_vPos);
			oAt.oAtObjSize.fSet(_vSize);
			oAt.oAtObjRot.fSet(_vQuaternion);
			
			var _nWidth : Float = 800;
			var _nHeight : Float = 600;
			
			_vPt = new Vec4<Float>(0,0,0,0);
			oAt.oAtPt1.fSet(_vPt);
			
			_vPt = new Vec4<Float>(_nWidth,0,0,0);
			oAt.oAtPt2.fSet(_vPt);
			
			_vPt = new Vec4<Float>(_nWidth,_nHeight,0,0);
			oAt.oAtPt3.fSet(_vPt);
			
			_vPt = new Vec4<Float>(0,_nHeight,0,0);
			oAt.oAtPt4.fSet(_vPt);
			
			
			_vPt = new Vec4<Float>(0.5,0.5,0.5,0.5);
			oAt.oAtColor1.fSet(_vPt);

			
			var _nType : Float = 3;
			var _nSlot : Float = 3;
			oAt.oAtObjPos.fSetVal(3, _nType); //Merge pos and type to save space
			oAt.oAtObjSize.fSetVal(3, _nSlot); //Texture location
	
			oAt.oVbo.fSendData();
			
			
			
			
			
			////// ASSSS ////////
			OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
			OpenGL.fClearColor(0.5, 1.0, 0.5, 0.5);
			OpenGL.fClear(COLOR_BUFFER_BIT );

			OpenGL.fDisable( BLEND );
			OpenGL.fDisable( DEPTH_TEST );
			/////////////////////////////////
			
			
			OpenGL.fBindFramebuffer(FRAMEBUFFER, null); //Default
			OpenGL.fDisable( BLEND );
			OpenGL.fDisable( DEPTH_TEST );
			
			OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, 0, 1);
			
			
		}
		
		override public function fDraw( _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
			
			/*
			
			
			  GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind

       cSysGpuBuffer* _oBuff = ( cSysGpuBuffer*)oObj;
    // nTest =  oBuffer->oPerspective->nFromX;

        GL_fUniform4f( oGzSh->nLocPersp, _oBuff->oBuffer->oPerspective->nFromX, _oBuff->oBuffer->oPerspective->nFromY, _oBuff->oBuffer->oPerspective->nValue,  _oBuff->oBuffer->oPerspective->nType);
        GL_fUniform3fv( oGzSh->nLocArrPt,  4, _oBuff->aPoints);
        GL_fUniform2fv( oGzSh->nLocArrSrc, 4, _oBuff->aTexCoord);

        GL_fBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA); //Back to front
        // glBlendFunc(GL_ONE_MINUS_DST_ALPHA, GL_ONE); //Front to back


        ///////////////////////////////////////////

        if(_oBuff->nTexId){
            GL_fActiveTexture( GL_TEXTURE0 );
            GL_fBindTexture(GL_TEXTURE_2D, _oBuff->nTexId);
            GL_fUniform2f(oGzSh->nLocTexDim, _oBuff->oBuffer->nBuffWidth, _oBuff->oBuffer->nBuffHeight);
        }

        GL_fUniform1i(oGzSh->nLocType, 2);

       //Draw
        GL_fDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_BYTE, _aIndice2Tri);

        if(_oBuff->bAutoClear){
            //Clear
            GL_fBindFramebuffer(GL_FRAMEBUFFER, _oBuff->nIdBuff);
            GL_fClearColor(0.0, 0.0, 0.0, 0.0);
            GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind
        }

		
		*/
			
			
		}
		
		
	
		
	}
}