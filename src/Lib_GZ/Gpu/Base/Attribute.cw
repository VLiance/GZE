
package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Base.Container.Vector.Vec4;
	
	public overclass Attribute  {
		
		public enum eDataType : UInt8 {
			Float;
			Byte;
			UByte;
		}
		
		public var hDataType : eDataType = eDataType.Float;
		
		public wvar aDataLinked : Array<Float>;
		public var nId : Val;
		public var nOffset : UInt;
		public var sName : String;
		public var bValid : Bool = false;
		
		
		public wvar oProgram : ProgramShader;
		
		
				
		public function Attribute(_sName : String, _aDataLinked : Array<Float>, _nDivisor : Int = 1):Void {
			aDataLinked = _aDataLinked;
			sName = _sName;
			//oProgram = _oProgram;
			//oProgram.aAttribute.fPush(this);
			fSetDivisor(_nDivisor);
			
			
			Debug.fTrace("--- Attribute Created!! ---");
			//fLoad();
		}
		
		/*
		public function Attribute(_aDataLinked : Array<Float>, _oProgram : ProgramShader, _sName : String):Void {
			aDataLinked = _aDataLinked;
			sName = _sName;
			oProgram = _oProgram;
			oProgram.aAttribute.fPush(this);
			Debug.fTrace("--- Attribute Created!! ---");
			fLoad();
		}*/
		
		
		//public function fSet(_oData : CArray<Float>):Void {
		
		public function fSet(_aVec : ArrayView<Float>):Void {
			aDataLinked[nOffset]	 =  _aVec[0];
			aDataLinked[nOffset+1]   =  _aVec[1];
			aDataLinked[nOffset+3]   =  _aVec[2];
			aDataLinked[nOffset+4]   =  _aVec[3];
		}
		
		
		

		
		public function fLoad():Void {
		}
		
		public function fSetOffset(_nValOffset : UInt):Void{ //overided
			nOffset = _nValOffset;
		}
		
		

		
	
	//	public function fGpuDataType():Int;
		
		//"If an enabled vertex attribute array is instanced (it has a non-zero
		//<divisor> as specified by VertexAttribDivisor), the element index that
		//is transferred to the GL, for all vertices, is given by
		// floor(<instance> / <divisor>) + <baseinstance>
		public function fSetDivisor(_nDiv:UInt = 1):Void;
		
		
		
	}
}