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
import GZ.Gpu.ShaderBase.ShaderBase;

public class GzShCommun_Base {

	public static function fAdd_VertexBasics(_oVertex:VertexShader):Bool {
		<glsl(_oVertex)>
					
			#define nMaxTextures 8
					
			uniform int ID_TexCurrent; 
			uniform int ID_TexNormal; 
			uniform int ID_TexSprites; 
			uniform int ID_TexFont; 

			uniform vec2 	  TexSize[nMaxTextures];
			//uniform sampler2D Texture[nMaxTextures];
			
			#define iTexID int(in_ObjSize.w + 0.1)
			#define iType int(in_ObjPos.w + 0.1)


			in vec4 in_ObjPos; //x, y, z, nType 
			in vec4 in_ObjSize;  //Width,Height,Length, TextureLocationID
			in vec4 in_ObjRot; //Quaternion -> x, y, z, w
				
			uniform vec4 vPersp;
				
		</glsl>	
	}
	
	public static function fAdd_FragmentBasics(_oVertex:VertexShader):Bool {
		<glsl(_oVertex)>
					
			#define nMaxTextures 8
				
			uniform int ID_TexCurrent; 
			uniform int ID_TexNormal; 
			uniform int ID_TexSprites; 
			uniform int ID_TexFont; 

			uniform vec2 	  TexSize[nMaxTextures];
			uniform sampler2D Texture[nMaxTextures];
			
			uniform vec4 vPersp;
			
			//E:Error linking OpenGL Program:: 
			//error X3512: sampler array index must be a literal expression
			//Warning: D3D shader compilation failed with default flags. (ps_5_0)
			//--> A variable of sampler can only be defined in one of two ways. It can be defined as a function parameter or as a uniform variable.
			// Ony for Angle?	 Only D3D9?
			//vec4 fGetPixel(sampler2D textures[4], int ndx, vec2 uv) {
			vec4 fTexture(int ndx, vec2 uv) {
				#ifdef d_WebGL
					switch(ndx){
						case 0:return texture(Texture[0], uv);
						case 1:return texture(Texture[1], uv);
						case 2:return texture(Texture[2], uv);
						case 3:return texture(Texture[3], uv);
						case 4:return texture(Texture[4], uv);
						case 5:return texture(Texture[5], uv);
						case 6:return texture(Texture[6], uv);
						case 7:return texture(Texture[7], uv);
					}
					/*
					for (int i = 0; i < nMaxTextures; ++i) {
						if (i == ndx) {
							return texture(Texture[i], uv);
						}
					}*/
				#else
					vec4 _pix = texture(Texture[ndx], uv);
					if(_pix.x == 0){};//Resolve wrong lookup bug on AMD
					return _pix;
					
				#endif
			}

			vec4 fTexelFetch(int ndx, ivec2 uv) {
				#ifdef d_WebGL
					switch(ndx){
						case 0:return texelFetch(Texture[0], uv,0);
						case 1:return texelFetch(Texture[1], uv,0);
						case 2:return texelFetch(Texture[2], uv,0);
						case 3:return texelFetch(Texture[3], uv,0);
						case 4:return texelFetch(Texture[4], uv,0);
						case 5:return texelFetch(Texture[5], uv,0);
						case 6:return texelFetch(Texture[6], uv,0);
						case 7:return texelFetch(Texture[7], uv,0);
					}
				#else
					return texelFetch(Texture[ndx], uv,0);
				#endif
			}
		</glsl>	
	}

	public static function fAdd_Func_Basics(_oShader:ShaderBase):Bool {
		<glsl(_oShader)>
				
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
			
			vec3 fRotate(vec3 vPt, vec3 vRot){
				float _nYaw = vRot.y *   3.1416 / 2.0;
				float _nPitch = vRot.z *   3.1416/ 2.0;
				float _nRoll = vRot.x *   3.1416/ 2.0;
				float _nTx  = (vPt.x * cos(_nYaw)) - (vPt.z * sin(_nYaw));
				float _nTz  = (vPt.x * sin(_nYaw)) + (vPt.z * cos(_nYaw));
				float _nTy  = (vPt.y * cos(_nPitch)) - (_nTz * sin(_nPitch));
				vPt.z = (vPt.y * sin(_nPitch) * -1.0) - (_nTz * cos(_nPitch));
				vPt.x = (_nTx * cos(_nRoll)) - (_nTy * sin(_nRoll));
				vPt.y = (_nTx * sin(_nRoll)) + (_nTy * cos(_nRoll));
				return vPt;
			}
			
				
			
		</glsl>	
	
	}
	
		public static function fAdd_Vertex_Func_Basics(_oShader:ShaderBase):Bool {
		<glsl(_oShader)>
				
			vec4 f3dTo2d(vec3 _pos) {	 //TODO only vertex?
				_pos.xyz *=  in_ObjSize.xyz;

				//Quaternion
				_pos.xyz = fQRot(_pos.xyz, in_ObjRot);

				//////////// 3D To 2D ////////////////////
				vec3 _vObjPos = in_ObjPos.xyz;

				float nZx = ((_pos.z + _vObjPos.z) * (-1.0/vPersp.z)) + 1.0;
				
				if(vPersp.w == 1.0){ //Self perspective
					_pos.xy = (_pos.xy ) / nZx;
				}else{
					_pos.xy = (_pos.xy + (_vObjPos.xy - vPersp.xy) ) / nZx - (_vObjPos.xy - vPersp.xy);
				}
				///////////// 2D to Screen ////////////////////
				vec4 _result;
				_result.w = nZx;
				_result.x = (((_pos.x ) + _vObjPos.x  ) - (iResolution.x/2.0) )/ (iResolution.x/2.0) * nZx ;
				_result.y = (((_pos.y ) + _vObjPos.y )  - (iResolution.y/2.0)) / (iResolution.y/2.0) * nZx;
				_result.z =  0.0;
				return _result;
			}
			
		</glsl>	
	
	}
	
	
}
}