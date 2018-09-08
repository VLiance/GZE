package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	
	import GZ.Gfx.Face;
	import GZ.Gpu.GpuObj.GpuBatch;

	
	public class OpGpuBatch overplace GpuBatch {
		
		public var aIndice2Tri : CArray<UInt8, 1, 6>;
		public var aIndice : DArray<UInt8, 1, 6>;
		
		<cpp_namespace>
		 static char aIndice2TriA[] = {0,1,2, 0,2,3};
		</cpp_namespace>
		

		public function fDraw():Void {
			
			//TODO  static char aIndice2Tri[] = {0,1,2, 0,2,3};
			aIndice2Tri[0] = 0;
			aIndice2Tri[1] = 1;
			aIndice2Tri[2] = 2;
			aIndice2Tri[3] = 0;
			aIndice2Tri[4] = 2;
			aIndice2Tri[5] = 3;
			
	
			aIndice[0] = 0;
			aIndice[1] = 1;
			aIndice[2] = 2;
			aIndice[3] = 0;
			aIndice[4] = 2;
			aIndice[5] = 3;
			
		//	Debug.fTrace1("ValIndice2 : " + aIndice[2]);
			
			////
			var _nIndice : Val = OpenGL.fCreateBuffer();
			OpenGL.fBindBuffer(ELEMENT_ARRAY_BUFFER, _nIndice);
			OpenGL.fBufferData(ELEMENT_ARRAY_BUFFER, 3 , Vec4, aIndice, STREAM_DRAW);
			//////
			/*
			//Temp
			<cpp>
			::GZ_OpenGL::OpenGL::Get(thread)->fBufferData(::GZ_OpenGL::OpenGL::eBufferTarget(::GZ_OpenGL::OpenGL::eBufferTarget::ELEMENT_ARRAY_BUFFER), 3, ::GZ_OpenGL::OpenGL::eTypeSize(::GZ_OpenGL::OpenGL::eTypeSize::Vec4), aIndice.array, ::GZ_OpenGL::OpenGL::eDrawFlow(::GZ_OpenGL::OpenGL::eDrawFlow::STREAM_DRAW));
			</cpp>
			*/
			//OpenGL.fDrawElementsInstanced(TRIANGLES, 6, UNSIGNED_BYTE, aIndice2Tri, 1);
			OpenGL.fDrawElements(TRIANGLES, 6, UNSIGNED_BYTE, 0);
			
			
		}
		
	}
}