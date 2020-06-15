
package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Base.Container.Vector.Vec4;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Shape;
		
	public overclass Texture  {

		
		public var nId : Val;
		public var nSizeId : Val;
		public var nNumId : Val;
		
		
		public var sName : String;
		//public var sSizeName : String;
		public var bValid : Bool = false;
		
		public var nSlot : UInt;
		public var nIndex : UInt;
		public var bTexInteger : Bool = false;
		
		public wvar oProgram : ProgramShader;

		
				
	//	public function Texture(_oProgram : ProgramShader, _sName : String,  _sSizeName : String):Void {
		public function Texture(_oProgram : ProgramShader, _sName : String, _bTexInteger : Bool = false):Void {
			bTexInteger = _bTexInteger;
			sName = _sName;
			oProgram = _oProgram;
			
			
			nIndex =  oProgram.fAttachTexture(this);
			
			 //Using the "Texture unit 0" may lead to stange beahavior and error, because samppler are initialised by default with 0 "unit 0". 
			 //By exemple when we bind a Floating Texture to 0 and we have un usample (default initialised '0'), then in WebGL we got this error:
			 //[.WebGL-000001809B65BA30] GL_INVALID_OPERATION: Mismatch between texture format and sampler type (signed/unsigned/float/shadow).
			 //So use Slot 0 only as a last resort
			nSlot =  oProgram.fGetLastTexSlot() + 1;
			
			
			//oProgram.aTex.fPush(this); //Todo
			

			fLoad();
		//	Debug.fTrace("--- Texture Created!! ---");
		}
		
		
		
		public function fLoad():Void {
		}
		
		public function fSend(_nSlot : UInt):Void {
		}
		
		public function fSendSize(_nWidth : Float, _nHeight : Float):Void {	
		}
		
		
		
	}
}