
package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Base.Container.Vector.Vec4;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Shape;
		
	public overclass Attribute  {
		
				
		use Triangle.uPoint3D;
		use Shape.uPoint;
		
		
		
		public enum eDataType : UInt8 {
			Float;
			Byte;
			UByte;
		}
		
		public var hDataType : eDataType = eDataType.Float;
		
		//public wvar aDataLinked : Array<Float>;
		
		
		public var nId : Val;
		public var nOffset : UInt;
		
		public var nCurrentIndex : UInt;
		public var sName : String;
		public var bValid : Bool = false;
		
		
		public wvar oProgram : ProgramShader;
		public wvar oVbo : Vbo;
		

		
		
				
		public function Attribute(_sName : String, _oVbo : Vbo, _nDivisor : Int = 1):Void {
			//aDataLinked = _aDataLinked;
			oVbo = _oVbo;
			sName = _sName;
			//oProgram = _oProgram;
			//oProgram.aAttribute.fPush(this);
			

			oVbo.oProgram.fAttachAttribute(this);
			
			fSetDivisor(_nDivisor); //Must be after been loaded
			
						
			//Debug.fTrace("--- Attribute Created!! ---");
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
		
		

		public function fSetIndex(_nIndex : UInt):Void {
			nCurrentIndex = _nIndex * 4; //Pour vec4?
		}
		
		
		//TODO inline!
		public function fSet(_aVec : ArrayView<Float>):Void {
			var _aData : Array<Float> = oVbo.aData;
			for(var i : UInt = 0; i < _aVec.nSize; i++){
				_aData[nOffset + i + nCurrentIndex]	 =  _aVec[i];
			}
		}
		public function fSetVal(_nIndex: UInt, _nValue : Float):Void {
			var _aData : Array<Float> = oVbo.aData;
			_aData[nOffset + _nIndex + nCurrentIndex] = _nValue;
		}
		
		

		
		public function fLoad():Void {
		}
		
		
		public function fVboSetOffset():Void{ 
	
			var _nOffset : Int = oVbo.nTotalPerAttrib *  oVbo.nCurrentAttributeSetOffset;
					//Debug.fTrace("!" + oVbo.nTotalPerAttrib)
			//		Debug.fTrace("*" + oVbo.nCurrentAttributeSetOffset + " " + nOffset)
			fSetOffset(_nOffset); //overided
			oVbo.nCurrentAttributeSetOffset++;
		}
		
		public function fSetOffset(_nValOffset : UInt):Void{ //overided
			nOffset = _nValOffset;
			Debug.fTrace("*" + nOffset);
		}
		
		

		
	
	//	public function fGpuDataType():Int;
		
		//"If an enabled vertex attribute array is instanced (it has a non-zero
		//<divisor> as specified by VertexAttribDivisor), the element index that
		//is transferred to the GL, for all vertices, is given by
		// floor(<instance> / <divisor>) + <baseinstance>
		public function fSetDivisor(_nDiv:UInt = 1):Void;
		
		
		
	}
}