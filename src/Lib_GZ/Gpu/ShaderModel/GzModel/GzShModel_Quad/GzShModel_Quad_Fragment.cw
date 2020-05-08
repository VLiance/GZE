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

	
	public extension GzShModel_Quad_Fragment extends GzShModel {

		override public function fLoad_Fragment():Bool {
			

			
			
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
			GzShCommun_Base.fAdd_Default_15_Slot(oFragement);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			GzShCommun_Base.fAdd_Fragment_Func_Basics(oFragement);
			GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
			GzShCommun_Tile.fAdd_Fragment_Func_fTile(oFragement);
		
			///////////// Fragment Shader //////////////
<glsl(oFragement)>

vec4 pixTex;

void main(){

	/// Make a bilinear interpolation from uv ///
	//vec4 _vCoDist = vec4((1.0-sh_uv.x)*(1.0-sh_uv.y), (sh_uv.x)*(1.0-sh_uv.y), (sh_uv.x)*(sh_uv.y), (1.0-sh_uv.x)*(sh_uv.y));
	////////////////////////////////////////
	vec4 vPtDist = sh_vCoord_Color1; 
	
	if( sh_iType == 8 ){ //Vector Line
		
			//pixTex = vec4(0.0, 1.0, 0.5, 1.0);
			pixTex = vPtDist;
			pixTex.a = (1.0- (sh_uv.y*sh_uv.y))*vPtDist.a;
			FragColor =  pixTex;
			return;
		
	}else if( sh_iType == 6){
	
		pixTex = fTile();
		
		
	}else if( sh_iType == 2){ //Buffer without Interpolation
		
		FragColor = fTexelFetch(sh_iTexID, ivec2(sh_vTexture));
		return;	
	}else if( sh_iType == 3){ //Buffer with Bilinear filtering
		
		FragColor = fTexture(sh_iTexID, sh_vTextureNorm);
		return;	
		
	}else if( sh_iType == 4){
		
		FragColor =  vec4(0.5,0.5,1.5,0.5);
		return;
		
		
	}else{
			pixTex = fTexture(sh_iTexID, sh_vTextureNorm);
		//	FragColor =  pixTex;
		//	return;
	}
	

	// vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
	vec3 vPtWorld = sh_vTriPtWorld;
	vec3 vPtNorm =  sh_vNorm.xyz;


	/////// MY AUTO Bump //////////
	float _nMonoCrome =  (((pixTex.r + pixTex.g + pixTex.b)/3.0)-0.5);
	float _nMonoCrome2 =  max(((pixTex.r + pixTex.g + pixTex.b)/1.5)-0.2, 0.0);
	float _nRevMonoCrome =   _nMonoCrome2 * -1.0;
	vec3 _vGenNorm =  normalize(vec3( _nMonoCrome*-2.0, 0.0, 1.0));


	//// Auto reverse norm ////
	vec3 vLDir = normalize(vPtWorld - vPersp.xyz  );//light direction
	vPtNorm = fAutoReverseNorm(vPtNorm, vLDir);
	//////////////////////////

	//_vGenNorm = fRotate( vec3(0.0,0.0,-1.0), vec3(0.0,   -(sh_uv.x-0.5), 0.0) ); //Good, 
	mat3 TBN =  fCotangent_frame(vPtNorm, -vLDir, sh_uv); 
	vPtNorm = normalize(TBN * _vGenNorm);
	//////////////////////////////////////////

	//// Custom interpolated color ////
	vec3 vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
	vec3 vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
	pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
	pixTex.a *= vPtDist.a;

	pixTex = fAddLight(pixTex, vPtWorld, vPtNorm);


	FragColor =  pixTex;
}
				
</glsl>
}
		
		
	public function fInsert_Body_Fragment():Void{ ///overrided
	}
		

	}
}