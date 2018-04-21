package  { 

	
	import GZ.Gpu.ShaderBase.ShaderBase;
	
	public overclass VertexShader extends ShaderBase {
		
		
		public function VertexShader(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			Debug.fTrace1("--- VextexShader Created!! ---");
			hType = eType.Vertex;
			ShaderBase(_hGlsl_ES_Version);
		}
		
		
	}
}