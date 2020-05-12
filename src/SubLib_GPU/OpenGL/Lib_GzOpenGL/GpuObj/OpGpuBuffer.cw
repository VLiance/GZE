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
		public var nTest : Float;
	
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


				oTexture = new Texture(oProgram, "ID_FBO");
				
				//OpenGL.fDisable(TEXTURE_2D); //"Feedback loop formed between Framebuffer and active Texture"
				
				oTexId = OpenGL.fCreateTexture();
				fEnableTexture();
				///OpenGL.fActiveTexture(TEXTURE0 + oTexture.nSlot);
				///OpenGL.fBindTexture(TEXTURE_2D, oTexId);
				
				if(oTexId == null){
					Debug.fError("FBO creation Texture is null");
					return;
				}
				
				oTexture.fSendSize( oBuffer.nBuffWidth, oBuffer.nBuffHeight);
			
			
			// -- WebGL1 Doc --
			//The following combinations of framebuffer object attachments, when all of the attachments are framebuffer attachment complete, non-zero, and have the same width and height, must result in the framebuffer being framebuffer complete
			//COLOR_ATTACHMENT0 = RGBA/UNSIGNED_BYTE texture
			//COLOR_ATTACHMENT0 = RGBA/UNSIGNED_BYTE texture + DEPTH_ATTACHMENT = DEPTH_COMPONENT16 renderbuffer
			//COLOR_ATTACHMENT0 = RGBA/UNSIGNED_BYTE texture + DEPTH_STENCIL_ATTACHMENT = DEPTH_STENCIL renderbuffer
			
			//WebGL2:
			//https://webgl2fundamentals.org/webgl/lessons/webgl-data-textures.html

			//Sized internal formats are supported in WebGL 2.0 and internalformat is no longer required to be the same as format. Instead, the combination of internalformat, format, and type must be listed in the following table:		
			//RGBA :	RGBA : UNSIGNED_BYTE/UNSIGNED_SHORT_4_4_4_4/UNSIGNED_SHORT_5_5_5_1

			
		
					//OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, BGRA, UNSIGNED_BYTE, 0);
					//OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, RGBA, UNSIGNED_BYTE, 0);
					OpenGL.fTexImage2D(TEXTURE_2D, 0, RGBA, oBuffer.nBuffWidth, oBuffer.nBuffHeight, 0, RGBA, UNSIGNED_BYTE, null); //No BGRA in WebGL
				/*
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.LINEAR);
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.LINEAR);
			
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.REPEAT); // Repeat on X axis
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.REPEAT);  // Stretch on Y axis 
				*/	
						
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER , OpenGL.eTextureMagFilter.NEAREST);
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER , OpenGL.eTextureMinFilter.NEAREST);
			
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_S, OpenGL.eTextureWrapMode.CLAMP_TO_EDGE); 
					OpenGL.fTexParameteri(TEXTURE_2D, TEXTURE_WRAP_T, OpenGL.eTextureWrapMode.CLAMP_TO_EDGE);  
					
					
					//OpenGL.fBindTexture(TEXTURE_2D, null);
			//	}
			
				
				nIdBuff = OpenGL.fCreateFramebuffer();
				OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
				
				OpenGL.fFramebufferTexture2D(FRAMEBUFFER, COLOR_ATTACHMENT0, TEXTURE_2D, oTexId, 0);  //COLOR_ATTACHMENT0 is the output
			   // glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, nLastTexture, 0);
	
				// Set the list of draw buffers.
			//GLenum DrawBuffers[1] = {GL_COLOR_ATTACHMENT0};
			//glDrawBuffers(1, DrawBuffers); // "1" is the size of DrawBuffers
				
				/*
				var _aBuffer : Array<UInt32>;
				_aBuffer.fPush(OpenGL.eAttachments.COLOR_ATTACHMENT0);
				OpenGL.fDrawBuffers(1, _aBuffer);
				*/
				
				/*
				nIdRender = OpenGL.fCreateRenderBuffer();
				OpenGL.fBindRenderbuffer(RENDERBUFFER, nIdRender);
				OpenGL.fRenderbufferStorage(RENDERBUFFER, DEPTH_COMPONENT,  oBuffer.nBuffWidth, oBuffer.nBuffHeight); //ES2 requie GL_DEPTH_COMPONENT16?
				//OpenGL.fBindRenderbuffer(RENDERBUFFER, 0);
							
				// Attach a renderbuffer object the binded framebuffer object: _nIdRbo => nIdBuff
				OpenGL.fFramebufferRenderbuffer(FRAMEBUFFER, DEPTH_ATTACHMENT, RENDERBUFFER, nIdRender);
				*/
				
				
				//Attach the created texture to FBO color attachement point: oTexId = COLOR_ATTACHMENT0
			//	OpenGL.fFramebufferTexture2D(FRAMEBUFFER, COLOR_ATTACHMENT0  + oTexture.nSlot, TEXTURE_2D, oTexId, 0);
			//Must be one of the following symbolic constants: GL_COLOR_ATTACHMENT0, GL_DEPTH_ATTACHMENT, or GL_STENCIL_ATTACHMENT.
			
				
		
				//if(status != GL_FRAMEBUFFER_COMPLETE)

							
				
				//aTexCoord[0] = 0.0f;   aTexCoord[1] =  oBuffer->nBuffHeight;   aTexCoord[2] =  oBuffer->nBuffWidth;   aTexCoord[3] = oBuffer->nBuffHeight;
				//aTexCoord[4] = oBuffer->nBuffWidth;   aTexCoord[5] = 0.0f ;   aTexCoord[6] = 0.0f ;       aTexCoord[7] = 0.0f ;

				if(bAutoClear){
					//Clear
					OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
					OpenGL.fClearColor(0.5, 1.0, 0.5, 1.0);
					OpenGL.fClear(COLOR_BUFFER_BIT );
					//GL_fClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
					//GL_fBindFramebuffer(GL_FRAMEBUFFER, 0); // unbind
				}

				
				fGetStatus();
				//OpenGL.fBindTexture(TEXTURE_2D, null);
				OpenGL.fBindFramebuffer(FRAMEBUFFER, null);
				fDisableTexture();
				
			//	Debug.fPass("FBO Created|" + nIdBuff + "|Slot:" + oTexture.nSlot + "| [" + (oBuffer.nBuffWidth) + " x " +  (oBuffer.nBuffHeight) + "]" );
				Debug.fPass("FBO Created|"  + "|Slot:" + oTexture.nSlot + "| [" + (oBuffer.nBuffWidth) + " x " +  (oBuffer.nBuffHeight) + "]" );

			
		}
		
		override public function fBind():Void{
			OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
		}	
		
		
		public function fGetStatus():UInt{
			var _nStatus : UInt = OpenGL.fCheckFramebufferStatus(FRAMEBUFFER);
			
			if(_nStatus == OpenGL.eFrameBufferStatus.FRAMEBUFFER_COMPLETE){
				Debug.fPass("FBO Status: FRAMEBUFFER_COMPLETE");
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
		
				
	//	OpenGL.fBindTexture(TEXTURE_2D, 1);
	//	OpenGL.fBindTexture(TEXTURE_2D, 2);
	//	OpenGL.fBindTexture(TEXTURE_2D, 3);
		
		
			
			var _vPt : Vec4<Float> ;
			oAt = Attribute_Quad;
			oAt.oVbo.fIniData(1,4,13);
			oAt.fSetIndex(0);
				
				
			var _vPos  : Point<Float> = new Point<Float>(0,600,0);
			var _vSize  : Size<Float> = new Size<Float>(1,-1,1);
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
			
			nTest+= 0.01;
			
			
			_vPt = new Vec4<Float>(nTest,0.5,0.5,0.5);
			oAt.oAtColor1.fSet(_vPt);

			
			var _nType : Float = 3;
			var _nSlot : Float = oTexture.nSlot;
			//var _nSlot : Float = 3;
			
			oAt.oAtObjPos.fSetVal(3, _nType); //Merge pos and type to save space
			oAt.oAtObjSize.fSetVal(3, _nSlot); //Texture location
			
			
		oAt.oAtTexSource0.fSetVal(0, 0);
		oAt.oAtTexSource0.fSetVal(1, 0);
		oAt.oAtTexSource0.fSetVal(2, 800);
		oAt.oAtTexSource0.fSetVal(3, 0);
		
		oAt.oAtTexSource1.fSetVal(0, 800);
		oAt.oAtTexSource1.fSetVal(1, 600);
		oAt.oAtTexSource1.fSetVal(2, 0);
		oAt.oAtTexSource1.fSetVal(3, 600);

	
			oAt.oVbo.fSendData();
			
			
			/*
			////// ASSSS ////////
			OpenGL.fBindFramebuffer(FRAMEBUFFER, nIdBuff);
			OpenGL.fClearColor(1.0, 0.0, 0.5, 0.5);
			OpenGL.fClear(COLOR_BUFFER_BIT );

			OpenGL.fDisable( BLEND );
			OpenGL.fDisable( DEPTH_TEST );
			/////////////////////////////////
			*/
			
			
			OpenGL.fBindFramebuffer(FRAMEBUFFER, null); //Default
			
			fEnableTexture();
			
			OpenGL.fDisable( BLEND );
			
			
				//var _aBuffer : Array<UInt32>;
				//_aBuffer.fPush(OpenGL.eAttachments.COLOR_ATTACHMENT0);
				//OpenGL.fDrawBuffers(1, _aBuffer);
				
			OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, 0, 1);
			
			//Disable Texture with buffer may have: "Feedback loop formed between Framebuffer and active Texture"
			fDisableTexture();
		}
		
		
		 public function fEnableTexture():Void {
			//Disable Texture with buffer may have: "Feedback loop formed between Framebuffer and active Texture"
			OpenGL.fActiveTexture(TEXTURE0 + oTexture.nSlot);
			OpenGL.fBindTexture(TEXTURE_2D, oTexId); 
			////////////////////////////////////////
		 }
		
		 public function fDisableTexture():Void {
			//Disable Texture with buffer may have: "Feedback loop formed between Framebuffer and active Texture"
			OpenGL.fActiveTexture(TEXTURE0 + oTexture.nSlot);
			OpenGL.fBindTexture(TEXTURE_2D, null); 
			////////////////////////////////////////
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