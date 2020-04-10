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

public class GzShCommun_Light {

	public var oUnEyePos : UnVec3;
	public var oUnAmbiant : UnVec3;
	

	
	public var oUaAmbiant : UaVec4;
	
	public var  oLight_Color_Diffuse : UaVec4;
	public var  oLight_Color_Specular : UaVec4;
	public var  oLight_Position : UaVec4;
	
	public var oLight : Light;
	
	public var oUnTotalLight : UnInt;
	
	//public var oObj : Box;
	
	public function  GzShCommun_Light():Void {
	}
	
	public static function  fIniData(_oProgram:ProgramShader):Void {
		oUnEyePos = new UnVec3(_oProgram, "vEye_position");
		oUnAmbiant = new UnVec3(_oProgram, "vAmbient");
		
		oLight_Color_Diffuse = new UaVec4(_oProgram, "avLight_Color_Diffuse");
		oLight_Color_Specular = new UaVec4(_oProgram, "avLight_Color_Specular");
		oLight_Position = new UaVec4(_oProgram, "avLight_Position");
		
		oUnTotalLight = new UnInt(_oProgram, "iTotalLight");
		
		
		var _vColor : Vec4<Float> = new Vec4<Float>(1.0, 0.0, 0.0, 0.5 );
	//	oLight_Color_Specular.aVal.fPush(_vColor);
	//	oLight_Color_Specular.fSend();
		
		
		//TODO Make a UpCast Testing to find bugs
	///	var _oLight : Light = new Light( 400.0,300.0, -300.0); //Bug??
		//oLight = new Light( 400.0,300.0, -300.0);
		//fAddLight(_oLight);
		//oObj = new Box( 300,300,  200,200,    5);//Bug??
		//var _oObj: Box = new Box( 300,300,  200,200,    5);//Bug??
	}
	
	
	public static function fAddLight():UInt {
		
		
		/*
		oLight_Position.aVal.fPush(new Vec4<Float>());
		oLight_Color_Diffuse.aVal.fPush(new Vec4<Float>());
		oLight_Color_Specular.aVal.fPush(new Vec4<Float>());
		*/
		
		
		oUnTotalLight.nVal++;
		return oUnTotalLight.nVal-1;
	}

	public static function fUpdateLight(_nIndex: UInt, _oLight: Light):UInt {
		var _vPos : Vec4<Float> = new Vec4<Float>(_oLight.oGblPt.vPt.nX, _oLight.oGblPt.vPt.nY, _oLight.oGblPt.vPt.nZ, 0.5 );
		var _vColorDiff : Vec4<Float> = new Vec4<Float>(_oLight.oBoxColor.vColor.nRed, _oLight.oBoxColor.vColor.nGreen, _oLight.oBoxColor.vColor.nBlue, _oLight.oBoxColor.vColor.nAlpha );
		var _vColorSpec : Vec4<Float> = new Vec4<Float>(_oLight.oBoxSpecular.vColor.nRed, _oLight.oBoxSpecular.vColor.nGreen, _oLight.oBoxSpecular.vColor.nBlue, _oLight.oBoxSpecular.vColor.nAlpha );
		
		/**
		oLight_Position.aVal.fPush(_vPos);
		oLight_Color_Diffuse.aVal.fPush(_vColorDiff);
		oLight_Color_Specular.aVal.fPush(_vColorSpec);
		*/
		
		oLight_Position.aVal[_nIndex] = _vPos;
		oLight_Color_Diffuse.aVal[_nIndex] = _vColorDiff;
		oLight_Color_Specular.aVal[_nIndex] = _vColorSpec;
		
		//oUnTotalLight.nVal++;
	}

	public static function fSendLight():Void {
		oLight_Position.fSend();
		oLight_Color_Diffuse.fSend();
		oLight_Color_Specular.fSend();
		oUnTotalLight.fSend();
	}
	
	
	public static function fSetEyePos():Void {
		oUnEyePos.vVal.nX = 400;
		oUnEyePos.vVal.nY = 300;
		oUnEyePos.vVal.nZ = -500;
		oUnEyePos.fSend();
	}
	
	public static function fSetAmbiant():Void { // -1.0 to 1.0
	
		oUnAmbiant.vVal.nX = 0;
		oUnAmbiant.vVal.nY = 0;
		oUnAmbiant.vVal.nZ =0;
		/*
		oUnAmbiant.vVal.nX = -1;
		oUnAmbiant.vVal.nY = -1;
		oUnAmbiant.vVal.nZ = -1;
		
		*/
		oUnAmbiant.fSend();
	}
		
	public static function fAdd_VertexBasics(_oVertex:VertexShader):Bool {
		<glsl(_oVertex)>
		
				
		</glsl>	
	}
	
	public static function fAdd_FragmentBasics(_oVertex:VertexShader):Bool {
		<glsl(_oVertex)>
		
		</glsl>	
	}

	
	//for (int i = 0; i < n && i < MAX_N; ++i) gives a dynamic bound and allows the compiler to unroll
	public static function fAdd_Func_fAddLight(_oShader:ShaderBase):Bool {
		<glsl(_oShader)>
		
			#define MAX_LIGHT 20
			
			uniform int iTotalLight;
			//uniform float nDiffuseTranslucidity; //0 = none / -1 = full
			uniform float nDiffuseTranslucidity ; //0 = none / -1 = full
			///////////// 
			uniform vec4 avLight_Color_Specular[MAX_LIGHT];
			uniform vec4 avLight_Color_Diffuse[MAX_LIGHT];
			uniform vec4 avLight_Position[MAX_LIGHT]; //.w .a = Constant Attenuation / alpha
			uniform vec2 avLight_Attenuation[MAX_LIGHT];
			
		
			vec4  vColorSpecular = vec4(1.0,1.0,0.2 , 0.5); //0 to X Can be premultiplied with alpha
			vec4  vColorDiffuse = vec4(1.0, 1.0, 1.0, 2.75);  //rgb -1 to 2  no diffuse : vec4(0.0,0.0,0.0, 1.0); normal : vec4(1.0,1.0,1.0, 1.0);
			
		//  vec3 light_position  =   vec3( 400.0,300.0, 0.0);
			vec3 light_position  =   vec3( 400.0,300.0, -300.0);
		

			//0 to 1
			//float att_kC = 1.02; //Kc is the constant attenuation
			float att_kC = 1.00; //Kc is the constant attenuation
			float att_kL = 0.01; //KL is the linear attenuation
			float att_kQ = 0.000; //KQ is the quadratic attenuation

			/*
			float att_kC = 0.08; //Kc is the constant attenuation
			float att_kL = 0.08; //KL is the linear attenuation
			float att_kQ = 0.002; //KQ is the quadratic attenuation
			*/
			////////////
			
			//vec3 vAmbient = vec3(-1.0, -1.0, -1.0);
			//vec3 vAmbient = vec3(0.0, 0.0, 0.0);
			uniform vec3 vAmbient; // -1.0 to 1.0
			
			// vec3 eye_position = vec3(  400.0, 1600.0, -300.0);
			uniform vec3 vEye_position;
			//vec3 vEye_position = vec3(  400.0, 300.0, -500.0);
		
			vec4 fAddLight(vec4 pixTex, vec3 vPtWorld, vec3 vPtNorm) {
				
				vec3 vDark;
				vec3 vLight;
				
		  //   vec3 L = ( vPtWorld - light_position );//light direction
			   // vec3 V = (  vPtWorld - eye_position );//view direction

			
				vec3 V = ( vPtWorld - vEye_position  );//view direction


			   // vec3 L = normalize( light_position - vPtWorld);//light direction
			   // vec3 V = normalize( eye_position - vPtWorld);//view direction


				vec3 L = ( vPtWorld -avLight_Position[0].xyz     );///temp
				float LdotN = max(0.0, dot(L,vPtNorm)); //temp
				//float diffuse = 0.50 * LdotN; //0.5 Just a random material

				
				//http://in2gpu.com/2014/06/19/lighting-vertex-fragment-shader/
				

				
				float _nGAtt = 0.0;
				float _nGDiffuse = 0.0;
				float _nGSpecular = 0.0;
				for (int i = 0; i < iTotalLight && i < MAX_LIGHT; ++i)  {
					//diffuse
					//vec3 nLDir = ( vPtWorld -avLight_Position[i].xyz     );//light direction
					vec3 nLDir = normalize( vPtWorld -avLight_Position[i].xyz     );//light direction
					//float nLdotN = max(0.0, dot(nLDir,vPtNorm));
					float nLdotN =  dot(vPtNorm, nLDir);
					if(nLdotN < 0){
						nLdotN *= nDiffuseTranslucidity; //Must be negative
					}

						float diffuse = 0.5 * nLdotN; //0.5 Just a random material
						//_nGDiffuse += diffuse;

						//attenuation
						float d = distance( (avLight_Position[i].xyz),  (vPtWorld.xyz) );
						float att = 1.0 / (att_kC + d * att_kL + d*d*att_kQ); //Do the inverse
						_nGAtt += att;
					
					if(nLdotN > 0.0){
						float specular = 0.0;
						/*
						//choose H or R to see the difference
						vec3 R = -normalize(reflect(nLDir, vPtNorm));//Reflection
						// specular = 0.65 * pow(max(0.0, dot(R, V)), 512); //https://learnopengl.com/Lighting/Basic-Lighting
						//specular = material_kd * pow(max(0, dot(H, world_normal)), material_shininess);
						specular = 0.20 *  pow(max(0.0, dot(R, V)), 1.9);//0.15  https://learnopengl.com/Lighting/Basic-Lighting
	
						vec3 H = normalize(nLDir + V );//Halfway
						//specular = 100.65 * pow(max(0.0, dot(H, vPtNorm)), 3.8);
						//specular =  pow(max(0.0, dot(H, vPtNorm)), 256); //pow = shininess https://learnopengl.com/img/lighting/basic_lighting_specular_shininess.png
						//specular =  pow(max(0.0, dot(H, vPtNorm)), 256); //pow = shininess https://learnopengl.com/img/lighting/basic_lighting_specular_shininess.png
						*/
						//Blinn-Phong
						vec3 viewDir = normalize(vPtWorld - vEye_position  );
						vec3 reflectDir = reflect(-nLDir, vPtNorm);  
						specular =  pow(max(0.0, dot(viewDir, reflectDir)), 256); //pow = shininess https://learnopengl.com/img/lighting/basic_lighting_specular_shininess.png

						_nGSpecular += specular;
					}
					
				}
			 
			 
		//att = 0.0009;
		//att = 0.0;
/*
				float specular = 0.0;

				if(LdotN > 0.0){
				  //choose H or R to see the difference
				  vec3 R = -normalize(reflect(L, vPtNorm));//Reflection
				   // specular = 0.65 * pow(max(0.0, dot(R, V)), 512); //https://learnopengl.com/Lighting/Basic-Lighting
				//specular = material_kd * pow(max(0, dot(H, world_normal)), material_shininess);
					specular = 0.20 *  pow(max(0.0, dot(R, V)), 1.9);//0.15  https://learnopengl.com/Lighting/Basic-Lighting
				
				  //Blinn-Phong
				  vec3 H = normalize(L + V );//Halfway
				  specular = 100.65 * pow(max(0.0, dot(H, vPtNorm)), 7.8);
				  
				}
*/

				//// Diffuse ////
			 
				//vColorDiffuse.rgb = (vColorDiffuse.rgb) * ((att *diffuse)*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
			//	vColorDiffuse.rgb = (vColorDiffuse.rgb) * (( diffuse*att )*vColorDiffuse.a+(1.0-vColorDiffuse.a)) + vAmbient;
				vec3 _vDiffuse = (avLight_Color_Diffuse[0].rgb) * (( _nGDiffuse*_nGAtt )*avLight_Color_Diffuse[0].a) + vAmbient;
				
				vDark  = clamp(_vDiffuse + 1.0, 0.0, 1.0); //0 a 1 -> = 1 if bright
				vLight = clamp(_vDiffuse , 0.0, 1.0); //0 a 1 -> = 0 if Dark
			//	pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb ) * vLight) + pixTex.rgb)  * vDark);
				

				
				//vPtDist += vColorDiffuse + vec4(vAmbient,0.0);
			

				// Specular
			  //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * att * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
			  //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * specular -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
			   // vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * (specular *att)  -1.0, 0.0, 1.0); //0 a 1 -> = 0 if Dark
			  //  vLight = clamp(vColorSpecular.rgb * vColorSpecular.a * ((specular *att)-1.0), 0.0, 1.0); //0 a 1 -> = 0 if Dark
				vLight = clamp(avLight_Color_Specular[0].rgb * avLight_Color_Specular[0].a * ((_nGSpecular *_nGAtt))  + vLight, 0.0, 1.0); //0 a 1 -> = 0 if Dark
				

				pixTex.rgb = (((( vec3(pixTex.a) -  pixTex.rgb )  * vLight) + pixTex.rgb) * vDark  );


		   // }
		//pixTex.a = 0.5;

			return pixTex;
		//float light =  att * diffuse + att * specular;
		//FragColor =  vec4(att * diffuse,  att *specular, 0.0,1.0);
		}
		</glsl>	
	
	}
	
	
	
	
	
	
	
}
}