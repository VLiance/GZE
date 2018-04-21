package  { 

	

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.Base.Uniform;
	
	public overclass ProgramShader  {
		
		public var nId : Val;
		public var bLinked : Bool;
		public var aAttribute : Array<Attribute>;
		public var aUniform : Array<Uniform>;
		public var aVbo : Array<Vbo>;
		public var nDefaultAttribDivisor : UInt = 0;

		public function ProgramShader():Void {
			Debug.fTrace1("--- ProgramShader Created!! ---");
			fLoad();
		}
		
		public function fLoad():Void {
		}
		
		public function fAttachShader(_oShader : ShaderBase):Void {
		}
		
		public function fLink():Bool;
		
		public function fUse():Bool;
		
		public function fAddAttribute(_sName : String):Attribute{
			var _oAttrib : Attribute = new Attribute(this, _sName);
			if(nDefaultAttribDivisor != 0){
				_oAttrib.fSetDivisor(nDefaultAttribDivisor);
			}
			return _oAttrib;
		}
		/*
		public function fAddUniform(_sName : String):ShUniform{
			var _oUniform: ShUniform = new ShUniform(this, _sName);
			return _oUniform;
		}
		*/
		
		public function fAddVbo():Vbo{
			var _oVbo : Vbo = new Vbo(this);
			return _oVbo;
		}
		
		public function fSetDefaultAttribDivisor(_nDefaultAttribDivisor : Int = 0):Void{
			nDefaultAttribDivisor = _nDefaultAttribDivisor;
		}
		
		
		
	}
}