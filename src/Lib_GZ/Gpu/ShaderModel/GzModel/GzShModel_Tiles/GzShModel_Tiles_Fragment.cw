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
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Tiles.GzShModel_Tiles;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Base;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;

	
	public extension GzShModel_Tiles_Fragment extends GzShModel {

		override public function fLoad_Fragment():Bool {
			
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
		
			///////////// Fragment Shader //////////////
<glsl(oFragement)>
	
//11 variyng vector


vec4 vPixTL;
vec4 vPixTR;
vec4 vPixBR;
vec4 vPixBL;


ivec2 vPosTL;
ivec2 vPosTR;
ivec2 vPosBR;
ivec2 vPosBL;

/////////////////////////////////////////////

		
	//out vec4 outputColor;

	uniform sampler2D TexCurrent; 
		uniform vec2 vTexCurrent;
		
	uniform sampler2D TexNormal;
		uniform vec2 vTexNormal;
		
	uniform sampler2D TexSprites;
		uniform vec2 vTexSprites;
		
	//uniform sampler2D TexSource;
	//uniform sampler2D TexFragPos;
	//uniform sampler2D TexPixSrc;

	//uniform sampler2DArray TexArray;  

	//in vec2 coord_TextureSource;


/////// 2 varying
xflat in ivec2 ioSrcTL;
xflat in ivec2 ioSrcTR;
xflat in ivec2 ioSrcBR;
xflat in ivec2 ioSrcBL;

/////// 2 varying
xflat in ivec2 ioSrcOT;
xflat in ivec2 ioSrcOR;
xflat in ivec2 ioSrcOB;
xflat in ivec2 ioSrcOL;

/////// 2 varying
xflat in ivec2 ioOffsetL1;
xflat in ivec2 ioOffsetT1;
xflat in ivec2 ioOffsetR1;
xflat in ivec2 ioOffsetB1;

/////// 2 varying
xflat in ivec2 ioOffsetTL;
xflat in ivec2 ioOffsetTR;
xflat in ivec2 ioOffsetBR;
xflat in ivec2 ioOffsetBL;
//8 variyng vector

xflat in ivec2 vFlip; //Sure?

xflat in vec4 coord_Color1;

/////////////
xflat in mat4 iomWorldPt; //Removed for tri


//xflat in mat4 iomNorm;
in vec2 ioTexture; //To rem

xflat in vec3 ioNorm; //

smooth in vec2 uv;
smooth in vec3 vTriPtWorld;
	
	
//#define nType iomWorldPt[0].w
#define iTexID int(iomWorldPt[1].w)



vec4 pixTex;



xflat in float nTypeVal;
xflat in int iTexIDVal;
#define nType nTypeVal
//#define iTexID iTexIDVal





// http://www.thetenthplanet.de/archives/1180
mat3 cotangent_frame(vec3 N, vec3 p, vec2 uv)
{
    // get edge vectors of the pixel triangle
    vec3 dp1 = dFdx( p );
    vec3 dp2 = dFdy( p );
    vec2 duv1 = dFdx( uv );
    vec2 duv2 = dFdy( uv );
 
    // solve the linear system
    vec3 dp2perp = cross( dp2, N );
    vec3 dp1perp = cross( N, dp1 );
    vec3 T = dp2perp * duv1.x + dp1perp * duv2.x;
    vec3 B = dp2perp * duv1.y + dp1perp * duv2.y;
 
    // construct a scale-invariant frame 
    float invmax = inversesqrt( max( dot(T,T), dot(B,B) ) );
    return mat3( T * invmax, B * invmax, N );
}

/*
vec3 perturb_normal( vec3 N, vec3 V, vec2 texcoord )
{
    // assume N, the interpolated vertex normal and 
    // V, the view vector (vertex to eye)
   vec3 map = texture(tex1, texcoord ).xyz;
   map = map * 255./127. - 128./127.;
    mat3 TBN = cotangent_frame(N, -V, texcoord);
    return normalize(TBN * map);
}
*/




void main()
{

//nType = iomWorldPt[0].w;


	/// Make a bilinear interpolation from uv ///
	vec4 _vCoDist = vec4((1.0-uv.x)*(1.0-uv.y), (uv.x)*(1.0-uv.y), (uv.x)*(uv.y), (1.0-uv.x)*(uv.y));
	////////////////////////////////////////
		vec4 vPtDist = coord_Color1; 
		
	if( nType == 8.0 ){ //Vector Line<
		
			//pixTex = vec4(0.0, 1.0, 0.5, 1.0);
			pixTex = vPtDist;
			pixTex.a = (1.0- (uv.y*uv.y))*vPtDist.a;
			FragColor =  pixTex;
			return;
		
	}else if( nType == 4.0 ||  nType == 6.0){ //Normal

      //  vec4 vPtDist = vec4(0.0, 0.0, 0.0, 1.0); //No Color
		//vec4 vPtDist = ( coord_Color1 * _vCoDist.a) + (coord_Color2 * _vCoDist.r) + (coord_Color3 * _vCoDist.b) + (coord_Color4 * _vCoDist.g);

	//	vec4 vCoDist = texture(TexFragPos, ioCorner );
     //   vec4 vPtDist = iomColor * vCoDist;
	 
		//vec4 vPtDist = vec4(1.0, 0.0, 0.0, 0.5); //No Color
	
	//	vec4 vPtDist = _vQuadColor; 
		
	if( nType == 6.0){

			//Normal
			//pixTex = texture(TexCurrent, ioTexture);

			
			//vec2 _vPosTex = vec2( (ioPtSrc1.x + (vCoDist.b + vCoDist.r)*32.0)/511.0  ,  (ioPtSrc1.y + (vCoDist.b + vCoDist.g )*32.0)/514.0  );
			//pixTex = texture(TexCurrent, _vPosTex);
			


			//float _nFactor =  1.0 - 0.01859375;  //.499/32 or .495
		//	if(vCoDist.a + vCoDist.r   > _nFactor  ||  vCoDist.r + vCoDist.b   > _nFactor ||  vCoDist.g + vCoDist.b   > _nFactor || vCoDist.g + vCoDist.a   > _nFactor){

				//int _nRatio = 0;
				//int nRetroRatio = 4;

				//Work
				//vec2 vPosTex = vec2(ioTexture.x * vTexDimFetch.x, ioTexture.y  * vTexDimFetch.y) - 0.5; //+2 px border

			vec2 vRetroR = vec2(1.0,1.0);
			//ivec2 vFlip = ivec2(1,1);
			//vec2 ioOffsetTL = vec2(0.0,0);
			//vec2 ioOffsetTL = vec2(0.0,0);
			

				//vec2 vPosTex = ioTexture * vTexDimFetch * float(1 << nRetroRatio) - 0.5;
				//ivec2 _vIPosTex = ivec2(vPosTex );
				//vPosTL = (_vIPosTex) >> nRetroRatio;
				//vPosTR = (_vIPosTex + ivec2(1, 0)) >> nRetroRatio;
				//vPosBR = (_vIPosTex + ivec2(1, 1)) >> nRetroRatio;
				//vPosBL = (_vIPosTex + ivec2(0, 1)) >> nRetroRatio;



				//float _nRatio = float(nRetroRatio);
				vec2 vPosTex = (ioTexture  * vRetroR  );
//vec2 vPosTex = (ioTexture * vTexDimFetch * vRetroR  - 0.5);


				ivec2 _vIPosTex = ivec2(vPosTex );



				float _nPrec = 0.0001;
				vPosTL = ivec2(vPosTex       / vRetroR);
				vPosTR =  ivec2((vPosTex    + vec2(1.0-_nPrec, 0.0       )) / vRetroR);
				vPosBR =  ivec2((vPosTex    + vec2(1.0-_nPrec, 1.0-_nPrec)) / vRetroR);
				vPosBL =  ivec2((vPosTex    + vec2(0.0       , 1.0-_nPrec)) / vRetroR );

				
				//TR Clamp oposite side (on device with not enogh precision)
				if(vPosTL.y >= ioSrcBR.y){vPosTL.y = ioSrcBR.y - 1;}
				if(vPosTL.x >= ioSrcBR.x){vPosTL.x = ioSrcBR.x - 1;}
				if(vPosTL == ioSrcTL){
					vPosTL = ioOffsetTL; //Corner TL
				}else if(vPosTL.y <= ioSrcTL.y ){
					//vPosTL += ivec2(ioOffsetT1); //TOP
					vPosTL = ioOffsetT1 +  abs( ivec2(vPosTL.x - ioSrcOT.x, vPosTL.x - ioSrcOT.x) * vFlip.xy ) ;  //TOP
				}else if(vPosTL.x <= ioSrcTL.x ){
					//vPosTL += ivec2(ioOffsetL1);  //Left
					vPosTL =  ioOffsetL1 + abs( ivec2(vPosTL.y - ioSrcOL.y,vPosTL.y - ioSrcOL.y) * vFlip.yx  ) ;  //Left
				}
		


				//TR Clamp oposite side (on device with not enogh precision)
				if(vPosTR.y >= ioSrcBR.y){vPosTR.y = ioSrcBR.y - 1;}
				if(vPosTR.x <= ioSrcBL.x){vPosTR.x = ioSrcBL.x + 1;}
				if(vPosTR == ioSrcTR ){
					vPosTR = ioOffsetTR; //Corner TR
				}else if(vPosTR.y <= ioSrcTR.y ){
					//vPosTR += ivec2(ioOffsetT1); //Top
					vPosTR =  ioOffsetT1 +  abs(ivec2(vPosTR.x - ioSrcOT.x,vPosTR.x - ioSrcOT.x )* vFlip.xy ) ;  //TOP	
					
				}else if(vPosTR.x >= ioSrcTR.x ){
					//vPosTR += ivec2(ioOffsetR1); //RIGHT
					vPosTR = ioOffsetR1 + abs( ivec2(vPosTR.y - ioSrcOR.y,vPosTR.y - ioSrcOR.y )* vFlip.yx  ) ; //RIGHT	
				}
			


				// BR Clamp oposite side
				if(vPosBR.y <= ioSrcTR.y){vPosBR.y = ioSrcTR.y + 1;}
				if(vPosBR.x <= ioSrcBL.x){vPosBR.x = ioSrcBL.x + 1;}
				if(vPosBR == ioSrcBR ){
					vPosBR = ioOffsetBR; //Corner BR
				}else if(vPosBR.y >= ioSrcBR.y){
					vPosBR = ioOffsetB1 +  abs( ivec2(vPosBR.x - ioSrcOB.x, vPosBR.x - ioSrcOB.x) * vFlip.xy  ) ;  //BOT

				}else if(vPosBR.x >= ioSrcBR.x){
					vPosBR = ioOffsetR1 + abs( ivec2(vPosBR.y - ioSrcOR.y,vPosBR.y - ioSrcOR.y) * vFlip.yx  ) ; //Right
				}
			


				// BL Clamp oposite side
				if(vPosBL.y <= ioSrcTR.y){vPosBL.y = ioSrcTR.y + 1;}
				if(vPosBL.x >= ioSrcBR.x){vPosBL.x = ioSrcBR.x - 1;}
				if(vPosBL == ioSrcBL){
					vPosBL = ioOffsetBL; //Corner BL
					
				}else if(vPosBL.y >= ioSrcBL.y ){
					vPosBL = ioOffsetB1 +  abs( ivec2(vPosBL.x - ioSrcOB.x,vPosBL.x - ioSrcOB.x ) * vFlip.xy ) ;  //BOT
					
				}else if(vPosBL.x <= ioSrcBL.x){
					vPosBL =  ioOffsetL1 + abs( ivec2(vPosBL.y - ioSrcOL.y,vPosBL.y - ioSrcOL.y) * vFlip.yx   );  //Left
				}
			
				/*
				vec4 vPixTL = texelFetch(TexCurrent, vPosTL,0);
				vec4 vPixTR = texelFetch(TexCurrent, vPosTR,0);
				vec4 vPixBR = texelFetch(TexCurrent, vPosBR,0);
				vec4 vPixBL = texelFetch(TexCurrent, vPosBL,0);
				*/
				
				vec4 vPixTL = fTexelFetch(iTexID, vPosTL);
				vec4 vPixTR = fTexelFetch(iTexID, vPosTR);
				vec4 vPixBR = fTexelFetch(iTexID, vPosBR);
				vec4 vPixBL = fTexelFetch(iTexID, vPosBL);
				
				//pixTex = fTexelFetch(ioTexID, ioTexture);
				
/*
				vec4 vPixTL = texture(TexCurrent, (vec2(vPosTL) + 0.5) /vTexDimFetch );
				vec4 vPixTR = texture(TexCurrent, (vec2(vPosTR) + 0.5) /vTexDimFetch);
				vec4 vPixBR = texture(TexCurrent, (vec2(vPosBR) + 0.5)/vTexDimFetch);
				vec4 vPixBL = texture(TexCurrent, (vec2(vPosBL) + 0.5) /vTexDimFetch);
*/

				vec2 vFracTL = 1.0 - fract(vPosTex );
				vec2 vFracBR = fract(vPosTex + 1.0 );

				float _nRAlphaTR = (vFracBR.x * vFracTL.y);
				float _nRAlphaBR = (vFracBR.x * vFracBR.y);
				float _nRAlphaBL = (vFracTL.x * vFracBR.y);
				//float _nRAlphaTL = (vFracTL.x * vFracTL.y) ;
				float _nRAlphaTL = 1.0 - (_nRAlphaTR +_nRAlphaBR + _nRAlphaBL) ;

				pixTex = vPixTL * _nRAlphaTL +  vPixTR * _nRAlphaTR +  vPixBR * _nRAlphaBR +  vPixBL * _nRAlphaBL;
				
			}else{
			
				pixTex =  fTexture(iTexID, (ioTexture + 0.5)/ vTexSprites );
				//pixTex = texture(TexSprites, ioTexture);// ( + 0.5 )  / (vTexDimFetch
				//pixTex = texture(TexSprites, (ioTexture + 0.5)/ vTexSprites );// ( + 0.5 )  / (vTexDimFetch
				//	pixTex = fTexture(ioTexID, ioTexture);
			}
			
			
			
			
	//	pixTex = vec4(0.5,0.5,0.5,0.5);	

//pixTex  = texture(TexCurrent, ioTexture);



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

FragColor =  pixTex; //Disable light


        /////////////////////////////////////////////////////
        /////////////////////// LIGHT  /////////////////////
        /////////////////////////////////////////////////////
   // if(nType == 8){ //Unicolo (no Alpha)
        /////////////////////////  Phong light  ///////////////////

       // vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
		
		
		 vec3 vPtWorld = vTriPtWorld;
        //vec3 vPtNorm =  (iomNorm * _vCoDist).xyz;
		//vec3 vPtNorm =  iomNorm[0].xyz;
		vec3 vPtNorm =  ioNorm.xyz;
		
		
		
		
		
/*
vec4 pixNormal = texture(TexNormal, ioTexture);		 
//vPtNorm = vPtNorm * pixNormal.xyz;

vPtNorm = cross(vPtNorm.xyz, pixNormal.xyz);
*/ 
	 
/////// MY AUTO Bump //////////

//float _nMonoCrome =   0.5-(pixTex.r + pixTex.g + pixTex.b)/3.0;
//vec3 _vMyNorm = (  vec3((_nMonoCrome-0.5)*-3.0, (_nMonoCrome), (0.5- _nMonoCrome)*3.0 ));

//float _nMonoCrome =   0.5-(pixTex.r + pixTex.g + pixTex.b)/3.0;
//vec3 _vMyNorm = vec3((_nMonoCrome-0.5)*3.0, (_nMonoCrome), (0.5- _nMonoCrome)*3.0 );



//float _nMonoCrome =  ((pixTex.r + pixTex.g + pixTex.b)/1.5)-1.0 ;
float _nMonoCrome =  ((pixTex.r + pixTex.g + pixTex.b)/1.5)-0.5;

float _nMonoCrome2 =  max(((pixTex.r + pixTex.g + pixTex.b)/1.5)-0.2, 0);
//float _nMonoCrome2 =  (((pixTex.r + pixTex.g + pixTex.b)/1.5)-0.5);



//float _nRevMonoCrome =   _nMonoCrome * -1.0;
float _nRevMonoCrome =   _nMonoCrome2 * -1.0;


//float _nMonoCrome =  ((pixTex.r + pixTex.g + pixTex.b)/3.0) ;
//float _nRevMonoCrome =   (1.0 - _nMonoCrome)-0.5;

//vec3 _vGenNorm =  vec3(_nMonoCrome2*2.0, _nRevMonoCrome , _nRevMonoCrome + _nMonoCrome2*2.0);


//
//vec3 _vMyNorm =  vec3(_nRevMonoCrome/ 2.0, 0.0 , 1.0 - _nRevMonoCrome / 2.0); //Good
//vec3 _vGenNorm = normalize( vec3(_nRevMonoCrome*-1.0, _nRevMonoCrome, (1.0 - (  (_nRevMonoCrome *-1.0) / 1.0)) / 3.0  )); //Good

//vec3 _vMyNorm =  vec3(_nRevMonoCrome/ 8.0, _nRevMonoCrome/ 8.0, 1.0 - (  _nRevMonoCrome / 4.0  * 2.0 )); //Good
//vec3 _vMyNorm =  vec3(0.0, 0.0 , _nMonoCrome*2.0);
//vec3 _vMyNorm =  vec3(0.0, 0.0 , 1.0);

//_vMyNorm =  vec3(0.0, 0.0 , -1.0);



//vPtNorm.x += _nMonoCrome2;
//vPtNorm.y += _nMonoCrome2/;
//vPtNorm.z += _nMonoCrome2;

//vPtNorm = normalize(vPtNorm);

//vec3 _vGenNorm =  vec3(0, _nMonoCrome2/2.0 , 0);
//vec3 _vGenNorm =  normalize(vec3(0.0, _nMonoCrome2/2.0, 1.0));
vec3 _vGenNorm =  normalize(vec3(0.0, _nMonoCrome2/2.0, 1.0));

////////////
//_vMyNorm.z *= -1.0; 
//vPtNorm =  normalize(normalize( vPtNorm.xyz ) +  normalize( _vMyNorm.xyz)); //Same as
//vPtNorm =  normalize(normalize( vPtNorm.xyz ) +  normalize( _vMyNorm.xyz)); //Same as
//vPtNorm = fQRot(normalize(_vMyNorm.xyz), ioObjRot);                                             //Same as
//vPtNorm =  normalize(( vPtNorm.xyz ) *  ( _vMyNorm.xyz));//good effect


////////////



//_vMyNorm *= 2.0;


//vPtNorm.z *= -1.0;
////////////////////////// 

//vPtNorm =  ioNorm.xyz;




	 //vPtNorm.z*=-1.0;
	 
		
		//vec3 vPtNorm = vec3(0.0,1.0,0.0);
//vec3 _vGenNorm =  (vec3(0.0, _nMonoCrome2 - 0.5, 0.5));
	
		/*
vec3 t; 
vec3 b; 

vec3 c1 = cross(vPtNorm, vec3(0.0, 0.0, -1.0)); 
vec3 c2 = cross(vPtNorm, vec3(0.0, -1.0, 0.0)); 
if (length(c1) > length(c2)){
  t = c1;	
}else{
  t = c2;	
}
 t = c1;
t = normalize(t);
b = normalize(cross(vPtNorm, t)); 
*/
/*
//vec3 n = normalize(vPtNorm);
vec3 t = normalize(gl_MultiTexCoord1.xyz);
vec3 b = cross(n, t);
mat3 TBN = mat3(t, b, vPtNorm);

*/
/*
vec3 n = normalize(vPtNorm);             
vec3 t = normalize(cross(vPtNorm, vec3(-1,0,0)));
vec3 b = cross(t, n) + cross(n, t);  
 mat3 TBN = (mat3(t,b,n));
   
 */  
   
   _vGenNorm = vec3(0,0,1);
   
    // mat3 TBN =   cotangent_frame(vPtNorm, vPtWorld, uv);
     mat3 TBN =   cotangent_frame(vPtNorm, (vPtWorld), uv);
	 
//vPtNorm = normalize(_vGenNorm * TBN) ;


//	vec3 vEye_position = vec3(  400.0, 300.0, -450.0); //Auto reverse norm
	vec3 nLDir = normalize(vPtWorld - vPersp.xyz  );//light direction
	//vec3 nLDir = normalize(gl_FragCoord.xyz - 0.5   );//light direction
	float nLdotN =  dot(vPtNorm.xyz, nLDir);
	if(nLdotN < 0.0){
		vPtNorm *= -1;
	}


//vPtNorm =  normalize(( vPtNorm.xyz ) *  ( _vGenNorm.xyz));//good effect
      //  vec3 light_position = vec3(1514.0 ,-600.0, -800.0);
       // vec3 eye_position =   vec3( 500.0,  384.0,-1024.0);
		
		

		  //// Custom interpolated color ////
        vec3 vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vec3 vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
        pixTex.a *= vPtDist.a;
		
		
		pixTex = fAddLight(pixTex, vPtWorld, vPtNorm);
	
   


//FragColor =  vec4( att *specular,  att *specular,  att *specular,1.0);

FragColor =  pixTex;

//FragColor = vec4(_vCoDist.r, 0.0, 0.0 ,1.0);
//FragColor = vec4(uv.x, 0.0, 0.0 ,1.0);
//_nMonoCrome = _nMonoCrome2 ;
// _nMonoCrome =  ((pixTex.r + pixTex.g + pixTex.b)/3.0);
//FragColor =  vec4(_nMonoCrome, _nMonoCrome, _nMonoCrome, 1.0);
//FragColor =  vec4(pixTex.r, pixTex.g, pixTex.b, 1.0);

//FragColor =  vec4(0.0, 0.0, 0.0, 0.8);
FragColor =  vec4(vPtNorm, 1.0);



		
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
	
	
//	FragColor =  vec4(1.0, 0.5, 0.5, 0.5);
	
	
}
				
</glsl>
		}
		
		
		public function fInsert_Body_Fragment():Void{ ///overrided
		}
		

	}
}