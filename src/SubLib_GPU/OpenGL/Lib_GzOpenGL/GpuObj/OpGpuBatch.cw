package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	
	import GZ.Gfx.Face;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	
	public class OpGpuBatch overplace GpuBatch {
		
		public var aIndice : CArray<UInt8, 1, 6>;
		
		<cpp_namespace>
		 static char aIndice2TriA[] = {0,1,2, 0,2,3};
		</cpp_namespace>
		
		
		public function OpGpuBatch( _oShModel : GzShModel ):Void{+
			
			
		}
		
		

		public function fDraw():Void {
		
		
	
			//TODO  static char aIndice2Tri[] = {0,1,2, 0,2,3};
			aIndice[0] = 0;
			aIndice[1] = 1;
			aIndice[2] = 2;
			aIndice[3] = 0;
			aIndice[4] = 2;
			aIndice[5] = 3;
				/*
		//	Debug.fTrace("ValIndice2 : " + aIndice[2]);
			
			////
			var _nIndice : Val = OpenGL.fCreateBuffer();
			OpenGL.fBindBuffer(ELEMENT_ARRAY_BUFFER, _nIndice);
			OpenGL.fBufferData(ELEMENT_ARRAY_BUFFER, 3 , Vec4, aIndice, STREAM_DRAW);
			//////
			
			//Temp
			<cpp>
			//::GZ_OpenGL::OpenGL::Get(thread)->fBufferData(::GZ_OpenGL::OpenGL::eBufferTarget(::GZ_OpenGL::OpenGL::eBufferTarget::ELEMENT_ARRAY_BUFFER), 3, ::GZ_OpenGL::OpenGL::eTypeSize(::GZ_OpenGL::OpenGL::eTypeSize::Vec4), aIndice.array, ::GZ_OpenGL::OpenGL::eDrawFlow(::GZ_OpenGL::OpenGL::eDrawFlow::STREAM_DRAW));
			</cpp>
			
			//OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, aIndice2Tri, 1);
			OpenGL.fDrawElements(TRIANGLES, 6, UNSIGNED_BYTE, 0);
			
		*/	
			
			//  GL_fBindBuffer(GL_ARRAY_BUFFER, oGzSh->nVboBatch);
    //    GL_fBufferData(GL_ARRAY_BUFFER, oGzSh->nTotalValue * sizeof(gzFloat32), oGzSh->aFaces, GL_STREAM_DRAW);

	
	
		var _nNbElement : Int  = 2;

	OpenGL.fBindFramebuffer(FRAMEBUFFER, null); //Default?
	
			OpenGL.fEnable( BLEND );
			//OpenGL.fBlendFunc(ONE_MINUS_DST_ALPHA, ONE); //Front to back
			//OpenGL.fBlendFunc(ONE_MINUS_SRC_ALPHA, ONE); //Back to front

		   // GL_fBindFramebuffer(GL_FRAMEBUFFER, _oDest->oGpuObj->nIdBuff); Temp

			//GL_fBindFramebuffer(GL_FRAMEBUFFER, oDest->oGpuObj->nIdBuff);
		
			//GL_fUniform1i(oGzSh->nLocType, 4);

			
			oShModel.oUnType.nVal = 4;
			oShModel.oUnType.fSend();
			
			
			
			/*
			   if(oRc != 0){
					GL_fUniform1i(oGzSh->nLocType, 4);
					GL_fActiveTexture( GL_TEXTURE1);
					GL_fBindTexture( GL_TEXTURE_2D, oDest->oGpuObj->nTexId );
					
					if(oRc->nGpuTexId){
						GL_fActiveTexture( GL_TEXTURE0 );
						GL_fBindTexture(GL_TEXTURE_2D, oRc->nGpuTexId);
						GL_fUniform2f(oGzSh->nLocTexDim, oRc->nWidth + 2.0, oRc->nHeight + 2.0); //2px of border
					}

			   }else{  //No texture, Unicolor?
				   //GL_fUniform2f(oGzSh->nLocTexDim,10, 10);
			   //     GL_fUniform1i(oGzSh->nLocType, 6);
			   }*/

			//oGzSh->fSetOffset(nStartIndex);

		  //  printf("\n nTotal : %d", nNbElement);
		    OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, aIndice, _nNbElement);
			//GL_fDrawElementsInstanced(GL_TRIANGLES, 6, GL_UNSIGNED_BYTE, _aIndice2Tri, nNbElement );
		 //   GL_fDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_BYTE, _aIndice2Tri );
			//GL_fBindBuffer(GL_ARRAY_BUFFER,0);
			
			
			//OpenGL.fBlendFunc(ONE_MINUS_SRC_ALPHA, ONE); //Back to front
					oShModel.oUnType.nVal = 6;
			oShModel.oUnType.fSend();
			   OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, aIndice, _nNbElement);
			

			
		//	OpenGL.fDisable( BLEND );
			
		}
		
	}
}