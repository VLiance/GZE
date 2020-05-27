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
			
			/*if(nIdBuff == -1){
				Debug.fError("Invalid Buffer ");
			}*/
			
			
			nId = OpenGL.fGetUniformBlockIndex(oProgram.nId, sName);
			<cpp>
			if(nId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find UniformBlock (or optimised out): " + sName );
				bValid = false
				return;
			<cpp>
			}
			</cpp>
						
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

		override public function fSetIndex(_nBindPointIndex:UInt):Void { //Max 12 (portable)?
			nBindPointIndex = _nBindPointIndex;
			//Link block with UBO 
			OpenGL.fBindBufferBase(UNIFORM_BUFFER, nBindPointIndex, nIdBuff);
			OpenGL.fUniformBlockBinding(oProgram.nId, nId, nBindPointIndex);
		}
		
		
		override public function fSendDataFloat():Void {
			//Must be exact size: It is undefined behaviour to use a uniform buffer that is too small.
			//Or use subdata?
			aDataFloat.fSetSize(4096 * 4);
			
			//Debug.fTrace("SEND! : "   + aData.nSize/4);
			//Send all data
			if( aDataFloat.nSize != 0){
				//Debug.fTrace("SendUBO: " + aDataFloat.nSize);
				//OpenGL.fBindBuffer(UNIFORM_BUFFER, nId, nIdBuff);
				OpenGL.fBindBuffer(UNIFORM_BUFFER, nIdBuff);
				OpenGL.fBufferData(UNIFORM_BUFFER,  aDataFloat.nSize, Float32, aDataFloat, STREAM_DRAW); 
				//glBufferSubData?
				//Debug.fTrace("Finish SendUBO");
			}
		}
		


	}
}