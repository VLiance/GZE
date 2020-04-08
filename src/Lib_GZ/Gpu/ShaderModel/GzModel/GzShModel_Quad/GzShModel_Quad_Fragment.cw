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
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Quad.GzShModel_Quad;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Base;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;

	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public extension GzShModel_Quad_Fragment extends GzShModel {
	
		override public function fLoad_Fragment():Bool {
		
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			
			
			//GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
			
			///////////// Fragment Shader //////////////
<glsl(oFragement)>
		
	
	
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

	//uniform int nType;
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

#define nType iomWorldPt[0].w
#define iTexID int(iomWorldPt[1].w)
//#define iTexID 0



//vec4  vColorSpecular = vec4(2.0, 2.0, 1.5, 1.0); //0 to X Can be premultiplied with alpha
//vec4  vColorDiffuse = vec4(1.5,1.5,1.5, 1.5);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
//vec3 vAmbient = vec3(0.2, 0.2, 0.2);



vec4  vColorSpecular = vec4(1.0,1.0, 0.85 , 0.7); //0 to X Can be premultiplied with alpha
vec4  vColorDiffuse = vec4(1.0, 1.0, 1.0, 1.75);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
vec3 vAmbient = vec3(-1.0, -1.0, -1.0); // -1.0 to 1.0

//0 to 1
float att_kC = 1.02; //Kc is the constant attenuation
float att_kL = 0.20; //KL is the linear attenuation
float att_kQ = 0.002; //KQ is the quadratic attenuation


//vec3 light_position  =   vec3( 400.0,300.0, -300.0);
vec3 eye_position = vec3(  400.0, 300.0, -500.0);
vec3 light_position  =   vec3( 200.0, -100.0, -400.0);




////////////
	
smooth in vec2 uv;
	
	

	
void main()
{
	/// Make a bilinear interpolation from uv ///
	vec4 _vCoDist = vec4((1.0-uv.x)*(1.0-uv.y), (uv.x)*(1.0-uv.y), (uv.x)*(uv.y), (1.0-uv.x)*(uv.y));
	////////////////////////////////////////
	
	
	if(   nType == 4.0 ||  nType == 6.0 ||  nType == 7.0 || nType == 8.0){ //Normal

      //  vec4 vPtDist = vec4(0.0, 0.0, 0.0, 1.0); //No Color
		//vec4 vPtDist = ( coord_Color1 * _vCoDist.a) + (coord_Color2 * _vCoDist.r) + (coord_Color3 * _vCoDist.b) + (coord_Color4 * _vCoDist.g);

	//	vec4 vCoDist = texture(TexFragPos, ioCorner );
     //   vec4 vPtDist = iomColor * vCoDist;
	 
		//vec4 vPtDist = vec4(1.0, 0.0, 0.0, 0.5); //No Color
		vec4 vPtDist = coord_Color1; 
	//	vec4 vPtDist = _vQuadColor; 
			
		if( nType == 6.0){

		//Normal
		//pixTex = texture(TexCurrent, ioTexture);
		//pixTex = vec4(0.5,0.5,0.5,0.5);
		}else{
		//	pixTex = texture(TexCurrent, ioTexture);
		}
		
			
		if( nType == 8.0 ){ //Vector Line<
		
			//pixTex = vec4(0.0, 1.0, 0.5, 1.0);
			pixTex = vPtDist;
			//pixTex.a =1.0- (uv.y*uv.y);
			pixTex.a = (1.0- (uv.y*uv.y))*vPtDist.a;
			
			
		}else{
			
		//pixTex  = texture(TexCurrent, ioTexture);
			//pixTex  = texture(Texture[iTexID], ioTexture);
			pixTex = fTexture(iTexID, ioTexture);

		}

float _nDepth = 0.0;




</glsl>
	fInsert_Body_Fragment();
<glsl(oFragement)>


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
		
		
		
		
		vPtNorm.z += _nDepth;
		
		
		
		// vPtNorm.z =  vPtNorm.z * -1.0;

       // vec3 light_position =  (vec3(1514 ,-384, -600.0));
       // vec3 light_position = vec3(1514.0 ,-200.0, -800.0);
        //vec3 eye_position =   vec3( 500.0,  384.0,-1024.0);

//http://in2gpu.com/2014/06/19/lighting-vertex-fragment-shader/
		

      
       // vec3 L = normalize( light_position - vPtWorld);//light direction
       // vec3 V = normalize( eye_position - vPtWorld);//view direction
	   
//vec3 eye_position = vec3(  400.0, 300.0, -500.0);      //0.8, 0.6, -1.0
//vec3 light_position  =   vec3( 200.0, -100.0, -400.0); //0.5, 0.25, 1.0;

		vec3 L = normalize( vPtWorld -light_position     );//light direction
        vec3 V = normalize( vPtWorld - eye_position  );    //view direction
        //float d = distance( (light_position),  (vPtWorld.xyz) ) / 800.0;
       // float d = distance( normalize(light_position),  normalize(vPtWorld.xyz) ) ;
        float d = distance( (light_position)/ 800.0,  (vPtWorld.xyz)/ 800.0 ); 
		
		

        float LdotN = max(0.0, dot(L,vPtNorm));
        float diffuse = 0.50 * LdotN; //0.5 Just a random material

        //attenuation

		
		
	
        float att =  (att_kC + d * att_kL + d*d*att_kQ); //Do the inverse
     //   float att =  (att_kC + d * att_kL + d*d*att_kQ);
	
	 
	 
        float specular = 0.0;
		
		if(LdotN > 0.0){
          //choose H or R to see the difference
          vec3 R = -normalize(reflect(L, vPtNorm));//Reflection
          specular = 0.20 *  pow(max(0.0, dot(R, V)), 1.9);//0.15  https://learnopengl.com/Lighting/Basic-Lighting
		
          //Blinn-Phong
          vec3 H = normalize(L + V );//Halfway
          specular = 0.3 * pow(max(0.0, dot(H, vPtNorm)), 7.8);
        }

		
		
		
		
	
		
		
		  //// Custom interpolated color ////
        vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
        pixTex.a *= vPtDist.a;
		
	
	
        //// Diffuse ////
     
		//vColorDiffuse.rgb = (vColorDiffuse.rgb) * ((att *diffuse)*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
	//	vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse*att )*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
		vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse/att )*vColorDiffuse.a) + vAmbient;
		
		vDark  = clamp(vColorDiffuse.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vColorDiffuse.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  * vDark);
		

		
		//vPtDist += vColorDiffuse + vec4(vAmbient,0.0);
	

        // Specular
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * att * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
       // vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * (specular *att)  -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * ((specular *att)-1.0), 0.0, 1.0); //0 a 1 -> = 0 if Dark
        vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * ((specular /att)), 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  );


		
		
		
	

   // }
//pixTex.a = 0.5;

//FragColor = vec4( 0.5, 0.5, 0.5, 1.0);

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
		}
		
		
		public function fInsert_Body_Fragment():Void{ ///overrided
		}
		

	}
}