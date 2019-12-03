package  { 

	

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.ShaderBase.Evbo;
	import GZ.Gpu.Base.Uniform;
	
	public overclass ProgramShader  {
		
		public var nId : Val;
		public var bLinked : Bool;
		public var aAttribute : Array<Attribute>;
		public var aUniform : Array<Uniform>;
		public var aTexture : Array<Texture>;
		public var aVbo : Array<Vbo>;
		public var aEvbo : Array<Evbo>;
		public var nDefaultAttribDivisor : UInt = 0;
		
		//public var nTotalTexture : UInt = 0;
		
		public var aShaderAttached : Array<ShaderBase>;
		

		public function ProgramShader():Void {
			Debug.fTrace("--- ProgramShader Created!! ---");
			fLoad();
		}
		
		public function fReLoad_Uniform():Void {
			for( var i : UInt = 0; i < aUniform.nSize; i++){
				aUniform[i].fLoad();
			}
		}
		
		public function fLoad():Void {
		}
		
		public function fAttachShader(_oShader : ShaderBase):Void {
		}
		public function fDetachShader(_oShader : ShaderBase):Void {
		}
		
		public function fDetachAll_Fragment(_oShader : ShaderBase):Void {
			for( var i : UInt = 0; i < aShaderAttached.nSize; i++){
				var _oShader : ShaderBase = aShaderAttached[i];
				if(_oShader.hType == ShaderBase.eType.Fragment){
					fDetachShader(_oShader);
				}
			}
		}
		
		public function fDetachAll(_oShader : ShaderBase):Void { //fDetachAllShader?
			for( var i : UInt = 0; i < aShaderAttached.nSize; i++){
				fDetachShader(aShaderAttached[i]);
			}
		}
		
		
		public function fLink():Bool;
		
		public function fUse():Bool;
		
		
		public function fAttachTexture(_oTex: Texture):UInt {
			aTexture.fPush(_oTex);
			return aTexture.nSize;
		}
		public function fAttachAttribute(_oAttribute: Attribute):Attribute{
			aAttribute.fPush(_oAttribute);
			_oAttribute.oProgram = this;
			_oAttribute.fLoad();
		}
		
		/*
		public function fAddAttribute(_aDataLinked : Array<Float>, _sName : String, _nDivisor : Int = -1):Attribute{ // -1 = default
			var _oAttrib : Attribute = new Attribute(_aDataLinked, this, _sName);
	
			if(_nDivisor >= 0){
					_oAttrib.fSetDivisor(_nDivisor);
			}else{
				if(nDefaultAttribDivisor != 0){
					_oAttrib.fSetDivisor(nDefaultAttribDivisor);
				}
			}
			return _oAttrib;
		}*/
		
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