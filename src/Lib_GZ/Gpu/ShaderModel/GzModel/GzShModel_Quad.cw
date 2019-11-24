package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Texture;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.UnVec4;
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

		public var oAt : Attribute_Quad;
		
		public var nTest : Int = 0;
		
		public var oVbo : Vbo;
		
	
		
		public function GzShModel_Quad():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
			
		
		}
		
		public function fLoad():Bool {
			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
			oVbo = new Vbo(oProgram);
			
			oAt = new Attribute_Quad(oVbo);
			Attribute_Quad = oAt; //Singleton
			
	
<glsl(oVertex)>
				

//uniform sampler2D TexCurrent; 
	uniform vec2 vTexCurrent;
	
//uniform sampler2D TexNormal;
	uniform vec2 vTexNormal;
	
//uniform sampler2D TexSprites;
	uniform vec2 vTexSprites;


				
	uniform int nType;

	in vec4 in_ObjPos; //x, y, z, ???? 
	//in vec4 in_ObjRot; // Roll, Yaw, Pitch, Focal
	in vec4 in_ObjRot; //Quaternion -> x, y, z, w
	in vec4 in_ObjSize;  //Width,Height,Length, ????
	
	in vec4 in_Pt1;  //x,y,z, Width
	in vec4 in_Pt2;  //x,y,z, Height
	in vec4 in_Pt3;  //x,y,z, Length
	in vec4 in_Pt4;  //x,y,z, ?????
	
	in vec2 in_TexCoord0;  //Sx1,Sy1,Sx2,Sy2 
	in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4
	in vec4 in_Color1; //R,G,B,A
	////  in vec4 in_LimitRender;  //Limit render ... in uniform? <----

	//AylasID, UniformActionID, Type

	////  in vec4 in_AchorRoll;  //pt1,pt2,pt3,pt4  
	////  in vec4 in_AchorPt1;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt2;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt3;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt4;  //x1,y1,x2,x2  

	in vec3 in_PtPos;       //Remove     
	//in vec2 in_Corner;      //Remove     
	in vec4 in_Color2;   //Remove     
	in vec4 in_Color3;   //Remove     
	in vec4 in_Color4;   //Remove     


	uniform vec4 vPersp;
	
	
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
	//uniform vec2 vTexDim;
	//in int gl_VertexID;
	

smooth out vec2 uv; //Current UV

//LIGHT
float nFrontFacing;

xflat out vec3 ioPt1;
xflat out vec3 ioPt2;
xflat out vec3 ioPt3;
xflat out vec3 ioPt4;

xflat out vec3 ioNorm;
/*
xflat out vec3 ioNorm1;
xflat out vec3 ioNorm2;
xflat out vec3 ioNorm3;
xflat out vec3 ioNorm4;
*/
xflat out mat4 iomWorldPt;
xflat out mat4 iomNorm;
/////////


	
vec3 fQRot( vec3 pt, vec4 rot)       {
	return pt + 2.0*cross(rot.xyz, cross(rot.xyz,pt) + rot.w*pt);
}

//rotate vector
vec3 fQRot3(vec4 q, vec3 v)       {
	return v + 2.0*cross(q.xyz, cross(q.xyz,v) + q.w*v);
}
//rotate vector (alternative)
vec3 fQRot_2(vec3 pt, vec4 rot )     {
	return pt*(rot.w*rot.w - dot(rot.xyz,rot.xyz)) + 2.0*rot.xyz*dot(rot.xyz,pt) + 2.0*rot.w*cross(rot.xyz,pt);
}
//combine quaternions
vec4 fQMul(vec4 a, vec4 b)       {
	return vec4(cross(a.xyz,b.xyz) + a.xyz*b.w + b.xyz*a.w, a.w*b.w - dot(a.xyz,b.xyz));
}
//inverse quaternion
vec4 fQInv(vec4 q)       {
	return vec4(-q.xyz,q.w);
}
//perspective project
vec4 get_projection(vec3 v, vec4 pr)    {
	return vec4( v.xy * pr.xy, v.z*pr.z + pr.w, -v.z);
}
//transform by Spatial forward
vec3 fWoldTrans(vec3 v, vec3 pos, vec4 rot,  vec3 size){
   // return fQRot(rot, v*size) + pos.xyz;
	return fQRot3(rot, v) + pos.xyz;
}
//transform by Spatial inverse
vec3 fWoldTransInv(vec3 v, vec3 pos, vec4 rot,  vec3 size){
	return fQRot3( vec4(-rot.xyz, rot.w), (v - pos)/size );
}
	

	void main(){
			/*
			//Normal 2D
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

			//float atObjSize = 1.0;
			
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
					uv = vec2(0,0);
					//color = in_Color1;
					//vCoDist = vec4(1.0,0.0,0.0,0.0);
					
                    gl_Position = in_Pt1; 
					ioCorner = vec2(0.25,0.25);
					vSrc.x = in_TexSource0.x;
                    vSrc.y = in_TexSource0.y;
                }else{
				
					uv = vec2(1,0);
				//	color = in_Color2;
					//vCoDist = vec4(0.0,1.0,0.0,0.0);
		
                    //////// Vertex 1 ////////
                    gl_Position = in_Pt2;
					ioCorner = vec2(0.75,0.25);
                    vSrc.x = in_TexSource0.z;
                    vSrc.y = in_TexSource0.w;
                }
			}else{                  // 2 || 3
                if(nVertexID == 2){
                    //////// Vertex 2 ////////
					uv = vec2(1,1);
					//color = in_Color3;
					//vCoDist = vec4(0.0,0.0,1.0,0.0);
					
                    gl_Position = in_Pt3;
                    ioCorner = vec2(0.75,0.75);
                    vSrc.x = in_TexSource1.x;
                    vSrc.y = in_TexSource1.y;

                }else{
                    //////// Vertex 3 ////////
					uv = vec2(0,1);
					//color = in_Color4;
					//vCoDist = vec4(0.0,0.0,0.0,1.0);
					
                    gl_Position = in_Pt4;
					ioCorner = vec2(0.25,0.75);
                    vSrc.x = in_TexSource1.z;
                    vSrc.y = in_TexSource1.w;
                }
			}
		
		gl_Position.xyz *=  in_ObjSize.xyz;

		//Quaternion
		gl_Position.xyz = fQRot(gl_Position.xyz, in_ObjRot);

		//////////// 3D To 2D ////////////////////
		vec3 _vObjPos = in_ObjPos.xyz;

		float nZx = ((gl_Position.z + _vObjPos.z) * vPersp.z) + 1.0;
		
		if(vPersp.w == 1.0){ //Self perspective
			gl_Position.xy = (gl_Position.xy ) / nZx;
		}else{
			gl_Position.xy = (gl_Position.xy + (_vObjPos.xy - vPersp.xy) ) / nZx - (_vObjPos.xy - vPersp.xy);
		}
		///////////// 2D to Screen ////////////////////
		gl_Position.w = nZx;
		gl_Position.x = (((gl_Position.x ) + _vObjPos.x  ) - (iResolution.x/2.0) )/ (iResolution.x/2.0) * nZx ;
		gl_Position.y = (((gl_Position.y ) + _vObjPos.y )  - (iResolution.y/2.0)) / (iResolution.y/2.0) * nZx;
		gl_Position.z =  0.0;
		///////////////////////////////////////////////
		
		gl_Position.y = 1.0 - gl_Position.y - 1.0; //FlipY

		//////////// SRC ///////////////
		ioTexture.x = (vSrc.x + 0.5 ) / (vTexCurrent.x );
		ioTexture.y = (vSrc.y + 0.5 ) / (vTexCurrent.y );
		////////////////////////////////
		
		//Send color
		coord_Color1 = in_Color1;
		//coord_Color2 = in_Color2;
		//coord_Color3 = in_Color3;
		//coord_Color4 = in_Color4;
		
		coord_Pt1 = in_Pt1;
		coord_Pt2 = in_Pt2;
		coord_Pt3 = in_Pt3;
		coord_Pt4 = in_Pt4;
		
		
		
		///////////////////////////////////
		//////////// LIGHT ////////////////
		///////////////////////////////////
		
		ioPt1 = in_Pt1.xyz * in_ObjSize.xyz;
		ioPt2 = in_Pt2.xyz * in_ObjSize.xyz;
		ioPt3 = in_Pt3.xyz * in_ObjSize.xyz;
		ioPt4 = in_Pt4.xyz * in_ObjSize.xyz;

		////////////// All Rotation  ///////////
		ioPt1.xyz = fQRot(ioPt1.xyz, in_ObjRot);
		ioPt2.xyz = fQRot(ioPt2.xyz, in_ObjRot);
		ioPt3.xyz = fQRot(ioPt3.xyz, in_ObjRot);
		ioPt4.xyz = fQRot(ioPt4.xyz, in_ObjRot);

		vec3 pt1 = ioPt1;
		vec3 pt2 = ioPt2;

		nZx = ((pt1.z + _vObjPos.z) * vPersp.z) + 1.0;\n
		pt1.x = (pt1.x + (_vObjPos.x - vPersp.x) ) / nZx - (_vObjPos.x - vPersp.x);\n
		pt1.y = (pt1.y + (_vObjPos.y - vPersp.y) ) / nZx - (_vObjPos.y - vPersp.y);\n

		nZx = ((pt2.z + _vObjPos.z) * vPersp.z) + 1.0;\n
		pt2.x = (pt2.x + (_vObjPos.x - vPersp.x) ) / nZx - (_vObjPos.x - vPersp.x);\n
		pt2.y = (pt2.y + (_vObjPos.y - vPersp.y) ) / nZx - (_vObjPos.y - vPersp.y);\n

		
		
		nFrontFacing = 1.0;
		/*
	   if(cross(pt1, pt2).z < 1.0 ){
			nFrontFacing = -1.0;
		}else{
			nFrontFacing = 1.0;
		}
			*/
		 //If both = anulation
		if(in_ObjSize.x < 0.0){ //Reverse width
		   nFrontFacing *= -1.0;
		}
		if(in_ObjSize.y < 0.0){ //Reverse height
		   nFrontFacing *= -1.0;
		}

		ioNorm = normalize(vec3(0.0,0.0,1.0 * nFrontFacing  ));
		ioNorm.xyz = fQRot_2(ioNorm.xyz, in_ObjRot);
		/*
		ioNorm1 = normalize(vec3(-1.0,-1.0,-9.0 * nFrontFacing ));
		ioNorm2 = normalize(vec3( 1.0,-1.0,-9.0 * nFrontFacing));
		ioNorm3 = normalize(vec3( 1.0, 1.0,-9.0 * nFrontFacing ));
		ioNorm4 = normalize(vec3(-1.0, 1.0,-9.0 * nFrontFacing ));
	

		ioNorm1.xyz = fQRot_2(ioNorm1.xyz, in_ObjRot);
		ioNorm2.xyz = fQRot_2(ioNorm2.xyz, in_ObjRot);
		ioNorm3.xyz = fQRot_2(ioNorm3.xyz, in_ObjRot);
		ioNorm4.xyz = fQRot_2(ioNorm4.xyz, in_ObjRot);
		
		iomNorm[0] = vec4(ioNorm1,0);
		iomNorm[1] = vec4(ioNorm2,0);
		iomNorm[2] = vec4(ioNorm3,0);
		iomNorm[3] = vec4(ioNorm4,0);
	*/
	
		iomWorldPt[0] = vec4( ioPt1 + _vObjPos.xyz,0);
		iomWorldPt[1] = vec4(ioPt2 + _vObjPos.xyz,0);
		iomWorldPt[2] = vec4(ioPt3 + _vObjPos.xyz,0);
		iomWorldPt[3] = vec4(ioPt4 + _vObjPos.xyz,0);


		//////////////////////////////////////////////////////
		/////////////////////////////////////////////////////
		
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
				
	uniform sampler2D TexCurrent; 
	uniform vec2 vTexCurrent;
	
	uniform sampler2D TexNormal;
	uniform vec2 vTexNormal;
	
	uniform sampler2D TexSprites;
	uniform vec2 vTexSprites;


	
	//out vec4 outputColor;

//	uniform sampler2D TexCurrent;
//	uniform sampler2D TexSource;
	//uniform sampler2D TexFragPos;
	//uniform sampler2D TexPixSrc;

	//uniform sampler2DArray TexArray;  

	//in vec2 coord_TextureSource;
	in vec2 coord_Texture;
	in vec2 coord_Corner;

	flat in vec4 coord_Color1;
	//flat in vec4 coord_Color2;
	//flat in vec4 coord_Color3;
	//flat in vec4 coord_Color4;

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
	//uniform vec2 vTexDim;
	
	
	xflat in mat4 iomColor;
	in vec2 ioCorner;
	in vec2 ioTexture;
	vec3 vDark;
	vec3 vLight;
	vec4 pixTex;



/////////////

xflat in mat4 iomWorldPt;
//xflat in mat4 iomNorm;
xflat in vec3 ioNorm; // Maybe if we get it from world norm

//vec4  vColorSpecular = vec4(2.0, 2.0, 1.5, 1.0); //0 to X Can be premultiplied with alpha
//vec4  vColorDiffuse = vec4(1.5,1.5,1.5, 1.5);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
//vec3 vAmbient = vec3(0.2, 0.2, 0.2);



vec4  vColorSpecular = vec4(1.0,1.0,0.2 , 2.5); //0 to X Can be premultiplied with alpha
vec4  vColorDiffuse = vec4(1.0, 1.0, 1.0, 1.75);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
vec3 vAmbient = vec3(-1.0, -1.0, -1.0); // -1.0 to 1.0

//0 to 1
float att_kC = 1.02; //Kc is the constant attenuation
float att_kL = 0.20; //KL is the linear attenuation
float att_kQ = 0.002; //KQ is the quadratic attenuation

vec3 eye_position = vec3(  400.0, 300.0, -500.0);
//vec3 light_position  =   vec3( 400.0,300.0, -300.0);
vec3 light_position  =   vec3( 200.0, -100.0, -400.0);






////////////
	
smooth in vec2 uv;
	
void main()
{
	/// Make a bilinear interpolation from uv ///
	vec4 _vCoDist = vec4((1.0-uv.x)*(1.0-uv.y), (uv.x)*(1.0-uv.y), (uv.x)*(uv.y), (1.0-uv.x)*(uv.y));
	////////////////////////////////////////
	
	if( nType == 4 ||  nType == 6){ //Normal

      //  vec4 vPtDist = vec4(0.0, 0.0, 0.0, 1.0); //No Color
		//vec4 vPtDist = ( coord_Color1 * _vCoDist.a) + (coord_Color2 * _vCoDist.r) + (coord_Color3 * _vCoDist.b) + (coord_Color4 * _vCoDist.g);

	//	vec4 vCoDist = texture(TexFragPos, ioCorner );
     //   vec4 vPtDist = iomColor * vCoDist;
	 
		//vec4 vPtDist = vec4(1.0, 0.0, 0.0, 0.5); //No Color
		vec4 vPtDist = coord_Color1; 
	//	vec4 vPtDist = _vQuadColor; 
		
	if( nType == 6){

	//Normal
	//pixTex = texture(TexCurrent, ioTexture);
	//pixTex = vec4(0.5,0.5,0.5,0.5);
	}else{
	//	pixTex = texture(TexCurrent, ioTexture);
	}

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




    
		//////////////////////////////////
		
		//if(vCoDist.r + vCoDist.b   > 1.0 - 0.01546875){  //.495 ? Factoriel?  //0.98453125
			//pixTex = vec4(1,0.0,0.0,1);
		//}; //Top


       // FragColor =  pixTex;


        /////////////////////////////////////////////////////
        /////////////////////// LIGHT  /////////////////////
        /////////////////////////////////////////////////////
   // if(nType == 8){ //Unicolo (no Alpha)
        /////////////////////////  Phong light  ///////////////////

        vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
       // vec3 vPtNorm =  (iomNorm * _vCoDist).xyz;
		vec3 vPtNorm =  ioNorm.xyz;
		// vPtNorm.z =  vPtNorm.z * -1.0;

       // vec3 light_position =  (vec3(1514 ,-384, -600.0));
       // vec3 light_position = vec3(1514.0 ,-200.0, -800.0);
        //vec3 eye_position =   vec3( 500.0,  384.0,-1024.0);


           vec3 L = ( vPtWorld -light_position     );//light direction
        vec3 V = ( vPtWorld - eye_position  );//view direction


       // vec3 L = normalize( light_position - vPtWorld);//light direction
       // vec3 V = normalize( eye_position - vPtWorld);//view direction



        float LdotN = max(0.0, dot(L,vPtNorm));

        float diffuse = 0.50 * LdotN; //0.5 Just a random material

		
		//http://in2gpu.com/2014/06/19/lighting-vertex-fragment-shader/
		

 

        //attenuation
       // float d = distance( light_position,  vPtWorld) / 800.0;
        float d = distance( (light_position),  (vPtWorld.xyz) );
		//d =  1.5;
        float att = 1.0 / (att_kC + d * att_kL + d*d*att_kQ); //Do the inverse
     //   float att =  (att_kC + d * att_kL + d*d*att_kQ);


        float specular = 0.0;
 if(LdotN > 0.0){
          //choose H or R to see the difference
          vec3 R = -normalize(reflect(L, vPtNorm));//Reflection
           // specular = 0.65 * pow(max(0.0, dot(R, V)), 512); //https://learnopengl.com/Lighting/Basic-Lighting
		//specular = material_kd * pow(max(0, dot(H, world_normal)), material_shininess);
            specular = 0.20 *  pow(max(0.0, dot(R, V)), 1.9);//0.15  https://learnopengl.com/Lighting/Basic-Lighting
		
          //Blinn-Phong
          vec3 H = normalize(L + V );//Halfway
          specular = 100.65 * pow(max(0.0, dot(H, vPtNorm)), 7.8);
		  
        }

		
		  //// Custom interpolated color ////
        vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
        pixTex.a *= vPtDist.a;
		
	
	
        //// Diffuse ////
     
		//vColorDiffuse.rgb = (vColorDiffuse.rgb) * ((att *diffuse)*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
	//	vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse*att )*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
		vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse*att )*vColorDiffuse.a) + vAmbient;
		
		vDark  = clamp(vColorDiffuse.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vColorDiffuse.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  * vDark);
		

		
		//vPtDist += vColorDiffuse + vec4(vAmbient,0.0);
	

        // Specular
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * att * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
       // vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * (specular *att)  -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * ((specular *att)-1.0), 0.0, 1.0); //0 a 1 -> = 0 if Dark
        vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * ((specular *att)), 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  );



   // }
//pixTex.a = 0.5;


        FragColor =  pixTex;
       // FragColor =  vColorDiffuse + vec4(vAmbient,0.0);
      //  FragColor =  vec4(diffuse*10.0, 0.0 ,1.0,1.0);
       // FragColor =  vec4(iomNorm[0].xyz,1.0);
		
		
      //  FragColor =  vec4(vColorDiffuse.rgb+ vec3(1.0,1.0,1.0) , 1.0);
       // FragColor =  vec4(1.0, 0.5, 0.5, 0.5);
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
	
	

	//FragColor = vec4( _vQuadColor.g, 0.0, 0.0, 1.0);
	//FragColor = vec4( _vQuadColor.rgb, 1.0);
	//FragColor = vec4( (1.0-uv.x)*(uv.y), 0.0 ,0.0,  1.0);
	
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
			oUvPersp = new UnVec4(oProgram, "vPersp");

			

		//	var _oPersv : Perspective = new Perspective();
			
			
			
		
			
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
			oVbo.fIniData(Context.oItf.nTotalFaces, 4, 13);
		
			oAt.fIniData( );
		}
		
		public function fUpdate():Void {
		
			oVbo.fSendData();
			//oAt.fUpdate();
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
			
		
		
			//Default Perspective
			//TODO get perspective from current buffer!
			
			oUvPersp.vVal.nX = Context.oItf.oPerspective.nFromX;//nFromX
			oUvPersp.vVal.nY = Context.oItf.oPerspective.nFromY;//nFromY
			oUvPersp.vVal.nZ = Context.oItf.oPerspective.nValue;//nValue
			oUvPersp.vVal.nW = Context.oItf.oPerspective.nType; //nType
			oUvPersp.fSend();
			
			
			oGpuBatch.fDraw();
	
			//Debug.fTrace("oUvPersp: " +oUvPersp.vVal.nX + ", " + oUvPersp.vVal.nY + ", " + oUvPersp.vVal.nZ + ", " + oUvPersp.vVal.nW )
			//Debug.fTrace("!" +  oAt.aData[0]  );
			
			
			//if(bTest == false){
			//	bTest = true;
		/*
			if(nTest  < 3){
				Debug.fTrace("------------------------------- " + nTest);
				Debug.fTrace("----Size ---- " + oAt.oVbo.aData.nSize);
				//for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=4){
				for(var i : Int = 0; i  < oAt.oVbo.aData.nSize; i+=8){
					Debug.fTrace("[" +  oAt.oVbo.aData[i] + "," +  oAt.oVbo.aData[i+1] + "," +  oAt.oVbo.aData[i+2] + "," +  oAt.oVbo.aData[i+3] + "]" );
				}
				nTest++;
			}
			*/
	
			/*
			forEach(var _nData : Float in oAt.aData){
			
			}*/
			//Debug.fTrace(oAt.aData);
		}
		
		
	}
}