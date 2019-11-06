package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;


	
	public class Attribute_Tiles {

		public var oTexture : Texture;
	
		//public var nTotalAt : Int = 2;
		public var oAtTilesHV : Attribute;
		public var oAtTilesC : Attribute;
		
		
		
		public wvar oProgram : ProgramShader

		public var nTotalQuad : UInt = 0;

		public wvar oVbo : Vbo;
		
		
		public function Attribute_Tiles(_oVbo : Vbo):Void {
			oVbo = _oVbo;
			Debug.fTrace("--- Attribute_Tiles Created!! ---");
			
		}
		
		
		public function fLocateAttribute(_oProgram:ProgramShader):Void {
			oProgram = _oProgram;

			oAtTilesHV = new Attribute("in_TilesHV", oVbo);
			oAtTilesC = new Attribute("in_TilesC", oVbo);
			Debug.fTrace("fLocateAttribute: oAtTilesHV" );
			
		}
		
		public function fIniData():Void {
			
			oAtTilesHV.fVboSetOffset();
			oAtTilesC.fVboSetOffset();
	
		}
		
		public function fSetIndex(_nIndex:UInt):Void{
			
			oAtTilesHV.fSetIndex(_nIndex);
			oAtTilesC.fSetIndex(_nIndex);
		}
		


		
		
	}
}