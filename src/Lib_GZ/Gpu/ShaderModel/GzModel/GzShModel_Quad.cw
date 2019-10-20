package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.UnFloat;
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public overclass GzShModel_Quad extends GzShModel {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUiMouse : UnVec2;
		*/
		
		
		/*
		public var oAtObjPos : Attribute;
		//public var oAtObjSize : Attribute;
		public var oAtObjRot : Attribute;
		public var oAtPt1 : Attribute;
		public var oAtPt2 : Attribute;
		public var oAtPt3 : Attribute;
		public var oAtPt4 : Attribute;
		public var oAtTexSource0 : Attribute;
		public var oAtTexSource1 : Attribute;
		public var oAtColor1 : Attribute;
		public var oAtColor2 : Attribute;
		public var oAtColor3 : Attribute;
		public var oAtColor4 : Attribute;
		public var oAtOffsetHV : Attribute;
		public var oAtOffsetC : Attribute;
		*/
		
		public var oAt : Attribute_Quad;
		
		public var nTest : Int = 0;
		
		

		
		public function GzShModel_Quad():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
			
			oAt = new Attribute_Quad();
			Attribute_Quad = oAt; //Singleton
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



	float nWinHalfWidth;
	float nWinHalfHeight;
	
	
	//uniform float nWinHalfWidth;
	//uniform float nWinHalfHeight;

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

	//in int gl_VertexID;

	void main(){

		/*
		if (nVertexID < 2){
			if(nVertexID == 0){
				gl_Position.x = -1.0;
				gl_Position.y = -1.0;
			}else{
				gl_Position.x = 1.0;
				gl_Position.y = -1.0;
			}
		}else{
			if(nVertexID == 2){
				gl_Position.x = 1.0;
				gl_Position.y = 1.0;
			}else{
				gl_Position.x = -1.0;
				gl_Position.y = 1.0;
			}
		}
		gl_Position.z = 0.5;
		gl_Position.w = 1.0;
	*/
	
/*
		if(nType == 1){ //Normal 2D

		
		
			gl_Position.x = (((in_PtPos.x * in_PtPos.z) + nPos.x + 0.5) - nWinHalfWidth )/ nWinHalfWidth ;
			gl_Position.y = (((in_PtPos.y * in_PtPos.z) + nPos.y + 0.499) - nWinHalfHeight)/-nWinHalfHeight ;
			gl_Position.w = in_PtPos.z;
			gl_Position.z = 0;


			
			coord_Texture.x = (in_TexCoord0.x + 0.5) / (nTexDim.x + 4 );
			coord_Texture.y = (in_TexCoord0.y + 0.5) / (nTexDim.y + 4) ;

			coord_TextureSource.x = in_TexCoord0.x / nTexDim.x;
			coord_TextureSource.y = in_TexCoord0.y / nTexDim.y;

			coord_Corner = in_Corner;
			
			coord_Color1 = in_Color1;
			coord_Color2 = in_Color2;
			coord_Color3 = in_Color3;
			coord_Color4 = in_Color4;
		}
		
		if(nType == 4){ //Normal 3D
		*/	

			
			//gl_Position.x = in_PtPos.x;
			//gl_Position.y = in_PtPos.y;
			//gl_Position.z = in_PtPos.z;
			
			
			
			
			//BATCH ONLY
			switch(nVertexID){
				case 0 :
					gl_Position =  in_Pt1;
					coord_Corner = vec2(0.25,0.25);
					coord_Texture = (in_TexSource0.xy + 0.5)/ 500.0;
		
				break;
				case 1 :
					gl_Position =  in_Pt2;
					coord_Corner = vec2(0.75,0.25);
					coord_Texture = (in_TexSource0.zw + 0.5)/ 500.0;
				break;
				case 2 :
					gl_Position =  in_Pt3;
					coord_Corner = vec2(0.75,0.75);
					coord_Texture = (in_TexSource1.xy + 0.5)/ 500.0;
				break;
				case 3 :
					gl_Position =  in_Pt4;
					coord_Corner = vec2(0.25,0.75);
					coord_Texture = (in_TexSource1.zw + 0.5)/ 500.0;
				break;
			}
		
			nWinHalfWidth = 400;
			nWinHalfHeight = 300;
			
			
			
			///// Rotation ////
			float _nTx = (gl_Position.x * cos(in_ObjRot.y)) - (gl_Position.z * sin(in_ObjRot.y));
			float _nTz = (gl_Position.x * sin(in_ObjRot.y)) + (gl_Position.z * cos(in_ObjRot.y));
			float _nTy = (gl_Position.y * cos(in_ObjRot.z)) - (_nTz * sin(in_ObjRot.z));
			gl_Position.z  = (_nTy * sin(in_ObjRot.z)) - (_nTz * cos(in_ObjRot.z));
			gl_Position.x = (_nTx * cos(in_ObjRot.x)) - (_nTy * sin(in_ObjRot.x));
			gl_Position.y = (_nTx * sin(in_ObjRot.x)) + (_nTy * cos(in_ObjRot.x));
			////////////////////
			
			
			
			//3D to Screen
			gl_Position.w  =  gl_Position.z * in_ObjPos.w + 1.0;
			gl_Position.x = (((gl_Position.x ) + in_ObjPos.x + 0.5) - nWinHalfWidth )/ nWinHalfWidth ;
			gl_Position.y = (((gl_Position.y ) + in_ObjPos.y + 0.499) - nWinHalfHeight)/-nWinHalfHeight ;
			gl_Position.z = 0;
			
			/*
			if (nVertexID < 2){
				if(nVertexID == 0){
					gl_Position.x = -1.0;
					gl_Position.y = -1.0;
					gl_Position.xy =  in_Pt1.xy / 800.0 ;
					//gl_Position.xy = vec2(-139.50,-136.00) / 800.0 ;
				}else{
					gl_Position.x = 1.0;
					gl_Position.y = -1.0;
					gl_Position.xy =  in_Pt2.xy / 800.0 ;
				}
			}else{
				if(nVertexID == 2){
					gl_Position.x = 1.0;
					gl_Position.y = 1.0;
					gl_Position.xy =  in_Pt3.xy / 800.0 ;
				}else{
					gl_Position.x = -1.0;
					gl_Position.y = 1.0;
					gl_Position.xy =  in_Pt4.xy / 800.0 ;
				}
			}
			gl_Position.z = 0.5;
			gl_Position.w = 1.0;
		*/
			
			//coord_Texture.x = (in_TexCoord0.x + 0.5) / (nTexDim.x + 4 );  //Not batch
			//coord_Texture.y = (in_TexCoord0.y + 0.5) / (nTexDim.y + 4) ;  //Not batch

			//coord_TextureSource.x = in_TexCoord0.x / nTexDim.x;
			//coord_TextureSource.y = in_TexCoord0.y / nTexDim.y;

		
			//coord_Corner =vec2(0.5,0.5);
			
			coord_Color1 = in_Color1;
			coord_Color2 = in_Color2;
			coord_Color3 = in_Color3;
			coord_Color4 = in_Color4;
			
			coord_Pt1 = in_Pt1;
			coord_Pt2 = in_Pt2;
			coord_Pt3 = in_Pt3;
			coord_Pt4 = in_Pt4;
		/*	
		}
		
		

		if(nType == 2){ //Buffer
		
			gl_Position = vec4(in_PtPos, 1.0) ;
			gl_Position.x = (gl_Position.x - nWinHalfWidth )/ nWinHalfWidth;
			gl_Position.y = ((gl_Position.y  )  - nWinHalfHeight)/-nWinHalfHeight;

			coord_Texture.x = in_TexCoord0.x / nTexDim.x;
			coord_Texture.y = (in_TexCoord0.y )/ nTexDim.y;

			//coord_TextureSource.x = in_TexCoord0.x / nTexDim.x;
			//coord_TextureSource.y = in_TexCoord0.y / nTexDim.y;
		}

		if(nType == 3){ //UniColor
			gl_Position = vec4(in_PtPos, 1.0) ;
			gl_Position.x = (gl_Position.x - nWinHalfWidth )/ nWinHalfWidth;
			gl_Position.y = ((gl_Position.y  )  - nWinHalfHeight)/-nWinHalfHeight;
			//coord_TextureSource.x = in_TexCoord0.x / nTexDim.x;
			//coord_TextureSource.y = in_TexCoord0.y / nTexDim.y;
		}
		*/
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
				
					
	out vec4 outputColor;

	uniform sampler2D TexCurrent;
	uniform sampler2D TexSource;
	uniform sampler2D TexFragPos;
	uniform sampler2D TexPixSrc;

	uniform sampler2DArray TexArray;  

	//in vec2 coord_TextureSource;
	in vec2 coord_Texture;
	in vec2 coord_Corner;

	flat in vec4 coord_Color1;
	flat in vec4 coord_Color2;
	flat in vec4 coord_Color3;
	flat in vec4 coord_Color4;

	flat in vec4 coord_Pt1;
	flat in vec4 coord_Pt2;
	flat in vec4 coord_Pt3;
	flat in vec4 coord_Pt4;

	uniform vec4 vColorTL;
	uniform vec4 vColorTR;
	uniform vec4 vColorBR;
	uniform vec4 vColorBL;

	uniform vec4 v1Color;
	uniform mat4 mColor;

	uniform int nType;


	void main()
	{
		FragColor =  vec4(0.5,0.5,0.5,0.5);
/*
		if(nType == 1 || nType == 4){ //Normal
			vec2 coord_Source = gl_FragCoord.xy/vec2(800.0,600.0);
			vec4 pixFrame = texture(TexSource, coord_Source );

			float nRevAlpha = 1.0 -  pixFrame.a;

			//float nTR = (coord_Texture.x * (1.0-coord_Texture.y));
			//float nBR = (coord_Texture.x * coord_Texture.y);
			//float nBL = ((1.0 - coord_Texture.x) * coord_Texture.y);
			//float nTL = 1.0 - (nBL + nTR + nBR);
			
			vec4 vCoDist = texture(TexFragPos, coord_Corner );
			
			//vec4 vTL2 = vec4(1.0,0.5,0.5,1.0) * vCoDist.r;
			//vec4 vTR2 = vec4(0.5,1.0,0.5,1.0) * vCoDist.g;
			//vec4 vBR2 = vec4(0.5,0.5,1.0,1.0) * vCoDist.b;
			//vec4 vBL2 = vec4(0.5,0.5,0.5,0.5) * vCoDist.a;

			vec4 vPtDist = clamp(( coord_Color1 * vCoDist.a) + (coord_Color2 * vCoDist.r) + (coord_Color3 * vCoDist.g) + (coord_Color4 * vCoDist.b), 0.0, 1.0);
			
			vec4 vLight = max(vPtDist * 2.0 - 1.0, 0); //0 a 1 -> = 0 if Dark
			vec4 vDark  = min(vPtDist * 2.0 , 1.0); //0 a 1 -> = 1 if bright

			
			vec4 pixTex = texture(TexCurrent, coord_Texture);
			//vec4 pixTex = texture(TexArray, vec3(coord_Texture, coord_Pt4.w ));  //Batch only
		//	vec4 pixTex = texture(TexArray, vec3(coord_Texture, 0 ));  //Batch only
			//vec4 pixTex = vec4(0.5,0.5,0.5,0.5);  //Batch only
			
			
			//vec4 pixTex = texture(TexCurrent, vec2(vPtDist.r,vPtDist.g ));
			
			pixTex.r = (((pixTex.a - pixTex.r) * vLight.r) + pixTex.r) * vPtDist.a * vDark.r;
			pixTex.g = (((pixTex.a - pixTex.g) * vLight.g) + pixTex.g) * vPtDist.a * vDark.g;
			pixTex.b = (((pixTex.a - pixTex.b) * vLight.b) + pixTex.b) * vPtDist.a * vDark.b;
			pixTex.a *= vPtDist.a;
			
			//vec4 vPix = pixFrame + pixTex * nRevAlpha;
			//vec4 vPix = vec4(pixFrame.rgb - nRevAlpha * pixFrame.rgb, 1.0);
			vec4 vPix = pixFrame + pixTex * (1 - pixFrame.a);
			//vPix.a = 1.0;
			
			outputColor = vPix;
			outputColor = pixTex;
	//		outputColor =  vec4( vCoDist.x, vCoDist.y, vCoDist.z,1.0);
			
		//	outputColor =  vec4(0.5,0.5,0.5,0.5);
			//////////////////////////////////////////////////////

			///////////////////////////////////////////////////////
			
			//outputColor = vec4( (vCoDist.x  + vCoDist.z   ) , 0.0,0.0,1.0);
		}
		if(nType == 2){ //Buffer (no Alpha)
			outputColor = texture(TexCurrent, coord_Texture);
		}

		if(nType == 3){ //UniColor
			vec2 coord_Source = gl_FragCoord.xy/vec2(800.0,600.0);
			vec4 pixFrame = texture(TexSource, coord_Source );
			//vec4 pixTex =  vec4(1.0,1.0,1.0,1.0);
			vec4 pixTex =  v1Color;
			float nRevAlpha = 1.0 -  pixFrame.a;
			outputColor = pixFrame + pixTex * nRevAlpha;
		}
		*/
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
			
			
			//oProgram.nDefaultAttribDivisor = 1;
			
			var _oAtVertexID : Attribute =  new Attribute("atVertexID", oVboBatch, 0);//TODO null!
			//oProgram.fAttachAttribute(_oAtVertexID);
			
				
			oAt.fLocateAttribute(oProgram);
		//	Debug.fTrace("Finish fLocateAttribute");

		//	oAtOffsetHV = oProgram.fAddAttribute("in_OffsetHV");
		//	oAtOffsetC = oProgram.fAddAttribute("in_OffsetC");
			
			

		//	var _oAtVertexID : Attribute = oProgram.fAddAttribute("atVertexID",0);
	
			oUiMouse = new UnVec2(oProgram, "iMouse");
			var _oPersv : Perspective = new Perspective();
			
			
			
			oUnType = new UnInt(oProgram, "nType");

			
			//	oGpuBatch.fDraw();
		
			///var _oPod : TestPod = new TestPod(5, 5);
			///var _oPod2 : TestPod2 = new TestPod2(1, 2.5, 3, 4);
			///	fPod(_oPod2);
		}
		
			/*
		public function fPod(_oPod : TestPod2):Void {
			Debug.fTrace("PodsX:" + _oPod.nW);
		}*/
		
		
		override public function fIniRender():Void {
			//Debug.fTrace("Total Face : "  + Context.oItf.nTotalFaces) ;
			oAt.fIniData( Context.oItf.nTotalFaces );
		}
		
		public function fUpdate():Void {
		
		
			oAt.fUpdate();
			//return; ///DISAABLE
			
			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
			
			
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
			
		
			oGpuBatch.fDraw();
	
			Debug.fTrace("Size: " + oAt.oVbo.aData.nSize)
			//Debug.fTrace("!" +  oAt.aData[0]  );
			
			
			//if(bTest == false){
			//	bTest = true;
			nTest++;
			if(nTest  < 5){
				//for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=4){
				for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=8){
					Debug.fTrace("[" +  oAt.oVbo.aData[i] + "," +  oAt.oVbo.aData[i+1] + "," +  oAt.oVbo.aData[i+2] + "," +  oAt.oVbo.aData[i+3] + "]" );
				}
			//}
			}
			
		
			/*
			forEach(var _nData : Float in oAt.aData){
			
			}*/
			//Debug.fTrace(oAt.aData);
		}
		
		
	}
}