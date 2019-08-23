
package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public overclass Attribute  {
		
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
		
		public function Attribute(_oProgram : ProgramShader, _sName : String):Void {
			sName = _sName;
			oProgram = _oProgram;
			oProgram.aAttribute.fPush(this);
			Debug.fTrace("--- Attribute Created!! ---");
			fLoad();
		}
		
		public function fLoad():Void {
		}
		
		public function fSetOffset():Void;
		
		

		
	
	//	public function fGpuDataType():Int;
		
		//"If an enabled vertex attribute array is instanced (it has a non-zero
		//<divisor> as specified by VertexAttribDivisor), the element index that
		//is transferred to the GL, for all vertices, is given by
		// floor(<instance> / <divisor>) + <baseinstance>
		public function fSetDivisor(_nDiv:UInt = 1):Void;
		
		
		
	}
}