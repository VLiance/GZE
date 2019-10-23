package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
		
	import GZ.Gpu.ShaderBase.Evbo;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpEvbo overplace Evbo {

	
		public function OpEvbo(_oProgram : ProgramShader):Void {
		
		}
	
	
		override public function fLoad():Void {

			nId = OpenGL.fCreateBuffer();
			OpenGL.fBindBuffer(ELEMENT_ARRAY_BUFFER, nId);
			
			/*if(nId == -1){
				Debug.fError("Invalid Buffer ");
			}*/
			
		}
		override public function fBind():Void {
			OpenGL.fBindBuffer(ELEMENT_ARRAY_BUFFER, nId);
		}

		
		/*
		override public function fGpuDataType():Int{
			if(hDataType == eDataType.Float){

			}
			return -1;
		}
		*/

		
		override public function fSendData():Void {
			
			if( aData.nSize != 0){
				OpenGL.fBindBuffer(ELEMENT_ARRAY_BUFFER, nId);
				OpenGL.fBufferData(ELEMENT_ARRAY_BUFFER,  aData.nSize, Int8, aData, STATIC_DRAW);
			}
		}
		


	}
}