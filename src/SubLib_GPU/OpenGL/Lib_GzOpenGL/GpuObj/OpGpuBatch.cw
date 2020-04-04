package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	
	import GZ.Gfx.Face;
	import GZ.Gpu.GpuObj.GpuBatch;

	import GZ.Gpu.ShaderBase.Evbo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Sys.Interface.Context;
	
	public class OpGpuBatch overplace GpuBatch {
		
		public var aIndice : CArray<UInt8, 1, 6>;
		
		public var oEvbo : Evbo;
		
	

		

		<cpp_namespace>
		 static char aIndice2TriA[] = {3,2,0, 2,1,0 };
		</cpp_namespace>
		
		
		public function OpGpuBatch( _oShModel : GzShModel ):Void{
			
			oEvbo = new Evbo(_oShModel.oProgram );
			oEvbo.fSetQuadElement();
			oEvbo.fSendData();
		}
		
		

		override function fDraw():Void {
			
			oEvbo.fBind();
			
			
			//var _nNbElement : Int  = Context.oItf.nTotalFaces;
			var _nNbElement : Int  = Context.oItf.nTotalFaces-1; //TODO bakcround (-1)
			
		//	Debug.fTrace("Draw _nNbElement: " + _nNbElement);
			
			if(oFBO_Destination == null){
				OpenGL.fBindFramebuffer(FRAMEBUFFER, null); //Default
			}else{
				oFBO_Destination.fBind();
			}
			
			
		//TODO Switch case
		if(hBlendMode ==  eBlendMode.None){
			OpenGL.fDisable( BLEND );
		}
		if(hBlendMode ==  eBlendMode.Alpha){
			//Blending kill FPS on Android!!
			OpenGL.fEnable( BLEND );
			//OpenGL.fBlendFunc(ONE_MINUS_DST_ALPHA, ONE); //Front to back
		//	OpenGL.fBlendFunc(ONE_MINUS_SRC_ALPHA, ONE); //Back to front
			OpenGL.fBlendFunc(ONE,ONE_MINUS_SRC_ALPHA );  //Front to back
			//////////////////////////////////
		}
		
		
		
			//oShModel.oUnType.nVal = 4;
			oShModel.oUnType.nVal = 6;//Tiles
			
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

			  //TODO crash with no info if VBO as not sended DATA
		    OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, 0, _nNbElement);
			//GL_fDrawElementsInstanced(GL_TRIANGLES, 6, GL_UNSIGNED_BYTE, _aIndice2Tri, nNbElement );
		 //   GL_fDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_BYTE, _aIndice2Tri );
			//GL_fBindBuffer(GL_ARRAY_BUFFER,0);
			

		//	OpenGL.fDisable( BLEND );
			
		}
		
	}
}