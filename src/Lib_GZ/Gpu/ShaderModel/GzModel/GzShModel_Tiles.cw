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
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Tiles;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public overclass GzShModel_Tiles extends GzShModel {

		public var oVbo : Vbo;
		
		public var oAtQuad : Attribute_Quad;
		public var oAtTiles : Attribute_Tiles;
		
		public var nTest : Int = 0;
		
	
		
		public function GzShModel_Tiles():Void {
			Debug.fTrace("--- GzShModel Created!! ---");
			

		}
		
		public function fLoad():Bool {
			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
			
			oVbo = new Vbo(oProgram);
			
			oAtQuad = new Attribute_Quad(oVbo);
			Attribute_Quad = oAtQuad; //Singleton
			
			oAtTiles = new Attribute_Tiles(oVbo);
			Attribute_Tiles = oAtTiles; //Singleton
			
			
			
			
	
<glsl(oVertex)>
							
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
	uniform vec2 vTexDim;
	//in int gl_VertexID;
	

smooth out vec2 uv; //Current UV

//LIGHT
float nFrontFacing;

xflat out vec3 ioPt1;
xflat out vec3 ioPt2;
xflat out vec3 ioPt3;
xflat out vec3 ioPt4;
xflat out vec3 ioNorm1;
xflat out vec3 ioNorm2;
xflat out vec3 ioNorm3;
xflat out vec3 ioNorm4;
xflat out mat4 iomWorldPt;
xflat out mat4 iomNorm;
/////////

//// TILES ///////
xflat out vec2 ioPtSrc1;
xflat out vec2 ioPtSrc2;
xflat out vec2 ioPtSrc3;
xflat out vec2 ioPtSrc4;

xflat out ivec2 ioSrcTL;
xflat out ivec2 ioSrcTR;
xflat out ivec2 ioSrcBR;
xflat out ivec2 ioSrcBL;

xflat out ivec2 ioSrcOT;
xflat out ivec2 ioSrcOR;
xflat out ivec2 ioSrcOB;
xflat out ivec2 ioSrcOL;

xflat out ivec2 ioOffsetL1;
xflat out ivec2 ioOffsetT1;
xflat out ivec2 ioOffsetR1;
xflat out ivec2 ioOffsetB1;

xflat out ivec2 ioOffsetL2;
xflat out ivec2 ioOffsetT2;
xflat out ivec2 ioOffsetR2;
xflat out ivec2 ioOffsetB2;

xflat out ivec2 ioOffsetTL;
xflat out ivec2 ioOffsetTR;
xflat out ivec2 ioOffsetBR;
xflat out ivec2 ioOffsetBL;

xflat out ivec2 ivTexDim;
	
xflat out ivec2 vFlip; //Sure?

int nOriTX;
int nOriBX;
int nOriLY;
int nOriRY;
//////////////////



	
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
		ioTexture.x = (vSrc.x + 0.5 ) / (vTexDim.x );
		ioTexture.y = (vSrc.y + 0.5 ) / (vTexDim.y );
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

	   if(cross(pt1, pt2).z < 0.0 ){
			nFrontFacing = -1.0;
		}else{
			nFrontFacing = 1.0;
		}
			
		 //If both = anulation
		if(in_ObjSize.x < 0.0){ //Reverse width
		   nFrontFacing *= -1.0;
		}
		if(in_ObjSize.y < 0.0){ //Reverse height
		   nFrontFacing *= -1.0;
		}
nFrontFacing = 1.0;
		ioNorm1 = normalize(vec3(-1.0,-1.0,-1.0 * nFrontFacing ));
		ioNorm2 = normalize(vec3( 1.0,-1.0,-1.0 * nFrontFacing));
		ioNorm3 = normalize(vec3( 1.0, 1.0,-1.0 * nFrontFacing ));
		ioNorm4 = normalize(vec3(-1.0, 1.0,-1.0 * nFrontFacing ));

		ioNorm1.xyz = fQRot_2(ioNorm1.xyz, in_ObjRot);
		ioNorm2.xyz = fQRot_2(ioNorm2.xyz, in_ObjRot);
		ioNorm3.xyz = fQRot_2(ioNorm3.xyz, in_ObjRot);
		ioNorm4.xyz = fQRot_2(ioNorm4.xyz, in_ObjRot);

		iomWorldPt[0] = vec4( ioPt1 + _vObjPos.xyz,0);
		iomWorldPt[1] = vec4(ioPt2 + _vObjPos.xyz,0);
		iomWorldPt[2] = vec4(ioPt3 + _vObjPos.xyz,0);
		iomWorldPt[3] = vec4(ioPt4 + _vObjPos.xyz,0);

		iomNorm[0] = vec4(ioNorm1,0);
		iomNorm[1] = vec4(ioNorm2,0);
		iomNorm[2] = vec4(ioNorm3,0);
		iomNorm[3] = vec4(ioNorm4,0);
		//////////////////////////////////////////////////////
		/////////////////////////////////////////////////////
	

/////////////////////////// TILES ///////////////////////////////////////////
	//in vec4 in_TilesHV; //Vertical
	//in vec4 in_TilesC;  //Horizontal
	//in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	//in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4
//TILESET SRC

ivTexDim = ivec2(vTexDim);

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

ioPtSrc1 = in_TexSource0.xy;
ioPtSrc2 = in_TexSource0.zw;
ioPtSrc3 = in_TexSource1.xy;
ioPtSrc4 = in_TexSource1.zw;
			

vec2 _vTL = ioPtSrc1;
vec2 _vTR = ioPtSrc2;
vec2 _vBR = ioPtSrc3;
vec2 _vBL = ioPtSrc4;

if(_nRevX < 0){ //Reverse X
	_vTL = ioPtSrc2;
	_vTR = ioPtSrc1;
	_vBR = ioPtSrc4;
	_vBL = ioPtSrc3;
}
if(_nRevY < 0){ //Reverse Y

	vec2 _vTemp = _vTL;
	_vTL = _vBL;
	_vBL = _vTemp;
	_vTemp = _vTR;
	_vTR = _vBR;
	_vBR = _vTemp;
}

if(_nRevD < 0){ //Reverse D
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


if(_nRevX < 0){ //Reverse
	ivec2 _vTemp = ioOffsetL1;
	ioOffsetL1 = ioOffsetR1; 
	ioOffsetR1 = _vTemp; 
	

	
	nOriTX *= -1;
	nOriBX *= -1;
	
	int _nTemp = nOriLY ;
	nOriLY = nOriRY;
	nOriRY = _nTemp;
}

if(_nRevY < 0){ //Reverse
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
	ioSrcOT = ioSrcTL;
}else{
	ioSrcOT = ioSrcTR;
}

if(nOriRY > 0){
	ioSrcOR = ioSrcTR;
}else{
	ioSrcOR = ioSrcBR;
}

if(nOriBX > 0){
	ioSrcOB = ioSrcBL;
}else{
	ioSrcOB = ioSrcBR;
}

if(nOriLY > 0){
	ioSrcOL = ioSrcTL;
}else{
	ioSrcOL = ioSrcBL;
}

////////  CORNER  //////////
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


	/*	
	//Clamp			
ioOffsetT =  ivec2(0,1);
ioOffsetR =  ivec2(-1,0);
ioOffsetB =  ivec2(0,-1);
ioOffsetL =  ivec2(1,0);

	
ioOffsetTL =  ivec2(1,1);
ioOffsetTR =  ivec2(-1,1);
ioOffsetBR =  ivec2(-1,-1);
ioOffsetBL =  ivec2(1,-1);
*/

vFlip =  ivec2(1,0);
if(_nIRevD < 0){
	//vFlip =  ivec2(0,1);
	
}



//gl_Position.x +=  in_TilesHV.x;



//////////////////////////////////////////////////////////////////////////////////////





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
	
//////////////////  TILES /////////////////////////

xflat in vec2 ioPtSrc1;
xflat in vec2 ioPtSrc2;
xflat in vec2 ioPtSrc3;
xflat in vec2 ioPtSrc4;

xflat in ivec2 ioSrcTL;
xflat in ivec2 ioSrcTR;
xflat in ivec2 ioSrcBR;
xflat in ivec2 ioSrcBL;

xflat in ivec2 ioSrcOT;
xflat in ivec2 ioSrcOR;
xflat in ivec2 ioSrcOB;
xflat in ivec2 ioSrcOL;

xflat in ivec2 ioOffsetL1;
xflat in ivec2 ioOffsetT1;
xflat in ivec2 ioOffsetR1;
xflat in ivec2 ioOffsetB1;

xflat in ivec2 ioOffsetL2;
xflat in ivec2 ioOffsetT2;
xflat in ivec2 ioOffsetR2;
xflat in ivec2 ioOffsetB2;

xflat in ivec2 ioOffsetTL;
xflat in ivec2 ioOffsetTR;
xflat in ivec2 ioOffsetBR;
xflat in ivec2 ioOffsetBL;

xflat in ivec2 ivTexDim;
	
xflat in ivec2 vFlip; //Sure?



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
	uniform sampler2D TexNormal;
	//uniform sampler2D TexSource;
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
	uniform vec2 vTexDim;
	
	
	xflat in mat4 iomColor;
	in vec2 ioCorner;
	in vec2 ioTexture;
	vec3 vDark;
	vec3 vLight;
	vec4 pixTex;

	



/////////////

xflat in mat4 iomWorldPt;
xflat in mat4 iomNorm;

vec4  vColorSpecular = vec4(2.0, 2.0, 1.5, 1.0); //0 to X Can be premultiplied with alpha
vec4  vColorDiffuse = vec4(1.5,1.5,1.5, 1.5);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
vec3 vAmbient = vec3(0.2, 0.2, 0.2);
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

			
			//vec2 _vPosTex = vec2( (ioPtSrc1.x + (vCoDist.b + vCoDist.r)*32.0)/511.0  ,  (ioPtSrc1.y + (vCoDist.b + vCoDist.g )*32.0)/514.0  );
			//pixTex = texture(TexCurrent, _vPosTex);
			


			//float _nFactor =  1.0 - 0.01859375;  //.499/32 or .495
		//	if(vCoDist.a + vCoDist.r   > _nFactor  ||  vCoDist.r + vCoDist.b   > _nFactor ||  vCoDist.g + vCoDist.b   > _nFactor || vCoDist.g + vCoDist.a   > _nFactor){

				//int _nRatio = 0;
				//int nRetroRatio = 4;

				//Work
				//vec2 vPosTex = vec2(ioTexture.x * vTexDim.x, ioTexture.y  * vTexDim.y) - 0.5; //+2 px border

			vec2 vRetroR = vec2(4.0,4.0);
			//ivec2 vFlip = ivec2(1,1);
			//vec2 ioOffsetTL = vec2(0.0,0);
			//vec2 ioOffsetTL = vec2(0.0,0);
			

				//vec2 vPosTex = ioTexture * vTexDim * float(1 << nRetroRatio) - 0.5;
				//ivec2 _vIPosTex = ivec2(vPosTex );
				//vPosTL = (_vIPosTex) >> nRetroRatio;
				//vPosTR = (_vIPosTex + ivec2(1, 0)) >> nRetroRatio;
				//vPosBR = (_vIPosTex + ivec2(1, 1)) >> nRetroRatio;
				//vPosBL = (_vIPosTex + ivec2(0, 1)) >> nRetroRatio;



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
					vPosTL = ioOffsetT1 +  abs( ivec2(vPosTL.x - ioSrcOT.x, vPosTL.x - ioSrcOT.x) * vFlip.xy ) ;  //TOP
					
				}else if(vPosTL.x == ioSrcTL.x){
					//vPosTL += ivec2(ioOffsetL1);  //Left
					vPosTL =  ioOffsetL1 + abs( ivec2(vPosTL.y - ioSrcOL.y,vPosTL.y - ioSrcOL.y) * vFlip.yx  ) ;  //Left
				}

				if(vPosTR == ioSrcTR ){
					vPosTR = ioOffsetTR; //Corner TR
				}else if(vPosTR.y == ioSrcTR.y){
					//vPosTR += ivec2(ioOffsetT1); //Top
					vPosTR =  ioOffsetT1 +  abs(ivec2(vPosTR.x - ioSrcOT.x,vPosTR.x - ioSrcOT.x )* vFlip.xy ) ;  //TOP
					
				}else if(vPosTR.x == ioSrcTR.x){
					//vPosTR += ivec2(ioOffsetR1); //RIGHT
					vPosTR = ioOffsetR1 + abs( ivec2(vPosTR.y - ioSrcOR.y,vPosTR.y - ioSrcOR.y )* vFlip.yx  ) ; //RIGHT
				}

				if(vPosBR == ioSrcBR ){
					vPosBR = ioOffsetBR; //Corner BR
				}else if(vPosBR.y == ioSrcBR.y){

					vPosBR = ioOffsetB1 +  abs( ivec2(vPosBR.x - ioSrcOB.x, vPosBR.x - ioSrcOB.x) * vFlip.xy  ) ;  //BOT
					
				}else if(vPosBR.x == ioSrcBR.x){

					vPosBR = ioOffsetR1 + abs( ivec2(vPosBR.y - ioSrcOR.y,vPosBR.y - ioSrcOR.y) * vFlip.yx  ) ; //Right
				}


				if(vPosBL == ioSrcBL){
					vPosBL = ioOffsetBL; //Corner BL
					
				}else if(vPosBL.y == ioSrcBL.y){
					vPosBL = ioOffsetB1 +  abs( ivec2(vPosBL.x - ioSrcOB.x,vPosBL.x - ioSrcOB.x ) * vFlip.xy ) ;  //BOT
					
				}else if(vPosBL.x == ioSrcBL.x){
					vPosBL =  ioOffsetL1 + abs( ivec2(vPosBL.y - ioSrcOL.y,vPosBL.y - ioSrcOL.y) * vFlip.yx   );  //Left
				}
		
		/*
		if(vPosBL.y == ioSrcBL.y){
		vPosBL = ivec2(1,1);
		}*/

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
				
		
		
			//pixTex = vec4(0.5,0.5,0.5,0.5);
			}else{
				pixTex = texture(TexCurrent, ioTexture);
			}
			
			

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

//FragColor =  pixTex; //Disable light
        /////////////////////////////////////////////////////
        /////////////////////// LIGHT  /////////////////////
        /////////////////////////////////////////////////////
   // if(nType == 8){ //Unicolo (no Alpha)
        /////////////////////////  Phong light  ///////////////////

        vec3 vPtWorld = (iomWorldPt * _vCoDist).xyz;
        //vec3 vPtNorm =  (iomNorm * _vCoDist).xyz;
		vec3 vPtNorm =  iomNorm[0].xyz;
/*
vec4 pixNormal = texture(TexNormal, ioTexture);		 
//vPtNorm = vPtNorm * pixNormal.xyz;
vPtNorm = cross(vPtNorm.xyz, pixNormal.xyz);
*/ 
	 
/////// MY AUTO Bump //////////
float _nMonoCrome =   0.5-(pixTex.r + pixTex.g + pixTex.b)/3.0;
vec3 _vMyNorm = vec3((_nMonoCrome-0.5)*2.0, (0.5 - _nMonoCrome)*2.0,  _nMonoCrome  );

vPtNorm = cross(vPtNorm.xyz, _vMyNorm.xyz);


////////////////////////// 
	 
	 
	 
	 
	 
	 
	 
	 
		
		//vec3 vPtNorm = vec3(0.0,1.0,0.0);


      //  vec3 light_position = vec3(1514.0 ,-600.0, -800.0);
       // vec3 eye_position =   vec3( 500.0,  384.0,-1024.0);
		
	 
        //vec3 light_position = vec3(  300.0, 300.0, -500.0);
        vec3 light_position = vec3(  300.0, 400.0, 200.0);
        vec3 eye_position =   vec3( 300.0,300.0, 5000.0);
		
		
		

        vec3 L = normalize( light_position - vPtWorld);//light direction
        vec3 V = normalize( eye_position - vPtWorld);//view direction


        float LdotN = max(0.0, dot(L,vPtNorm));

        float diffuse = 0.85 * LdotN; //0.5 Just a random material

		
		//http://in2gpu.com/2014/06/19/lighting-vertex-fragment-shader/
		
		//0 to 1
        float att_kC = 0.9; //Kc is the constant attenuation
        float att_kL = 0.6; //KL is the linear attenuation
        float att_kQ = 0.8; //KQ is the quadratic attenuation
 

        //attenuation
       // float d = distance( light_position,  vPtWorld) / 800.0;
        float d = distance( normalize(light_position),  normalize(vPtWorld.xyz) );
		//d =  1.5;
       // float att = 1.0 / (att_kC + d * att_kL + d*d*att_kQ); //Do the inverse
        float att =  (att_kC + d * att_kL + d*d*att_kQ);
//att = 0.0;

        float specular = 0.0;

        if(LdotN > 0.0){
          //choose H or R to see the difference
          vec3 R = -normalize(reflect(L, vPtNorm));//Reflection
           // specular = 0.65 * pow(max(0.0, dot(R, V)), 512); //https://learnopengl.com/Lighting/Basic-Lighting
            specular = pow(max(0.0, dot(R, V)), 16.0);//0.15  https://learnopengl.com/Lighting/Basic-Lighting
		
          //Blinn-Phong
          vec3 H = normalize(L + V );//Halfway
          specular = 0.65 * pow(max(0, dot(H, vPtNorm)), 0.65);
		  
        }

		
		  //// Custom interpolated color ////
        vDark  = clamp(vPtDist.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vPtDist.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb) * vec3(vPtDist.a) * vDark);
        pixTex.a *= vPtDist.a;
		
	
	
        //// Diffuse ////
     
		//vColorDiffuse.rgb = (vColorDiffuse.rgb) * ((att *diffuse)*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
		vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse/ att )*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
		
		vDark  = clamp(vColorDiffuse.rgb + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
        vLight = clamp(vColorDiffuse.rgb , 0.0, 1.0); //0 a 1 -> = 0 if Dark
        pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  * vDark);
		

		
		//vPtDist += vColorDiffuse + vec4(vAmbient,0.0);
		
	
        // Specular
      //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * att * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
        vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
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
			
			var _oAtQuadVertexID : Attribute =  new Attribute("atVertexID", oVboBatch, 0);//TODO null!
			//oProgram.fAttachAttribute(_oAtQuadVertexID);
			
				
			oAtQuad.fLocateAttribute(oProgram);
			oAtTiles.fLocateAttribute(oProgram);
		//	Debug.fTrace("Finish fLocateAttribute");

		//	oAtQuadOffsetHV = oProgram.fAddAttribute("in_OffsetHV");
		//	oAtQuadOffsetC = oProgram.fAddAttribute("in_OffsetC");
			
			

		//	var _oAtQuadVertexID : Attribute = oProgram.fAddAttribute("atVertexID",0);
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
	
			//oVbo.fIniData(Context.oItf.nTotalFaces , 4, 13 );
			oVbo.fIniData(Context.oItf.nTotalFaces , 4, 15 );
		
			oAtQuad.fIniData();
			oAtTiles.fIniData();
			
		}
		
		public function fUpdate():Void {
		
		
			oVbo.fSendData();
		
		//	oAtQuad.fUpdate();
			
			
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
			//Debug.fTrace("!" +  oAtQuad.aData[0]  );
			
			
			//if(bTest == false){
			//	bTest = true;
		
			if(nTest  < 4){
				Debug.fTrace("------------------------------- " + nTest);
				Debug.fTrace("----Size ---- " + oVbo.aData.nSize);
				//for(var i : Int = 0; i  < oAtQuad.oVbo.aData.nSize; i+=4){
				//for(var i : Int = 0; i  < oVbo.aData.nSize; i+=8){
				for(var i : Int = 0; i  < 15 * Context.oItf.nTotalFaces; i+=Context.oItf.nTotalFaces){
					Debug.fTrace("[" +  oVbo.aData[i] + "," +  oVbo.aData[i+1] + "," +  oAtQuad.oVbo.aData[i+2] + "," +  oAtQuad.oVbo.aData[i+3] + "]" );
				}
				nTest++;
			}
			
	
			/*
			forEach(var _nData : float in oAtQuad.aData){
			
			}*/
			//Debug.fTrace(oAtQuad.aData);
		}
		
		
	}
}