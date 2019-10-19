

package  { 

	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public overclass Vbo  {
		
		//public var aData : CArray<Float32, 1, 50>;
		//public var aData : DArray<Float32, 1, 50>;

	//public var aData : DArray<Float, 1, 50>;
				
				
		public var aData : Array<Float32>;
				
		public enum eVecType : UInt {
			Vec1;
			Vec2;
			Vec3;
			Vec4;
			IVec1;
			IVec2;
			IVec3;
			IVec4;
		}
		
		public var hVecType : eVecType = eVecType.Vec4;
		
		
		
		
		public var nId : Val;
		public wvar oProgram : ProgramShader;
		
		public var nTotalData : UInt = 10;
		
		public function Vbo(_oProgram : ProgramShader):Void {
		
		<cpp>
		//printf("--------`*********** mbInst! %d " ,  aData.m.aData->nInst);
		</cpp>
		
			oProgram = _oProgram;
			Debug.fTrace("--- Vbo Created!! ---");
			oProgram.aVbo.fPush(this);
			
			fLoad();
		}
		
		public function fLoad():Void {
		}
		

				
		public function fSetDefaultDataVertexID():Void {
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
		}
		
		
		
	//	public function fGpuDataType():Int;

		
		public function fSendData():Void {
			Debug.fTrace("---fSendData not implemented ---");
		}

	}
}