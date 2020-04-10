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
			
			#define iTexID int(in_ObjSize.w)
			#define nTexID in_ObjSize.w
			#define nType in_ObjPos.w

			in vec4 in_ObjPos; //x, y, z, nType 
			in vec4 in_ObjSize;  //Width,Height,Length, TextureLocationID
			in vec4 in_ObjRot; //Quaternion -> x, y, z, w
				
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
					return texture(Texture[ndx], uv);
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
				
		</glsl>	
	
	}
	
	
}
}