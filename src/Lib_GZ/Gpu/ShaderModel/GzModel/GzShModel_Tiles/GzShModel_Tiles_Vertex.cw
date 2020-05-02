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
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Tile;
	
	
	public extension GzShModel_Tiles_Vertex extends GzShModel_Tiles_Fragment {


		override public function fLoad_Vertex():Bool {
		
			GzShCommun_Base.fAdd_VertexBasics(oVertex);
			GzShCommun_Base.fAdd_Default_Vertex_Attribut(oVertex);
			GzShCommun_Base.fAdd_Default_15_Slot(oVertex);
						
			GzShCommun_Base.fAdd_Func_Basics(oVertex);
			GzShCommun_Base.fAdd_Vertex_Func_Basics(oVertex);
			
			GzShCommun_Tile.fAdd_Vertex_Func_fTile(oVertex);
			
			
<glsl(oVertex)>



	uniform vec2 nPos;
	uniform vec2 nTexDim;
	uniform vec2 nTexDimSource;

	uniform vec4 v1Color;
	uniform mat4 mColor;
	/////////////////


	uniform vec2 vTexDimFetch;



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

///xflat out vec4 ioObjRot;
vec3 ioNorm;
//xflat out vec3 ioNorm1;
//xflat out vec3 ioNorm2;
//xflat out vec3 ioNorm3;
//xflat out vec3 ioNorm4;

mat4 iomWorldPt;
//xflat out mat4 iomNorm;
/////////



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
	//	ioTexture.x = (vSrc.x  ) ;
	//	ioTexture.y = (vSrc.y );
		
		
	
		if(sh_iType == 6){
		
			sh_vTexture =  vSrc.xy;
		}else{
			//////////// SRC ///////////////
			sh_vTexture.x = (vSrc.x + 0.5 ) / (TexSize[iTexID].x );
			sh_vTexture.y = (vSrc.y + 0.5 ) / (TexSize[iTexID].y );
			////////////////////////////////
		}
		//sh_vTexture =  vSrc.xy;
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
		//ioObjRot = in_ObjRot;
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

	 fTile();
/////////////////////////// TILES ///////////////////////////////////////////
	//in vec4 in_TilesHV; //Vertical
	//in vec4 in_TilesC;  //Horizontal
	//in vec4 in_TexSource0;  //Sx3,Sy3,Sx4,Sy4
	//in vec4 in_TexSource1;  //Sx3,Sy3,Sx4,Sy4
//TILESET SRC


}
</glsl>
	}
}
}