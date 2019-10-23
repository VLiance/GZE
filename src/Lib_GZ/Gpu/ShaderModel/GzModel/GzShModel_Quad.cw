package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.UnFloat;
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.Base.Texture;
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



	//float nWinHalfWidth;
	//float nWinHalfHeight;
	
	
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

	
	
	out vec2 ioCorner;
	xflat out mat4 iomColor;
	out vec2 ioTexture;
	uniform vec2 vTexDim;
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

			float atObjSize = 1.0;
			
			//gl_Position.x = in_PtPos.x;
			//gl_Position.y = in_PtPos.y;
			//gl_Position.z = in_PtPos.z;
			
		//	ivTexDim = ivec2(vTexDim);

            ///////////////////////////////////////////////////
            ///////////////// Select vertex  ///////////////////
            ///////////////////////////////////////////////////
            vec2 vSrc;
			if (nVertexID < 2){     // 0 || 1
                if(nVertexID == 0){
                    //////// Vertex 0 ////////
                    gl_Position = in_Pt1 * atObjSize; //w is mutliplied, fater than vec3?
					ioCorner = vec2(0.25,0.25);
					vSrc.x = in_TexSource0.x;
                    vSrc.y = in_TexSource0.y;
                }else{
                    //////// Vertex 1 ////////
                    gl_Position = in_Pt2 * atObjSize;
					ioCorner = vec2(0.75,0.25);
                    vSrc.x = in_TexSource0.z;
                    vSrc.y = in_TexSource0.w;
                }
			}else{                  // 2 || 3
                if(nVertexID == 2){
                    //////// Vertex 2 ////////
                    gl_Position = in_Pt3 * atObjSize;
                    ioCorner = vec2(0.75,0.75);
                    vSrc.x = in_TexSource1.x;
                    vSrc.y = in_TexSource1.y;

                }else{
                    //////// Vertex 3 ////////
                    gl_Position = in_Pt4 * atObjSize;
					ioCorner = vec2(0.25,0.75);
                    vSrc.x = in_TexSource1.z;
                    vSrc.y = in_TexSource1.w;
                }
			}
			
		if(   nType == 6){
		gl_Position.x += 40.0;
		}
			
			/*
			//BATCH ONLY
			switch(nVertexID){
				case 0 :
					gl_Position =  in_Pt1;
					coord_Corner = vec2(0.25,0.25);
					coord_Texture = (in_TexSource0.xy + 0.5)/ 200.0;
		
				break;
				case 1 :
					gl_Position =  in_Pt2;
					coord_Corner = vec2(0.75,0.25);
					coord_Texture = (in_TexSource0.zw + 0.5)/ 200.0;
				break;
				case 2 :
					gl_Position =  in_Pt3;
					coord_Corner = vec2(0.75,0.75);
					coord_Texture = (in_TexSource1.xy + 0.5)/ 200.0;
				break;
				case 3 :
					gl_Position =  in_Pt4;
					coord_Corner = vec2(0.25,0.75);
					coord_Texture = (in_TexSource1.zw + 0.5)/ 200.0;
				break;
			}
		*/
		
			//iResolution.y/2.0
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
			gl_Position.x = (((gl_Position.x ) + in_ObjPos.x + 0.5)   - iResolution.x/2.0) /  (iResolution.x/2.0);
			gl_Position.y = (((gl_Position.y ) + in_ObjPos.y + 0.499) - iResolution.y/2.0) / -(iResolution.y/2.0) ;
			gl_Position.z = 0.0;
			

			
			
			//vec2 vTexDim = vec2(200.0, 200.0);

			
			ioTexture.x = (vSrc.x + 0.5 ) / (vTexDim.x );
			ioTexture.y = (vSrc.y + 0.5 ) / (vTexDim.y );
			
			
			
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
				
					
	//out vec4 outputColor;

	uniform sampler2D TexCurrent;
	uniform sampler2D TexSource;
	uniform sampler2D TexFragPos;
	uniform sampler2D TexPixSrc;

	//uniform sampler2DArray TexArray;  

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

	
	
	xflat in mat4 iomColor;
	in vec2 ioCorner;
	in vec2 ioTexture;
	vec3 vDark;
	vec3 vLight;
	vec4 pixTex;


void main()
{
	
	if( nType == 4 ||  nType == 6){ //Normal

	//	vec4 vCoDist = texture(TexFragPos, ioCorner );
		//vec4 vPtDist = ( ioColor1 * vCoDist.a) + (ioColor2 * vCoDist.r) + (ioColor3 * vCoDist.b) + (ioColor4 * vCoDist.g);
     //   vec4 vPtDist = iomColor * vCoDist;
       // vec4 vPtDist = vec4(1.0, 0.5,0.5,0.5);
        vec4 vPtDist = vec4(0.0, 0.0, 0.0, 1.0);

		//if(ioSrcType == 1){

			//Normal
			//pixTex = texture(TexCurrent, ioTexture);

			/*
			vec2 _vPosTex = vec2( (ioPtSrc1.x + (vCoDist.b + vCoDist.r)*32.0)/511.0  ,  (ioPtSrc1.y + (vCoDist.b + vCoDist.g )*32.0)/514.0  );
			pixTex = texture(TexCurrent, _vPosTex);
			*/


			//float _nFactor =  1.0 - 0.01859375;  //.499/32 or .495
		//	if(vCoDist.a + vCoDist.r   > _nFactor  ||  vCoDist.r + vCoDist.b   > _nFactor ||  vCoDist.g + vCoDist.b   > _nFactor || vCoDist.g + vCoDist.a   > _nFactor){

			//	int _nRatio = 0;

				//Work
				//vec2 vPosTex = vec2(ioTexture.x * vTexDim.x, ioTexture.y  * vTexDim.y) - 0.5; //+2 px border

/*

				vec2 vPosTex = ioTexture * vTexDim * float(1 << nRetroRatio) - 0.5;
				ivec2 _vIPosTex = ivec2(vPosTex );
				vPosTL = (_vIPosTex) >> nRetroRatio;
				vPosTR = (_vIPosTex + ivec2(1, 0)) >> nRetroRatio;
				vPosBR = (_vIPosTex + ivec2(1, 1)) >> nRetroRatio;
				vPosBL = (_vIPosTex + ivec2(0, 1)) >> nRetroRatio;
*/

/*
				//float _nRatio = float(nRetroRatio);
				vec2 vPosTex = (ioTexture * vTexDim * vRetroR  - 0.5);
				ivec2 _vIPosTex = ivec2(vPosTex );

				vPosTL = ivec2(vPosTex / vRetroR);
				vPosTR =  ivec2((vPosTex + vec2(1.0-0.0001, 0.0))  / vRetroR);
				vPosBR =  ivec2((vPosTex + vec2(1.0-0.0001, 1.0-0.0001)) / vRetroR);
				vPosBL =  ivec2((vPosTex + vec2(0.0, 1.0-0.0001)) / vRetroR);


				if(vPosTL == ioSrcTL){
					vPosTL = ioOffsetTL; //Corner TL
				}else if(vPosTL.y == ioSrcTL.y){
					//vPosTL += ivec2(ioOffsetT1); //TOP
					vPosTL = ioOffsetT1 +  abs( ivec2(vPosTL.x - ioSrcOT.x, vPosTL.x - ioSrcOT.x) * nFlipD.xy ) ;  //TOP
					
				}else if(vPosTL.x == ioSrcTL.x){
					//vPosTL += ivec2(ioOffsetL1);  //Left
					vPosTL =  ioOffsetL1 + abs( ivec2(vPosTL.y - ioSrcOL.y,vPosTL.y - ioSrcOL.y) * nFlipD.yx  ) ;  //Left
				}

				if(vPosTR == ioSrcTR ){
					vPosTR = ioOffsetTR; //Corner TR
				}else if(vPosTR.y == ioSrcTR.y){
					//vPosTR += ivec2(ioOffsetT1); //Top
					vPosTR =  ioOffsetT1 +  abs(ivec2(vPosTR.x - ioSrcOT.x,vPosTR.x - ioSrcOT.x )* nFlipD.xy ) ;  //TOP
					
				}else if(vPosTR.x == ioSrcTR.x){
					//vPosTR += ivec2(ioOffsetR1); //RIGHT
					vPosTR = ioOffsetR1 + abs( ivec2(vPosTR.y - ioSrcOR.y,vPosTR.y - ioSrcOR.y )* nFlipD.yx  ) ; //RIGHT
				}

				if(vPosBR == ioSrcBR ){
					vPosBR = ioOffsetBR; //Corner BR
				}else if(vPosBR.y == ioSrcBR.y){

					vPosBR = ioOffsetB1 +  abs( ivec2(vPosBR.x - ioSrcOB.x, vPosBR.x - ioSrcOB.x) * nFlipD.xy  ) ;  //BOT
					
				}else if(vPosBR.x == ioSrcBR.x){

					vPosBR = ioOffsetR1 + abs( ivec2(vPosBR.y - ioSrcOR.y,vPosBR.y - ioSrcOR.y) * nFlipD.yx  ) ; //Right
				}


				if(vPosBL == ioSrcBL){
					vPosBL = ioOffsetBL; //Corner BL
					
				}else if(vPosBL.y == ioSrcBL.y){
					vPosBL = ioOffsetB1 +  abs( ivec2(vPosBL.x - ioSrcOB.x,vPosBL.x - ioSrcOB.x ) * nFlipD.xy ) ;  //BOT
					
				}else if(vPosBL.x == ioSrcBL.x){
					vPosBL =  ioOffsetL1 + abs( ivec2(vPosBL.y - ioSrcOL.y,vPosBL.y - ioSrcOL.y) * nFlipD.yx   );  //Left
				}
		

				vec4 vPixTL = texelFetch(TexCurrent, vPosTL,0);
				vec4 vPixTR = texelFetch(TexCurrent, vPosTR,0);
				vec4 vPixBR = texelFetch(TexCurrent, vPosBR,0);
				vec4 vPixBL = texelFetch(TexCurrent, vPosBL,0);


				vec2 vFracTL = 1.0 - fract(vPosTex );
				vec2 vFracBR = fract(vPosTex + 1.0 );

				float _nRAlphaTR = (vFracBR.x * vFracTL.y);
				float _nRAlphaBR = (vFracBR.x * vFracBR.y);
				float _nRAlphaBL = (vFracTL.x * vFracBR.y);
				//float _nRAlphaTL = (vFracTL.x * vFracTL.y) ;
				float _nRAlphaTL = 1.0 - (_nRAlphaTR +_nRAlphaBR + _nRAlphaBL) ;

				pixTex = vPixTL * _nRAlphaTL +  vPixTR * _nRAlphaTR +  vPixBR * _nRAlphaBR +  vPixBL * _nRAlphaBL;
				*/
		/*
			}else{
				pixTex = texture(TexCurrent, ioTexture);
			}*/

pixTex  = texture(TexCurrent, ioTexture);



/*
			ivec2 _vNearest = ivec2(int(ioTexture.x * 511.0 + 0.0001), int(ioTexture.y  * 514.0 + 0.0001 ));  //Text size + 2
	    	pixTex = texelFetch(TexCurrent, _vNearest,0);
			*/




			//Normal
			//pixTex = texture(TexCurrent, ioTexture);


			/*
			if(vCoDist.r + vCoDist.g  > _nFactor){ //  Near
				pixTex = vec4(1.0, 0.0 ,0.0 ,1.0);
			}*/

/*
			if(vCoDist.g + vCoDist.b  > _nFactor &&  vCoDist.r + vCoDist.b > _nFactor ){ // BR
				pixTex = vec4(1.0, 0.0 ,0.0 ,1.0);
			}*/

			/*
			if(vCoDist.a + vCoDist.r  > _nFactor &&  vCoDist.g + vCoDist.a > _nFactor ){ //  Near
				pixTex = vec4(1.0, 0.0 ,0.0 ,1.0);
			}*/


		//}else{ //No texture
		//	pixTex = vec4(0.0, 0.0 ,0.0 ,1.0);
		//}


		//Nearest
	//  ivec2 _vNearest = ivec2(int(ioTexture.x * 511.0), int(ioTexture.y  * 514.0 ));  //Text size + 2
	//  	pixTex = texelFetch(TexCurrent, _vNearest,0);




        //// Custom interpolated color ////
        vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
        pixTex.a *= vPtDist.a;

		//if(vCoDist.r + vCoDist.b   > 1.0 - 0.01546875){  //.495 ? Factoriel?  //0.98453125
			//pixTex = vec4(1,0.0,0.0,1);
		//}; //Top


       // FragColor =  pixTex;


        /////////////////////////////////////////////////////
        /////////////////////// LIGHT  /////////////////////
        /////////////////////////////////////////////////////
   // if(nType == 8){ //Unicolo (no Alpha)
        /////////////////////////  Phong light  ///////////////////
/*
        vec3 vPtWorld = vec3((iomWorldPt * vCoDist));
        vec3 vPtNorm =  ((iomNorm * vCoDist).xyz);

        vec3 light_position =  (vec3(1514 ,-384, -600.0));
        vec3 eye_position =   (vec3(500,384,-1024));


        vec3 L = normalize( light_position - vPtWorld);//light direction
        vec3 V = normalize( eye_position - vPtWorld);//view direction


        float LdotN = max(0, dot(L,vPtNorm));

        float diffuse = 0.85 * LdotN; //0.5 Just a random material

        float att_kC = 0.2;
        float att_kL = 0.0;
        float att_kQ = 0.5;

        //attenuation
        float d = distance( light_position,  vPtWorld) / 1024.0;
        float att = 1.0 / (att_kC + d * att_kL + d*d*att_kQ);


        float specular = 0;

        if(LdotN > 0.0){
          //choose H or R to see the difference
          vec3 R = -normalize(reflect(L, vPtNorm));//Reflection
            specular = 0.65 * pow(max(0, dot(R, V)), 0.15);

          //Blinn-Phong
         // vec3 H = normalize(L + V );//Halfway
         // specular = 0.65 * pow(max(0, dot(H, vPtNorm)), 0.65);
        }
*/

/*
        //// Diffuse ////
        vColorDiffuse.rgb = (vColorDiffuse.rgb +  1.0) * ((att *diffuse)*vColorDiffuse.a+(1.0-vColorDiffuse.a));
        vDark  = clamp(vColorDiffuse.rgb, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vColorDiffuse.rgb - 1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vDark);


        // Specular
        vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * att * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  );
*/

   // }
//pixTex.a = 0.5;


        FragColor =  pixTex;
       // FragColor =  texture(TexCurrent, ioTexture);

        /*
		if(ioSrcType == 2.0){
            FragColor =  vec4( vCoDist.x, vCoDist.y, vCoDist.z,1.0);
		}
		*/
		//vCoDist.b + vCoDist.r,
		//vCoDist.b + vCoDist.g,
		 //FragColor =  vec4( 0, vCoDist.b + vCoDist.r, 0,1.0);

	}
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
			oUiTime = new UnFloat(oProgram, "iTime");
			oUiMouse = new UnVec2(oProgram, "iMouse");
			oUiResolution = new UnVec2(oProgram, "iResolution");
			
			oUnType = new UnInt(oProgram, "nType");

			

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
			oUiMouse.fSend();
			
			oUiResolution.vVal.nX  = Context.nFrameWidth;
			oUiResolution.vVal.nY  = Context.nFrameHeight;
			oUiResolution.fSend();
			
		
			oGpuBatch.fDraw();
	
		//	Debug.fTrace("Size: " + oAt.oVbo.aData.nSize)
			//Debug.fTrace("!" +  oAt.aData[0]  );
			
			
			//if(bTest == false){
			//	bTest = true;
		
			if(nTest  < 2){
				Debug.fTrace("-------------------------------");
				//for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=4){
				for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=8){
					Debug.fTrace("[" +  oAt.oVbo.aData[i] + "," +  oAt.oVbo.aData[i+1] + "," +  oAt.oVbo.aData[i+2] + "," +  oAt.oVbo.aData[i+3] + "]" );
				}
				nTest++;
			}
			
	
			/*
			forEach(var _nData : Float in oAt.aData){
			
			}*/
			//Debug.fTrace(oAt.aData);
		}
		
		
	}
}