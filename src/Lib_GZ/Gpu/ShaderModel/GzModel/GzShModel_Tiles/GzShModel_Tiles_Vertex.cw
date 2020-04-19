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
	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Tiles.GzShModel_Tiles_Fragment;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Base;
	
	
	public extension GzShModel_Tiles_Vertex extends GzShModel_Tiles_Fragment {


		override public function fLoad_Vertex():Bool {
		
			GzShCommun_Base.fAdd_VertexBasics(oVertex);
			GzShCommun_Base.fAdd_Func_Basics(oVertex);
			GzShCommun_Base.fAdd_Vertex_Func_Basics(oVertex);
			
<glsl(oVertex)>



	in vec4 in_Pt1;  //x,y,z, Width
	in vec4 in_Pt2;  //x,y,z, Height
	in vec4 in_Pt3;  //x,y,z, Length
	in vec4 in_Pt4;  //x,y,z, ?????
	
	//in vec2 in_TexCoord0;  //Sx1,Sy1,Sx2,Sy2 
	in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4
	in vec4 in_Color1; //R,G,B,A
	
	///TILES 
	in vec4 in_TilesHV; //Vertical //Horizontal
	in vec4 in_TilesC; //Corner
	
	

	////  in vec4 in_LimitRender;  //Limit render ... in uniform? <----

	//AylasID, UniformActionID, Type

	////  in vec4 in_AchorRoll;  //pt1,pt2,pt3,pt4  
	////  in vec4 in_AchorPt1;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt2;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt3;  //x1,y1,x2,x2  
	////  in vec4 in_AchorPt4;  //x1,y1,x2,x2  

	//in vec2 in_Corner;      //Remove     
	//in vec3 in_PtPos;       //Remove     
	//in vec4 in_Color2;   //Remove     
	//in vec4 in_Color3;   //Remove     
	//in vec4 in_Color4;   //Remove     



	
	
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

	//out vec2 coord_Texture;
	//out vec2 coord_TextureSource;
//	out vec2 coord_Corner;

/*
	flat out vec4 coord_Color1;
	flat out vec4 coord_Color2;
	flat out vec4 coord_Color3;
	flat out vec4 coord_Color4
	
*/	

	/*
	flat out vec4 coord_Pt1;
	flat out vec4 coord_Pt2;
	flat out vec4 coord_Pt3;
	flat out vec4 coord_Pt4;
	*/
	///////////////////


//out vec2 ioCorner;
//xflat out mat4 iomColor;

uniform vec2 vTexDimFetch;
//smooth out vec3 vTriPtWorld; //Current UV

//in int gl_VertexID;


vec2 ioTexture;
//vec2 uv; //Current UV


//smooth out vec4 ioTextureTest;


#define xshared out

#define shared_ivec4 xflat xshared ivec4 
#define shared_vec4  xshared vec4 
#define shared_mat4  xshared mat4 

//Max is 15 Slot to be portable -> Max slot #14
shared_mat4 _Slot_0_3; //WorldPos
shared_mat4 _Slot_4_7;
shared_mat4 _Slot_8_11;
shared_ivec4 _Slot_12;
shared_ivec4 _Slot_13;
shared_ivec4 _Slot_14;

#define rv_Slot_0   _Slot_0_3[0]  //in vec3 vTriPtWorld; [Time]
#define sh_Slot_4   _Slot_0_3[1]  //iomWorldPt?
#define sh_Slot_5   _Slot_0_3[2]  //iomWorldPt?
#define sh_Slot_6   _Slot_0_3[3]  //iomWorldPt?

#define rv_Slot_4   _Slot_4_7[0] //in vec3 ioNorm; 
#define rv_Slot_5   _Slot_4_7[1] //uv / ioTexture
#define rv_Slot_6   _Slot_4_7[2] //coord_Color1
#define rv_Slot_7   _Slot_4_7[3] 

#define sh_Slot_0   _Slot_8_11[0]
#define sh_Slot_1   _Slot_8_11[1]
#define sh_Slot_2  _Slot_8_11[2]
#define sh_Slot_3  _Slot_8_11[3]

#define irv_Slot_0  _Slot_12		//iTexID / nType
#define ish_Slot_0  _Slot_13
#define ish_Slot_1  _Slot_14

/////////////////////////////////////////////
#define sh_iTexID (irv_Slot_0.x) 
#define sh_iType  (irv_Slot_0.y) 

#define sh_vTriPtWorld (rv_Slot_0.xyz)
#define sh_vNorm (rv_Slot_4.xyz)
#define sh_uv (rv_Slot_5.xy)
#define sh_vTexture (rv_Slot_5.ab)
#define sh_vCoord_Color1 (rv_Slot_6)


////////////// TILE ///////////////////////
#define sh_ioSrcTL (ish_Slot_0.xy)
#define sh_ioSrcTR (ish_Slot_0.ba)
#define sh_ioSrcBR (ish_Slot_1.xy)
#define sh_ioSrcBL (ish_Slot_1.ba)

#define sh_ioOffsetL1 (sh_Slot_0.xy)
#define sh_ioOffsetT1 (sh_Slot_0.ba)
#define sh_ioOffsetR1 (sh_Slot_1.xy)
#define sh_ioOffsetB1 (sh_Slot_1.ba)

#define sh_ioOffsetTL (sh_Slot_2.xy)
#define sh_ioOffsetTR (sh_Slot_2.ba)
#define sh_ioOffsetBR (sh_Slot_3.xy)
#define sh_ioOffsetBL (sh_Slot_3.ba)

#define sh_ioSrcTRBL (sh_Slot_4)
#define sh_vFlip (sh_Slot_5.xy)
//////////////////////////////////////////



#define bump(Type, Val) Type(Val) + 0.1




/*
xflat out ivec2 ioOffsetTL;
xflat out ivec2 ioOffsetTR;
xflat out ivec2 ioOffsetBR;
xflat out ivec2 ioOffsetBL;
*/
//vec2 ioTexture;

//LIGHT
float nFrontFacing;


  vec3 ioPt1; //Out?
  vec3 ioPt2;
  vec3 ioPt3;
  vec3 ioPt4;
/*
xflat out vec3 ioPt1;
xflat out vec3 ioPt2;
xflat out vec3 ioPt3;
xflat out vec3 ioPt4;
*/

xflat out vec4 ioObjRot;
vec3 ioNorm;
//xflat out vec3 ioNorm1;
//xflat out vec3 ioNorm2;
//xflat out vec3 ioNorm3;
//xflat out vec3 ioNorm4;

mat4 iomWorldPt;
//xflat out mat4 iomNorm;
/////////

//// TILES ///////
/*
xflat out vec2 ioPtSrc1;
xflat out vec2 ioPtSrc2;
xflat out vec2 ioPtSrc3;
xflat out vec2 ioPtSrc4;
*/

ivec2 ioSrcTL;
ivec2 ioSrcTR;
ivec2 ioSrcBR;
ivec2 ioSrcBL;

/*
xflat out ivec2 ioSrcOT;
xflat out ivec2 ioSrcOR;
xflat out ivec2 ioSrcOB;
xflat out ivec2 ioSrcOL;
*/
ivec4 ioSrcTRBL;


/*
xflat out ivec2 ioOffsetL1;
xflat out ivec2 ioOffsetT1;
xflat out ivec2 ioOffsetR1;
xflat out ivec2 ioOffsetB1;
*/

ivec2 ioOffsetL1;
ivec2 ioOffsetT1;
ivec2 ioOffsetR1;
ivec2 ioOffsetB1;


ivec2 ioOffsetTL;
ivec2 ioOffsetTR;
ivec2 ioOffsetBR;
ivec2 ioOffsetBL;

ivec2 ivTexDim;
	
ivec2 vFlip; //Sure?

//xflat out int ioTexID;

int nOriTX;
int nOriBX;
int nOriLY;
int nOriRY;
//////////////////

//uniform sampler2D TexCurrent; 
	uniform vec2 vTexCurrent;
	
//uniform sampler2D TexNormal;
	uniform vec2 vTexNormal;
	
//uniform sampler2D TexSprites;
	uniform vec2 vTexSprites;

	void main(){
	
		sh_iTexID =  iTexID;
		sh_iType = iType;
		
		//ioTexID = iTexID;
			
            ///////////////////////////////////////////////////
            ///////////////// Select vertex  ///////////////////
            ///////////////////////////////////////////////////
            vec2 vSrc;
			if (nVertexID < 2){     // 0 || 1
                if(nVertexID == 0){
                    //////// Vertex 0 ////////
					sh_uv = vec2(0,0);
					//color = in_Color1;
					//vCoDist = vec4(1.0,0.0,0.0,0.0);
					
                    gl_Position = in_Pt1; 
					//ioCorner = vec2(0.25,0.25);
					vSrc.x = in_TexSource0.x;
                    vSrc.y = in_TexSource0.y;
                }else{
				
					sh_uv = vec2(1,0);
				//	color = in_Color2;
					//vCoDist = vec4(0.0,1.0,0.0,0.0);
		
                    //////// Vertex 1 ////////
                    gl_Position = in_Pt2;
					//ioCorner = vec2(0.75,0.25);
                    vSrc.x = in_TexSource0.z;
                    vSrc.y = in_TexSource0.w;
                }
			}else{                  // 2 || 3
                if(nVertexID == 2){
                    //////// Vertex 2 ////////
					sh_uv = vec2(1,1);
					//color = in_Color3;
					//vCoDist = vec4(0.0,0.0,1.0,0.0);
					
                    gl_Position = in_Pt3;
                   // ioCorner = vec2(0.75,0.75);
                    vSrc.x = in_TexSource1.x;
                    vSrc.y = in_TexSource1.y;

                }else{
                    //////// Vertex 3 ////////
					sh_uv = vec2(0,1);
					//color = in_Color4;
					//vCoDist = vec4(0.0,0.0,0.0,1.0);
					
                    gl_Position = in_Pt4;
					//ioCorner = vec2(0.25,0.75);
                    vSrc.x = in_TexSource1.z;
                    vSrc.y = in_TexSource1.w;
                }
			}
		
		
		gl_Position = f3dTo2d(gl_Position.xyz);
		///////////////////////////////////////////////
		gl_Position.y = 1.0 - gl_Position.y - 1.0; //FlipY

		///////////
		

		
		
		//////////// SRC ///////////////
		//ioTexture.x = (vSrc.x + 0.5 ) / (vTexDimFetch.x );
		//ioTexture.y = (vSrc.y + 0.5 ) / (vTexDimFetch.y );
		ioTexture.x = (vSrc.x  ) ;
		ioTexture.y = (vSrc.y );
		
		sh_vTexture =  vSrc.xy;
	//	ioTextureTest.zw = vSrc.xy;
		////////////////////////////////
		
		//Send color
		sh_vCoord_Color1 = in_Color1;
		//coord_Color2 = in_Color2;
		//coord_Color3 = in_Color3;
		//coord_Color4 = in_Color4;
		
		/*
		coord_Pt1 = in_Pt1;
		coord_Pt2 = in_Pt2;
		coord_Pt3 = in_Pt3;
		coord_Pt4 = in_Pt4;
		*/
		
		
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

		
		

		
		
		
/*
		nZx = ((pt1.z + _vObjPos.z) * vPersp.z) + 1.0;
		pt1.x = (pt1.x + (_vObjPos.x - vPersp.x) ) / nZx - (_vObjPos.x - vPersp.x);
		pt1.y = (pt1.y + (_vObjPos.y - vPersp.y) ) / nZx - (_vObjPos.y - vPersp.y);

		nZx = ((pt2.z + _vObjPos.z) * vPersp.z) + 1.0;
		pt2.x = (pt2.x + (_vObjPos.x - vPersp.x) ) / nZx - (_vObjPos.x - vPersp.x);
		pt2.y = (pt2.y + (_vObjPos.y - vPersp.y) ) / nZx - (_vObjPos.y - vPersp.y);

	*/	
	nFrontFacing = 1.0;
		/*
	   if(cross(pt1, pt2).z < 0.0 ){
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
		//nFrontFacing = 1.0;

		//ioNorm = normalize(vec3(0.0,0.0,1.0 * nFrontFacing ));
		ioNorm = normalize(vec3(0.0,0.0,1.0 * nFrontFacing  ));
		//ioNorm.xyz = fQRot_2(ioNorm.xyz, in_ObjRot);
		ioNorm.xyz = fQRot_2(ioNorm.xyz, in_ObjRot);
		ioObjRot = in_ObjRot;
		/*
		ioNorm1 = normalize(vec3(-1.0,-1.0,-1.0 * nFrontFacing ));
		ioNorm2 = normalize(vec3( 1.0,-1.0,-1.0 * nFrontFacing));
		ioNorm3 = normalize(vec3( 1.0, 1.0,-1.0 * nFrontFacing ));
		ioNorm4 = normalize(vec3(-1.0, 1.0,-1.0 * nFrontFacing ));

		ioNorm1.xyz = fQRot_2(ioNorm1.xyz, in_ObjRot);
		ioNorm2.xyz = fQRot_2(ioNorm2.xyz, in_ObjRot);
		ioNorm3.xyz = fQRot_2(ioNorm3.xyz, in_ObjRot);
		ioNorm4.xyz = fQRot_2(ioNorm4.xyz, in_ObjRot);

		iomNorm[0] = vec4(ioNorm1,0);
		iomNorm[1] = vec4(ioNorm2,0);
		iomNorm[2] = vec4(ioNorm3,0);
		iomNorm[3] = vec4(ioNorm4,0);
		//////////////////////////////////////////////////////
		/////////////////////////////////////////////////////
	*/
		
		///// Only for quad shaders /////////////////
		iomWorldPt[0] = vec4(ioPt1 + in_ObjPos.xyz,0);
		iomWorldPt[1] = vec4(ioPt2 + in_ObjPos.xyz,0);
		iomWorldPt[2] = vec4(ioPt3 + in_ObjPos.xyz,0);
		iomWorldPt[3] = vec4(ioPt4 + in_ObjPos.xyz,0);
		////////////////// FS ////////////////////
		//out: if (nVertexID == 1){uv = vec2(1,0); }...
		//smooth in vec2 uv;
		//vec4 _vCoDist = vec4((1.0-uv.x)*(1.0-uv.y), (uv.x)*(1.0-uv.y), (uv.x)*(uv.y), (1.0-uv.x)*(uv.y));
		//vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
		//////////////////////////////////////////////
		
		if (nVertexID == 0){  
			sh_vTriPtWorld = iomWorldPt[0].xyz;
		}
		if (nVertexID == 1){  
			sh_vTriPtWorld = iomWorldPt[1].xyz;
		}
		if (nVertexID == 2){  
			sh_vTriPtWorld = iomWorldPt[2].xyz;
		}
		if (nVertexID == 3){  
			sh_vTriPtWorld = iomWorldPt[3].xyz;
		}
		
		
	ioNorm.xyz = normalize((cross(( ioPt2 -ioPt1), (ioPt3 - ioPt1)))) * nFrontFacing;
	sh_vNorm = ioNorm;

/////////////////////////// TILES ///////////////////////////////////////////
	//in vec4 in_TilesHV; //Vertical
	//in vec4 in_TilesC;  //Horizontal
	//in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	//in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4
//TILESET SRC

ivTexDim = ivec2(TexSize[iTexID] );
//ivTexDim = ivec2(vTexCurrent);
//ivTexDim = ivec2(vTexDimFetch);


/////////////////////////////////////////////////////
int nOTL =  int(in_TilesC.x); 
float _nRevX = 1.0;
float _nRevY = 1.0;
float _nRevD = 1.0;
int _nIRevX = 1;
int _nIRevY = 1;
int _nIRevD = 1;

if(in_TexSource0.x > in_TexSource1.x){
	_nRevX = -1.0;
	_nIRevX = -1;
}

if(in_TexSource0.y > in_TexSource1.y){
	_nRevY = -1.0;
	_nIRevY = -1;
	//vRetroR *= 0;
}
if(nOTL < 0){
	nOTL *= -1;
	_nRevD = -1.0;
	_nIRevD = -1;
}

nOriTX = 1;
nOriBX = 1;
nOriLY = 1;
nOriRY = 1;
/*
ioPtSrc1 = in_TexSource0.xy;
ioPtSrc2 = in_TexSource0.zw;
ioPtSrc3 = in_TexSource1.xy;
ioPtSrc4 = in_TexSource1.zw;
*/	

vec2 _vTL = in_TexSource0.xy;
vec2 _vTR = in_TexSource0.zw;
vec2 _vBR = in_TexSource1.xy;
vec2 _vBL = in_TexSource1.zw;

if(_nRevX < 0.0){ //Reverse X
	_vTL = in_TexSource0.zw;;
	_vTR = in_TexSource0.xy;
	_vBR = in_TexSource1.zw;
	_vBL = in_TexSource1.xy;
}
if(_nRevY < 0.0){ //Reverse Y

	vec2 _vTemp = _vTL;
	_vTL = _vBL;
	_vBL = _vTemp;
	_vTemp = _vTR;
	_vTR = _vBR;
	_vBR = _vTemp;
}

if(_nRevD < 0.0){ //Reverse D
	float _nTemp = _vTL.x;
	_vTL.x = _vTL.y;
	_vTL.y = _nTemp; 
	 
	 _nTemp = _vTR.x;
	 _vTR.x = _vTR.y;
	 _vTR.y = _nTemp;  
	
	 _nTemp = _vBR.x;
	 _vBR.x = _vBR.y;
	 _vBR.y = _nTemp; 
	
	 _nTemp = _vBL.x;
	 _vBL.x = _vBL.y;
	 _vBL.y = _nTemp; 
}


ioSrcTL = ivec2(_vTL + vec2(-0.5,-0.5) + 0.5);
ioSrcTR = ivec2(_vTR + vec2(0.5,-0.5) + 0.5);
ioSrcBR = ivec2(_vBR + vec2(0.5,0.5) + 0.5);
ioSrcBL = ivec2(_vBL + vec2(-0.5,0.5) + 0.5);


int nOL =  int(in_TilesHV.x);
if(nOL < 0){
	nOL *= -1;
	nOriLY *= -1 ;
}
ioOffsetL1.y = nOL /  ivTexDim.x;
ioOffsetL1.x = nOL - ioOffsetL1.y * ivTexDim.x;

int nOT =  int(in_TilesHV.y);
if(nOT < 0){
	nOT *= -1;
	nOriTX *= -1 ;
}
ioOffsetT1.y = nOT /  ivTexDim.x;
ioOffsetT1.x = nOT - ioOffsetT1.y * ivTexDim.x;

int nOR =  int(in_TilesHV.z);
if(nOR < 0){
	nOR *= -1;
	nOriRY *= -1 ;
}
ioOffsetR1.y = nOR /  ivTexDim.x;
ioOffsetR1.x = nOR - ioOffsetR1.y * ivTexDim.x;


int nOB =  int(in_TilesHV.w);
if(nOB < 0){
	nOB *= -1;
	nOriBX *= -1;
}
ioOffsetB1.y = nOB /  ivTexDim.x;
ioOffsetB1.x = nOB - ioOffsetB1.y * ivTexDim.x;


if(_nRevX < 0.0){ //Reverse
	ivec2 _vTemp = ioOffsetL1;
	ioOffsetL1 = ioOffsetR1; 
	ioOffsetR1 = _vTemp; 
	

	
	nOriTX *= -1;
	nOriBX *= -1;
	
	int _nTemp = nOriLY ;
	nOriLY = nOriRY;
	nOriRY = _nTemp;
}

if(_nRevY < 0.0){ //Reverse
	ivec2 _vTemp = ioOffsetT1;
	ioOffsetT1 = ioOffsetB1; 
	ioOffsetB1 = _vTemp; 

	nOriLY *= -1;
	nOriRY *= -1;
	
	int _nTemp = nOriTX ;
	nOriTX = nOriBX;
	nOriBX = _nTemp;
}


if(nOriTX > 0){
	//ioSrcOT = ioSrcTL;
	ioSrcTRBL.r = ioSrcTL.x;
}else{
	//ioSrcOT = ioSrcTR;
	ioSrcTRBL.r = ioSrcTR.x;
}

if(nOriRY > 0){
	//ioSrcOR = ioSrcTR;
	ioSrcTRBL.g = ioSrcTR.y;
}else{
	//ioSrcOR = ioSrcBR;
	ioSrcTRBL.g = ioSrcBR.y;
}

if(nOriBX > 0){
	//ioSrcOB = ioSrcBL;
	ioSrcTRBL.b = ioSrcBL.x;
}else{
	//ioSrcOB = ioSrcBR;
	ioSrcTRBL.b = ioSrcBR.x;
}

if(nOriLY > 0){
	//ioSrcOL = ioSrcTL;
	ioSrcTRBL.a = ioSrcTL.y;
}else{
	//ioSrcOL = ioSrcBL;
	ioSrcTRBL.a = ioSrcBL.y;
}

//////////////  CORNER  //////////
//int nOTL =  int(in_TilesC.x); Save rotate flipping
ioOffsetTL.y = nOTL /  ivTexDim.x;
ioOffsetTL.x = nOTL - ioOffsetTL.y * ivTexDim.x;

int nOTR =  int(in_TilesC.y);
ioOffsetTR.y = nOTR /  ivTexDim.x;
ioOffsetTR.x = nOTR - ioOffsetTR.y * ivTexDim.x;

int nOBR =  int(in_TilesC.z);
ioOffsetBR.y = nOBR /  ivTexDim.x;
ioOffsetBR.x = nOBR - ioOffsetBR.y * ivTexDim.x;

int nOBL =  int(in_TilesC.w);
ioOffsetBL.y = nOBL /  ivTexDim.x;
ioOffsetBL.x = nOBL - ioOffsetBL.y * ivTexDim.x;
/////////////////////////////////////////

vFlip =  ivec2(1,0);
if(_nIRevD < 0){
	vFlip =  ivec2(0,1);
}

///Send data:
sh_ioOffsetL1 = bump(vec2, ioOffsetL1);
sh_ioOffsetT1 = bump(vec2, ioOffsetT1);
sh_ioOffsetR1 = bump(vec2, ioOffsetR1);
sh_ioOffsetB1 = bump(vec2, ioOffsetB1);

sh_ioOffsetTL = bump(vec2, ioOffsetTL);
sh_ioOffsetTR = bump(vec2, ioOffsetTR);
sh_ioOffsetBR = bump(vec2, ioOffsetBR);
sh_ioOffsetBL = bump(vec2, ioOffsetBL);

sh_ioSrcTRBL = bump(vec4, ioSrcTRBL);

sh_vFlip  = bump(vec2, vFlip ); 
/*
sh_ioSrcTL =  bump(vec2, ioSrcTL);
sh_ioSrcTR =  bump(vec2, ioSrcTR);
sh_ioSrcBR =  bump(vec2, ioSrcBR);
sh_ioSrcBL =  bump(vec2, ioSrcBL);
*/
sh_ioSrcTL =  ioSrcTL;
sh_ioSrcTR =  ioSrcTR;
sh_ioSrcBR =  ioSrcBR;
sh_ioSrcBL =  ioSrcBL;

}
</glsl>
	}
}
}