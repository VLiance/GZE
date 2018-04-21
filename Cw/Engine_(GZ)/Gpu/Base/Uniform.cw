package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public extension Uniform  {
		
		public enum eDataType : UInt8 {
			Float;
			Byte;
			UByte;
		}
		
		public var hDataType : eDataType = eDataType.Float;
		
		public var nId : Val;
		public var sName : String;
		public var bValid : Bool = false;
		
		public wvar oProgram : ProgramShader;
		
		public function Uniform(_oProgram : ProgramShader, _sName : String):Void {
			sName = _sName;
			oProgram = _oProgram;
			oProgram.aUniform.fPush(this);
			Debug.fTrace1("--- Unifrom Created!! ---");
			fLoad();
		}
		
		public function fLoad():Void {
		}

		public function fSend():Void {
		}
		
	//	public function fGpuDataType():Int;

		
		
		
	}
}