

package  { 

	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public overclass Evbo  {
		
		//public var aData : CArray<Float32, 1, 50>;
		//public var aData : DArray<Float32, 1, 50>;

	//public var aData : DArray<Float, 1, 50>;
				
				
		public var aData : Array<UInt8>;

		
		public var nId : Val;
		public wvar oProgram : ProgramShader;
		
		public var nTotalData : UInt = 10;
		
		public function Evbo(_oProgram : ProgramShader):Void {
		
		<cpp>
		//printf("--------`*********** mbInst! %d " ,  aData.m.aData->nInst);
		</cpp>
		
			oProgram = _oProgram;
			Debug.fTrace("--- Evbo Created!! ---");
			oProgram.aVbo.fPush(this);
			
			fLoad();
		}
		
		public function fLoad():Void {
		}
		public function fBind():Void {
		}
		

				
		public function fSetQuadElement():Void {
			aData[0] = 0;
			aData[1] = 1;
			aData[2] = 2;
			aData[3] = 0;
			aData[4] = 2;
			aData[5] = 3;
		}
		
		
		
	//	public function fGpuDataType():Int;

		
		public function fSendData():Void {
			Debug.fTrace("---fSendData not implemented ---");
		}

	}
}