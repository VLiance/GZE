

package  { 

	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Uniform;

	
	public overclass Ubo extends Uniform  {
		
		//public var aData : CArray<Float32, 1, 50>;
		//public var aData : DArray<Float32, 1, 50>;

	//public var aData : DArray<Float, 1, 50>;
				
		public var nCurrentAttributeSetOffset : Int;
		public var nTotalPerAttrib : Int;
		
		public var nTotalAttribute : Int;
		public var nBindPointIndex : Int;
		
		
		
		public var aDataInt : Array<Int32>;
		public var aDataFloat : Array<Float32>;
		
				
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
		
		
		public var nIdBuff : Val;
	//	public wvar oProgram : ProgramShader;
		
	//	public var nTotalData : UInt = 10;
		
		public function Ubo(_oProgram : ProgramShader, _sName : String):Void {
		
		//	oProgram = _oProgram;
			//Debug.fTrace("--- Vbo Created!! ---");
		//	oProgram.aVbo.fPush(this);
			
		//	fLoad();
		}
		
		override public function fLoad():Void {
		}
		
		public function fSetIndex(_nIndex:UInt):Void { //Overrided
		}

			
		
	//	public function fGpuDataType():Int;

		
		public function fSendDataFloat():Void {
			Debug.fDebug("---fSendData not implemented ---");
		}
			
		public function fSendDataInt():Void {
			Debug.fDebug("---fSendData not implemented ---");
		}

	}
}