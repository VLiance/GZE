package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public overclass GzShModel_Minimal extends GzShModel {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUiMouse : UnVec2;
		*/
		public function GzShModel_Minimal():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
		}
		
		public function fLoad():Bool {
			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
	
<glsl(oVertex)>
							
	uniform int nType;

	layout (location = 8) in vec4 in_ObjPos; //x, y, z, ???? 
	layout (location = 9) in vec4 in_ObjRot; // Roll, Yaw, Pitch, Focal
	layout (location = 11) in vec4 in_Pt1;  //x,y,z, Width
	layout (location = 12) in vec4 in_Pt2;  //x,y,z, Height
	layout (location = 13) in vec4 in_Pt3;  //x,y,z, Length
	layout (location = 14) in vec4 in_Pt4;  //x,y,z, ?????
	layout (location = 3) in vec2 in_TexCoord0;  //Sx1,Sy1,Sx2,Sy2 
	layout (location = 1) in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	layout (location = 15)  in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4

	layout (location = 4) in vec4 in_Color1; //R,G,B,A
	////  in vec4 in_LimitRender;  //Limit render ... in uniform? <----

	//AylasID, UniformActionID, Type

	////  in vec4 in_AchorRoll;  //pt1,pt2,pt3,pt4  
	////  in vec4 in_AchorPt1;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt2;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt3;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt4;  //x1,y1,x2,x2  

	layout (location = 0) in vec3 in_PtPos;       //Remove     
	layout (location = 2) in vec2 in_Corner;      //Remove     
	layout (location = 5) in vec4 in_Color2;   //Remove     
	layout (location = 6) in vec4 in_Color3;   //Remove     
	layout (location = 7) in vec4 in_Color4;   //Remove     



	uniform float nWinHalfWidth;
	uniform float nWinHalfHeight;

	uniform vec2 nPos;
	uniform vec2 nTexDim;
	uniform vec2 nTexDimSource;

	uniform vec4 v1Color;
	uniform mat4 mColor;
	/////////////////

	out vec2 coord_Texture;
	out vec2 coord_TextureSource;
	out vec2 coord_Corner;

	flat out vec4 coord_Color1;
	flat out vec4 coord_Color2;
	flat out vec4 coord_Color3;
	flat out vec4 coord_Color4;

	flat out vec4 coord_Pt1;
	flat out vec4 coord_Pt2;
	flat out vec4 coord_Pt3;
	flat out vec4 coord_Pt4;
	///////////////////

	in int gl_VertexID;

	void main(){
	
		if (gl_VertexID < 2){     // 0 || 1
			if(gl_VertexID == 0){
				gl_Position.x = 0.0;
				gl_Position.y = 0.0;
			}else{
				gl_Position.x = 1.0;
				gl_Position.y = 0.0;
			}
		}else{                  // 2 || 3
			if(gl_VertexID == 2){
				gl_Position.x = 1.0;
				gl_Position.y = 1.0;

			}else{
				gl_Position.x = 0.0;
				gl_Position.y = 1.0;
			}
		}

		 gl_Position.z = 0.5;
		 gl_Position.w = 1.0;
		 
	}
					
				
</glsl>

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
			
			///////////// Fragment Shader //////////////
<glsl(oFragement)>
				
	void main(){
        FragColor =  vec4(0.5,0.5,0.5,0.5);
	}
	
</glsl>
			
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
			
			oProgram.fAttachShader(oVertex);
			oProgram.fAttachShader(oFragement);
			
			if(oProgram.fLink()){
				Debug.fPass("Link Success");
			}else{
				Debug.fError("Link error! " );
			}
			
			
			
			oProgram.fUse();
			////////////// TODO Create Vertext ID since ES2/WebGl_1.0 not support gl_VertexID  //////////////
			oProgram.fSetDefaultAttribDivisor(1);
	
			oVboBatch  = oProgram.fAddVbo();
			oGpuBatch = new GpuBatch(this);
			
			
			//var _oAtObjPos : Attribute = oProgram.fAddAttribute(null, "in_ObjPos"); //TODO!
		//	var _oAtVertexID : Attribute = oProgram.fAddAttribute("atVertexID",0);
		
			var _oAtObjPos : Attribute = new Attribute("atObjPos", null); //TODO null!
			var _oAtVertexID : Attribute =  new Attribute("atVertexID", null, 0);//TODO null!
			oProgram.fAttachAttribute(_oAtObjPos);
			oProgram.fAttachAttribute(_oAtVertexID);
		
		
		
			
			oUiMouse = new UnVec2(oProgram, "iMouse");
			
			var _oPersv : Perspective = new Perspective();
			
			
			
			//	oGpuBatch.fDraw();
		
			///var _oPod : TestPod = new TestPod(5, 5);
			///var _oPod2 : TestPod2 = new TestPod2(1, 2.5, 3, 4);
			///	fPod(_oPod2);
		}
		
			/*
		public function fPod(_oPod : TestPod2):Void {
			Debug.fTrace("PodsX:" + _oPod.nW);
		}*/
		
		
		
		public function fUpdate():Void {
		
			
			//nDestX = oWindow.nMouseX  + nDragX + ( oWindow.nMouseX - oWindow.nLastMouseX)/1.5;
			//nDestY = oWindow.nMouseY  + nDragY + ( oWindow.nMouseY - oWindow.nLastMouseY)/1.5;
			//	Debug.fTrace("aaaaa");
			//	if(oUiMouse.oVal.nX < 6){
			//oUiMouse.vVal.nX = Context.nMouseX/ 5.5;
			//Debug.fTrace( Context.nMouseX + ": " +Context.nMouseY  );
				

			oUiMouse.vVal.nX = Context.nMouseX/Context.nFrameWidth - 0.5;
			oUiMouse.vVal.nY = Context.nMouseY/Context.nFrameHeight - 0.5;
				
		//	}
			oUiMouse.fSend();
			
			
			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
			
			oGpuBatch.fDraw();
		}
		
		
	}
}