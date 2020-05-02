package  { 

import GZ.Gpu.ShaderBase.FragmentShader;
import GZ.Gpu.ShaderBase.VertexShader;
import GZ.Gpu.ShaderBase.ProgramShader;
import GZ.Gpu.Base.Attribute;
import GZ.Gpu.Base.Texture;
import GZ.Gpu.Base.Uniform;
import GZ.Gpu.Base.UnVec2;
import GZ.Gpu.Base.UnVec3;
import GZ.Gpu.Base.UnVec4;
import GZ.Gpu.Base.UaVec4;
import GZ.Gpu.Base.UnFloat;
import GZ.Gpu.Base.UnInt;
import GZ.Gpu.Base.Texture;
import GZ.Gpu.ShaderBase.Vbo;
import GZ.Gpu.GpuObj.GpuBatch;
import GZ.Base.Perspective;
import GZ.Sys.Interface.Context;
import GZ.Gpu.ShaderModel.GzModel.GzShModel;
import GZ.Gpu.ShaderBase.ShaderBase;
import GZ.Base.Vec4;

import GZ.Gfx.Effects.Light;
import GZ.Gfx.Vector.Box;

public class GzShCommun_Tile {

	public var oUnRetroRatio : UnFloat;

	
	public function  GzShCommun_Tile():Void {
	}
	
	public static function  fIniData(_oProgram:ProgramShader):Void {
		
	}
	
	

		
	public static function fAdd_VertexBasics(_oVertex:VertexShader):Bool {
		<glsl(_oVertex)>
		
				
		</glsl>	
	}
	
	public static function fAdd_FragmentBasics(_oFrag:VertexShader):Bool {
		<glsl(_oFrag)>
		
		</glsl>	
	}

	public static function fAdd_Vertex_Func_fTile(_oShader:VertexShader):Bool {
		<glsl(_oShader)>
		

		
		
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
	
		//// TILES ///////
		ivec2 ioSrcTL;
		ivec2 ioSrcTR;
		ivec2 ioSrcBR;
		ivec2 ioSrcBL;

		ivec4 ioSrcTRBL;

		ivec2 ioOffsetL1;
		ivec2 ioOffsetT1;
		ivec2 ioOffsetR1;
		ivec2 ioOffsetB1;


		ivec2 ioOffsetTL;
		ivec2 ioOffsetTR;
		ivec2 ioOffsetBR;
		ivec2 ioOffsetBL;

		ivec2 ivTexDim;
			
		ivec2 vFlip;

		int nOriTX;
		int nOriBX;
		int nOriLY;
		int nOriRY;
		//////////////////

		void fTile(){
			
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

	public static function fAdd_Fragment_Func_fTile(_oShader:FragmentShader):Bool {
		<glsl(_oShader)>
		
		
		////////////// TILE ///////////////////////

		#define ioSrcTL (ish_Slot_0.xy)
		#define ioSrcTR (ish_Slot_0.ba)
		#define ioSrcBR (ish_Slot_1.xy)
		#define ioSrcBL (ish_Slot_1.ba)

		#define ioOffsetL1 ivec2(sh_Slot_0.xy)
		#define ioOffsetT1 ivec2(sh_Slot_0.ba)
		#define ioOffsetR1 ivec2(sh_Slot_1.xy)
		#define ioOffsetB1 ivec2(sh_Slot_1.ba)

		#define ioOffsetTL ivec2(sh_Slot_2.xy)
		#define ioOffsetTR ivec2(sh_Slot_2.ba)
		#define ioOffsetBR ivec2(sh_Slot_3.xy)
		#define ioOffsetBL ivec2(sh_Slot_3.ba)

		#define ioSrcTRBL (sh_Slot_4)
		#define ioSrcOT int(ioSrcTRBL.r)
		#define ioSrcOR int(ioSrcTRBL.g)
		#define ioSrcOB int(ioSrcTRBL.b)
		#define ioSrcOL int(ioSrcTRBL.a)

		#define vFlip ivec2(sh_Slot_5.xy)
			
					
		vec4 fTile(){

			ivec2 vPosTL;
			ivec2 vPosTR;
			ivec2 vPosBR;
			ivec2 vPosBL;
		
		//Normal
		//pixTex = texture(TexCurrent, ioTexture);


		//float _nFactor =  1.0 - 0.01859375;  //.499/32 or .495
	//	if(vCoDist.a + vCoDist.r   > _nFactor  ||  vCoDist.r + vCoDist.b   > _nFactor ||  vCoDist.g + vCoDist.b   > _nFactor || vCoDist.g + vCoDist.a   > _nFactor){

			//int _nRatio = 0;
			//int nRetroRatio = 4;

			//Work
			//vec2 vPosTex = vec2(ioTexture.x * vTexDimFetch.x, ioTexture.y  * vTexDimFetch.y) - 0.5; //+2 px border

			vec2 vRetroR = vec2(1.0,1.0);

			//vec2 vPosTex = ioTexture * vTexDimFetch * float(1 << nRetroRatio) - 0.5;
			//ivec2 _vIPosTex = ivec2(vPosTex );
			//vPosTL = (_vIPosTex) >> nRetroRatio;
			//vPosTR = (_vIPosTex + ivec2(1, 0)) >> nRetroRatio;
			//vPosBR = (_vIPosTex + ivec2(1, 1)) >> nRetroRatio;
			//vPosBL = (_vIPosTex + ivec2(0, 1)) >> nRetroRatio;

			//float _nRatio = float(nRetroRatio);
			//vec2 vPosTex = ( (ioTexture.xy).xy  * vRetroR  );
			vec2 vPosTex = ( sh_vTexture.xy  * vRetroR  );
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
				vPosTL = ioOffsetT1 +  abs( ivec2(vPosTL.x - ioSrcOT, vPosTL.x - ioSrcOT) * vFlip.xy ) ;  //TOP
			}else if(vPosTL.x <= ioSrcTL.x ){
				//vPosTL += ivec2(ioOffsetL1);  //Left
				vPosTL =  ioOffsetL1 + abs( ivec2(vPosTL.y - ioSrcOL,vPosTL.y - ioSrcOL) * vFlip.yx  ) ;  //Left
			}
	
			//TR Clamp oposite side (on device with not enogh precision)
			if(vPosTR.y >= ioSrcBR.y){vPosTR.y = ioSrcBR.y - 1;}
			if(vPosTR.x <= ioSrcBL.x){vPosTR.x = ioSrcBL.x + 1;}
			if(vPosTR == ioSrcTR ){
				vPosTR = ioOffsetTR; //Corner TR
			}else if(vPosTR.y <= ioSrcTR.y ){
				//vPosTR += ivec2(ioOffsetT1); //Top
				vPosTR =  ioOffsetT1 +  abs(ivec2(vPosTR.x - ioSrcOT,vPosTR.x - ioSrcOT )* vFlip.xy ) ;  //TOP	
				
			}else if(vPosTR.x >= ioSrcTR.x ){
				//vPosTR += ivec2(ioOffsetR1); //RIGHT
				vPosTR = ioOffsetR1 + abs( ivec2(vPosTR.y - ioSrcOR,vPosTR.y - ioSrcOR )* vFlip.yx  ) ; //RIGHT	
			}
		
			// BR Clamp oposite side
			if(vPosBR.y <= ioSrcTR.y){vPosBR.y = ioSrcTR.y + 1;}
			if(vPosBR.x <= ioSrcBL.x){vPosBR.x = ioSrcBL.x + 1;}
			if(vPosBR == ioSrcBR ){
				vPosBR = ioOffsetBR; //Corner BR
			}else if(vPosBR.y >= ioSrcBR.y){
				vPosBR = ioOffsetB1 +  abs( ivec2(vPosBR.x - ioSrcOB, vPosBR.x - ioSrcOB) * vFlip.xy  ) ;  //BOT

			}else if(vPosBR.x >= ioSrcBR.x){
				vPosBR = ioOffsetR1 + abs( ivec2(vPosBR.y - ioSrcOR,vPosBR.y - ioSrcOR) * vFlip.yx  ) ; //Right
			}
		

			// BL Clamp oposite side
			if(vPosBL.y <= ioSrcTR.y){vPosBL.y = ioSrcTR.y + 1;}
			if(vPosBL.x >= ioSrcBR.x){vPosBL.x = ioSrcBR.x - 1;}
			if(vPosBL == ioSrcBL){
				vPosBL = ioOffsetBL; //Corner BL
				
			}else if(vPosBL.y >= ioSrcBL.y ){
				vPosBL = ioOffsetB1 +  abs( ivec2(vPosBL.x - ioSrcOB,vPosBL.x - ioSrcOB ) * vFlip.xy ) ;  //BOT
				
			}else if(vPosBL.x <= ioSrcBL.x){
				vPosBL =  ioOffsetL1 + abs( ivec2(vPosBL.y - ioSrcOL,vPosBL.y - ioSrcOL) * vFlip.yx   );  //Left
			}
		

			vec4 vPixTL = fTexelFetch(sh_iTexID, vPosTL);
			vec4 vPixTR = fTexelFetch(sh_iTexID, vPosTR);
			vec4 vPixBR = fTexelFetch(sh_iTexID, vPosBR);
			vec4 vPixBL = fTexelFetch(sh_iTexID, vPosBL);
			
			
/*
			vec4 vPixTL = texture(TexCurrent, (vec2(vPosTL) + 0.5) /vTexDimFetch );
			vec4 vPixTR = texture(TexCurrent, (vec2(vPosTR) + 0.5) /vTexDimFetch);
			vec4 vPixBR = texture(TexCurrent, (vec2(vPosBR) + 0.5) / vTexDimFetch);
			vec4 vPixBL = texture(TexCurrent, (vec2(vPosBL) + 0.5) /vTexDimFetch);
*/

			vec2 vFracTL = 1.0 - fract(vPosTex );
			vec2 vFracBR = fract(vPosTex + 1.0 );

			float _nRAlphaTR = (vFracBR.x * vFracTL.y);
			float _nRAlphaBR = (vFracBR.x * vFracBR.y);
			float _nRAlphaBL = (vFracTL.x * vFracBR.y);
			//float _nRAlphaTL = (vFracTL.x * vFracTL.y) ;
			float _nRAlphaTL = 1.0 - (_nRAlphaTR +_nRAlphaBR + _nRAlphaBL) ;

			vec4 _pix = vPixTL * _nRAlphaTL +  vPixTR * _nRAlphaTR +  vPixBR * _nRAlphaBR +  vPixBL * _nRAlphaBL;
			return _pix;
		}
		</glsl>	
	
	}
	
	
	
	
	
	
	
}
}