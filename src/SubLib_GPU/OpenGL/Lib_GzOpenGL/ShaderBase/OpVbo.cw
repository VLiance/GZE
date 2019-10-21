package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
		
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpVbo overplace Vbo {

	
		public function OpVbo(_oProgram : ProgramShader):Void {
		
		}
	
	
		override public function fLoad():Void {

			nId = OpenGL.fCreateBuffer();
			OpenGL.fBindBuffer(ARRAY_BUFFER, nId);
			
			/*if(nId == -1){
				Debug.fError("Invalid Buffer ");
			}*/
			
		}
		
		
		
		/*
		override public function fGpuDataType():Int{
			if(hDataType == eDataType.Float){

			}
			return -1;
		}
		*/

		
		
		
		
		
		override public function fSendData():Void {
			
			<cpp>

			/*
			vertexData = new Float32Array([
				0, 0.5, -0.5, -0.5,   //PT1
				1, 0.5, -0.5, -0.5,   //PT2
				2, 0.5, -0.5, -0.5,   //PT3
				3, 0.5, -0.5, -0.5    //PT4
				//  x   y   z    w
				]);
			*/
			/////Only for ES2 that doesn't have gl_VertexID 
		
			
	//			Lib_GzOpenGL::OpenGL::GetInst(thread)->fBindBuffer(Lib_GzOpenGL::OpenGL::eBufferTarget(Lib_GzOpenGL::OpenGL::eBufferTarget::ARRAY_BUFFER), gzVal(nId));
	//	Lib_GzOpenGL::OpenGL::GetInst(thread)->fBufferData(Lib_GzOpenGL::OpenGL::eBufferTarget(Lib_GzOpenGL::OpenGL::eBufferTarget::ARRAY_BUFFER), 4, Lib_GzOpenGL::OpenGL::eTypeSize(Lib_GzOpenGL::OpenGL::eTypeSize::Vec4), aData.get(), Lib_GzOpenGL::OpenGL::eDrawFlow(Lib_GzOpenGL::OpenGL::eDrawFlow::STREAM_DRAW));
	
			</cpp>
		//	Debug.fTrace("SEND! : "   + aData.nSize/4);
			 //Send all data
			if( aData.nSize != 0){
				OpenGL.fBindBuffer(ARRAY_BUFFER, nId);
				OpenGL.fBufferData(ARRAY_BUFFER,  aData.nSize/4, Vec4, aData, STREAM_DRAW);
			}
			
			
		}
		


	}
}