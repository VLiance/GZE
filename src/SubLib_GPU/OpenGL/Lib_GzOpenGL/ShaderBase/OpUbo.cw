package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
		
	import GZ.Gpu.ShaderBase.Ubo;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpUbo overplace Ubo {

	
		public function OpUbo(_oProgram : ProgramShader, _sName : String):Void {
		
		}
	
	
		override public function fLoad():Void {

			nIdBuff = OpenGL.fCreateBuffer();
			OpenGL.fBindBuffer(UNIFORM_BUFFER, nIdBuff);
			
			/*if(nId == -1){
				Debug.fError("Invalid Buffer ");
			}*/
			
			
			nId = OpenGL.fGetUniformBlockIndex(oProgram.nId, sName);
			//nId = OpenGL.fGetUniformLocation(oProgram.nId, sName);
			//glUniformBlockBinding(shaderA.ID, lights_index, 2);
			bValid = true; //Todo
			
			fSetIndex(0); //0 by default?
		}
		
		
		/*
		override public function fGpuDataType():Int{
			if(hDataType == eDataType.Float){

			}
			return -1;
		}
		*/

		

		override public function fSetIndex(_nIndex:UInt):Void { //Max 12 (portable)?
			
			//GLuint binding_point_index = 2; //Max 12?
			//glBindBufferBase(GL_UNIFORM_BUFFER, binding_point_index, gbo); //or glBindBufferRange(GL_UNIFORM_BUFFER, 2, uboExampleBlock, 0, 152);
			//glUniformBlockBinding(program, block_index, binding_point_index);
			
		}
		
		
		
		
		override public function fSendData():Void {
		
			//Debug.fTrace("SEND! : "   + aData.nSize/4);
			//Send all data
			
			if( aData.nSize != 0){
				
				//OpenGL.fBindBuffer(UNIFORM_BUFFER, nId, nIdBuff);
				OpenGL.fBindBuffer(UNIFORM_BUFFER, nIdBuff);
				OpenGL.fBufferData(UNIFORM_BUFFER,  aData.nSize, Float32, aData, STREAM_DRAW); 
				//glBufferSubData?
			
			}
			
			
		}
		


	}
}