package  { 

	import GZ.Gpu.ShaderBase.ShaderBase;
	
	public overclass FragmentShader extends ShaderBase {
		
		
		public function FragmentShader(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			Debug.fTrace1("--- FragmentShader Created!! ---");
			hType = eType.Vertex;
			ShaderBase(_hGlsl_ES_Version);
		}

		

				
	}
}