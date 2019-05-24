
#skipContent


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
			oProgram = _oProgram;
			Debug.fTrace("--- Vbo Created!! ---");
			oProgram.aVbo.fPush(this);
			
			fLoad();
		}
		
		public function fLoad():Void {
		}
		

		
	//	public function fGpuDataType():Int;

		
		public function fSendData():Void {
			Debug.fTrace("---fSendData not implemented ---");
		}

	}
}