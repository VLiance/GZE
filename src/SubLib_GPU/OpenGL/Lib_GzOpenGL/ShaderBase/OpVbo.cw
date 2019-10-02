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
			static gzFloat _nInc  = 0;
			_nInc += 0.001;
			if(_nInc > 50.0){
				_nInc = 0;
			}
			
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
			aData[0] = 0.0; //gl_VertexID_0
			aData[1] = 0.0;
			aData[2] = 0.0;
			aData[3] = 1.0;
			
			aData[4] = 1.0;//gl_VertexID_1
			aData[5] = 0.0;
			aData[6] = 0.0;
			aData[7] = 1.0;
			
			aData[8] = 2.0;//gl_VertexID_2
			aData[9] = 0.4;
			aData[10] = 0.6;
			aData[11] = 0.2;
			
			aData[12] = 3.0;//gl_VertexID_3
			aData[13] = 0.4;
			aData[14] = 0.6;
			aData[15] = 0.2;
			
			
			
					/*	
			aData[0] = 0.0;
			aData[1] = 0.0;
			
			aData[2] = 1.0;
			aData[3] = 0.0;
			
			aData[4] = 2.0;
			aData[5] = 0.0;

			aData[6] = 3.0;
			aData[7] = 0.0;
	*/
			
	//			Lib_GzOpenGL::OpenGL::GetInst(thread)->fBindBuffer(Lib_GzOpenGL::OpenGL::eBufferTarget(Lib_GzOpenGL::OpenGL::eBufferTarget::ARRAY_BUFFER), gzVal(nId));
	//	Lib_GzOpenGL::OpenGL::GetInst(thread)->fBufferData(Lib_GzOpenGL::OpenGL::eBufferTarget(Lib_GzOpenGL::OpenGL::eBufferTarget::ARRAY_BUFFER), 4, Lib_GzOpenGL::OpenGL::eTypeSize(Lib_GzOpenGL::OpenGL::eTypeSize::Vec4), aData.get(), Lib_GzOpenGL::OpenGL::eDrawFlow(Lib_GzOpenGL::OpenGL::eDrawFlow::STREAM_DRAW));
	
			</cpp>

			 //Send all data
			OpenGL.fBindBuffer(ARRAY_BUFFER, nId);
			OpenGL.fBufferData(ARRAY_BUFFER, 4, Vec4, aData, STREAM_DRAW); //TODO reput those
			
			
			
			
			
			
		/*
			//Temp
			<cpp>
			::GZ_OpenGL::OpenGL::Get(thread)->fBufferData(::GZ_OpenGL::OpenGL::eBufferTarget(::GZ_OpenGL::OpenGL::eBufferTarget::ARRAY_BUFFER), 4, ::GZ_OpenGL::OpenGL::eTypeSize(::GZ_OpenGL::OpenGL::eTypeSize::Vec4), (aData.array), ::GZ_OpenGL::OpenGL::eDrawFlow(::GZ_OpenGL::OpenGL::eDrawFlow::STREAM_DRAW));
			</cpp>
			*/
		}
		


	}
}