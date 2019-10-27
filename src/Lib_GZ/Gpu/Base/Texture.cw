
package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Base.Container.Vector.Vec4;
	import GZ.Gfx.Triangle;
	import GZ.Gfx.Shape;
		
	public overclass Texture  {

		
		public var nId : Val;
		public var sName : String;
		public var bValid : Bool = false;
		
		
		public wvar oProgram : ProgramShader;

		
				
		public function Texture(_oProgram : ProgramShader, _sName : String):Void {

			sName = _sName;
			oProgram = _oProgram;
			//oProgram.aTex.fPush(this); //Todo
			
			fLoad();
		//	Debug.fTrace("--- Texture Created!! ---");
		}
		
		
		
		public function fLoad():Void {
		}
		
		public function fSend(_nSlot : UInt):Void {
		}
		
	}
}