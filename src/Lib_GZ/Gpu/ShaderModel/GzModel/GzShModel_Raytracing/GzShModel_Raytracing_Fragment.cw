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
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Tile;

	
	public extension GzShModel_Raytracing_Fragment extends GzShModel {

		override public function fLoad_Fragment():Bool {
			/*
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
		//	GzShCommun_Base.fAdd_Default_15_Slot(oFragement, true);
			GzShCommun_Base.fAdd_Default_15_Slot(oFragement);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			GzShCommun_Base.fAdd_Fragment_Func_Basics(oFragement);
			GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
		//	GzShCommun_Tile.fAdd_Fragment_Func_fTile(oFragement);
			*/
			
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
			GzShCommun_Base.fAdd_Default_15_Slot(oFragement);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			GzShCommun_Base.fAdd_Fragment_Func_Basics(oFragement);
			GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
		//	GzShCommun_Tile.fAdd_Fragment_Func_fTile(oFragement);
	
			
		
			///////////// Fragment Shader //////////////
<glsl(oFragement)>



////////////
uniform vec2 vOffset_L2;

////////////


vec4 pixTex;
vec4 color;

void main(){
	vec4 vPtDist = sh_vCoord_Color1; 
/*
	if( sh_iType != 3){
		color = vec4(1.0,0.0,0.0,0.5);
		//	color = vPtDist;
		//FragColor[0] =  vec4(1.0,0.0,0.0,0.5);
				FragColor =  color;
		return;
	}else{
		color = vPtDist;
		//		color = fTexelFetch(sh_iTexID, ivec2(sh_vTexture));
		
		
	//	color = fTexture(sh_iTexID, sh_vTextureNorm * vec2(800,600));
		color = fTexture(sh_iTexID, sh_vTextureNorm );
		FragColor =  color;
		return;	
	}
	*/	
	/// Make a bilinear interpolation from uv ///
	//vec4 _vCoDist = vec4((1.0-sh_uv.x)*(1.0-sh_uv.y), (sh_uv.x)*(1.0-sh_uv.y), (sh_uv.x)*(sh_uv.y), (1.0-sh_uv.x)*(sh_uv.y));
	////////////////////////////////////////

	
	if( sh_iType == 8 ){ //Vector Line
		
			//pixTex = vec4(0.0, 1.0, 0.5, 1.0);
			pixTex = vPtDist;
			pixTex.a = (1.0- (sh_uv.y*sh_uv.y))*vPtDist.a;
			FragColor =  pixTex;
			return;
		
	}else if( sh_iType == 6){
	
		//pixTex = fTile();
		
		
	}else if( sh_iType == 2){ //Buffer without Interpolation
		
		FragColor = fTexelFetch(sh_iTexID, ivec2(sh_vTexture));
		return;	
	}else if( sh_iType == 3){ //Buffer with Bilinear filtering
		
		FragColor = fTexture(sh_iTexID, sh_vTextureNorm);
		return;	

	}else{
			pixTex = fTexture(sh_iTexID, sh_vTextureNorm);
		//	FragColor =  pixTex;

		
		//	return;
	}
	
	
	vec4 pixDepth = fTexture(ID_TexDepth, sh_vTextureNorm);
	float nDepth = pixDepth.r; //Monocrome
	
	

	// vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
	vec3 vPtWorld = sh_vTriPtWorld;
	vec3 vPtNorm =  sh_vNorm.xyz;


	/////// MY AUTO Bump //////////
	float _nMonoCrome =  (((pixTex.r + pixTex.g + pixTex.b)/3.0)-0.5);
	float _nMonoCrome2 =  max(((pixTex.r + pixTex.g + pixTex.b)/1.5)-0.2, 0.0);
	float _nRevMonoCrome =   _nMonoCrome2 * -1.0;
	vec3 _vGenNorm =  normalize(vec3( _nMonoCrome*-2.0, 0.0, 1.0));
	//vec3 _vGenNorm =  normalize(vec3(_nMonoCrome*-2.0 + ( nDepth-0.5)*-2.0, 0,  1.0));

//vPtWorld += _vGenNorm * 1000;
//vPtWorld.y += _nMonoCrome2 * 10.0;
	

	
	//vec3 _vPtDisplacement = fRotate(vec3(0,0, (_nMonoCrome + 0.5) * 10.0), vec3(0.0,   -(sh_uv.x-0.5), 0.0) ); //Good, 
	

	
	
	//// Auto reverse norm ////
	vec3 vLDir = normalize(vPtWorld - vPersp.xyz  );//light direction
	vPtNorm = fAutoReverseNorm(vPtNorm, vLDir);
	//////////////////////////

	//_vGenNorm = fRotate( vec3(0.0,0.0,-1.0), vec3(0.0,   -(sh_uv.x-0.5), 0.0) ); //Good, 
	mat3 TBN =  fCotangent_frame(vPtNorm, -vLDir, sh_uv); 
	vPtNorm = normalize(TBN * _vGenNorm);
	//////////////////////////////////////////
	
	
//	vPtWorld.y += _nMonoCrome * 10000.0;

	/*
	vec3 _vPtDisplacement = fRotate(vec3(0,(nDepth) * 0.2,0 ), vPtNorm); //Good, 
	//vPtWorld += _vPtDisplacement;
	//vPtWorld.y -= (nDepth-0.5) * 100.0;
	vec3 _vTexDisp  = (_vPtDisplacement);
	_vTexDisp.x *=-1.0;
	vec2 _vTex = sh_vTextureNorm;
	_vTex.xy += _vTexDisp.xy * (nDepth ) * 0.2;
	pixTex = fTexture(sh_iTexID, _vTex);	
	*/
	
	
	float _nIntentity = nDepth/2.0 + 0.5;
	////////////
	

	//// Custom interpolated color ////
	vec3 vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
	vec3 vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
	pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
	pixTex.a *= vPtDist.a;

	pixTex = fAddLight(pixTex, vPtWorld, vPtNorm, _nIntentity);


	if(sh_iType == 5000){

	//	uint _nObjId   = (fUTexelFetch(ID_ITexID,  ivec2(UTexSize[ID_ITexID] * sh_uv) )).r;
		//uint _nObjId   = (texelFetch(UTexture[0], ivec2(UTexSize[ID_ITexID] * sh_uv) ,0)).r;   //(ID_ITexID,  ivec2(UTexSize[ID_ITexID] * sh_uv) )).r;
		
		///float _nL1_W = 26.0;  //800.0/32.0 + 1;
		//float _nL1_H = 19.0; // 600.0/32.0 + 1;
		
		float _nL1_W =  800.0/32.0;
		float _nL1_H =  600.0/32.0;
		float _nL1_OffH = 19.0;
		
		
		
		float _nL2_W = _nL1_W/2.0;
		float _nL2_H = _nL1_H/2.0;
		
		
		float _nL1_S = _nL1_W * _nL1_H;
		
	//	vec2 uv = sh_uv -vec2(0.5,0.5);
		
		uint _nObjId_L1   = (fUTexelFetch(ID_ITexID,  ivec2( (vec2(_nL1_W, _nL1_H) * sh_uv  )    )   )).r;
		float _nL1 = float(_nObjId_L1) /625.0;
		
		uint _nObjId_L2   = (fUTexelFetch(ID_ITexID,  ivec2( vec2(_nL2_W , _nL2_H ) * sh_uv + vec2(0.0 + 0.5, _nL1_OffH + 0.5 )  ) )).r;
		//uint _nObjId_L2   = (fUTexelFetch(ID_ITexID,  ivec2( vec2(_nL2_W , _nL2_H ) * sh_uv + vec2(0.0 , _nL1_OffH )  ) )).r;
		float _nL2 = float(_nObjId_L2) /625.0;	
		
		
		pixTex = vec4( _nL1,_nL2, 0.0, 0.5) ;
		
		
		
	//	pixTex = vec4( 1.0, 1.0, 1.0, 1.0) ;
	}else{
	//	pixTex.a = 1.0;
	//	pixTex = vec4( 0.5, 0.5, 0.5, 0.1) ;

	}
	

	FragColor =  pixTex;
	
}
				
</glsl>



	//oFragement.fAddMain();
}
		
		
	public function fInsert_Body_Fragment():Void{ ///overrided
	}
		

	}
}