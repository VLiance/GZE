
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
		public var sName : String;
		public var sSizeName : String;
		public var bValid : Bool = false;
		
		public var nSlot : UInt;
		
		public wvar oProgram : ProgramShader;

		
				
		public function Texture(_oProgram : ProgramShader, _sName : String,  _sSizeName : String):Void {

			sName = _sName;
			sSizeName = _sSizeName;
			oProgram = _oProgram;
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