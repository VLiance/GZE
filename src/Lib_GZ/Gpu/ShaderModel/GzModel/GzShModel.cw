package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.Base.UnFloat;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.UnVec4;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.GpuObj.GpuBatch;
	
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public extension GzShModel  {
		
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUnType : UnInt;
		public var oUvPersp : UnVec4;
		public var oUiTime : UnFloat;
		public var oUiMouse : UnVec2;
		public var oUiResolution : UnVec2;
		public var oUvPosition : UnVec2;
		public var aBatch  : Array<GpuBatch>;
		
		
		
		public function GzShModel():Void {
			fLoad();
		}
		
		public function fLoad():Bool {

			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
			fIni_Base();
			fLoad_Vertex();
			fLoad_Fragment();
			
			fCompile_Vertex();
			fCompile_Fragment();
			fLink();
			fLoad_Base();
			
		}
		
		

		public function fCompile_Vertex():Bool {
			oVertex.fLoad();
			if(oVertex.fCompile() == false){
				//Debug.fError("Vertex Shader:  " + oVertex.fGetErrorLine() );
				Debug.fError("Vertex Shader Error:" );
				Debug.fTrace("-->" + oVertex.fGetLog());
				Debug.fTrace("-----------------");
				Debug.fTrace(oVertex.fGetString());
				Debug.fTrace("-----------------");
				
			}else{
				Debug.fPass("Vertex Success");
			}
		}
		
		
		public function fCompile_Fragment():Bool {
			oFragement.fLoad();
			if(oFragement.fCompile() == false){
				//Debug.fError("Fragment Shader: " + oFragement.fGetErrorLine() );
				Debug.fError("Fragment Shader Error:" );
				Debug.fTrace("-->" + oFragement.fGetLog());
				Debug.fTrace("-----------------");
				Debug.fTrace(oFragement.fGetString());
				Debug.fTrace("-----------------");
				
	
			}else{
				Debug.fPass("Fragement Shader Success");
			}
		}
		
		
		
		public function  fLink():Bool {

			oProgram.fAttachShader(oVertex);
			oProgram.fAttachShader(oFragement);
			
			if(oProgram.fLink()){
				Debug.fPass("Link Success");
			}else{
				Debug.fError("Link error! " );
				return false;
			}
			
			oProgram.fUse();
			return true;
		}
		
		
		
		
		
		
		public function fIni_Base():Void {
		}
		public function fLoad_Base():Void {
		}
		
		
		
		public function fLoad_Vertex():Bool {
		}
		public function fLoad_Fragment():Bool {
		}
		

		public function fUpdate():Void {
		
		}
		
		public function fIniRender():Void {
		}
		
		public function fRenderFrame():Void {
			
			
			
		}
		
	}
}