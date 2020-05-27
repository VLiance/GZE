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
			
			GzShCommun_Base.fAdd_FragmentBasics(oFragement);
			GzShCommun_Base.fAdd_Default_15_Slot(oFragement, true);
			GzShCommun_Base.fAdd_Func_Basics(oFragement);
			GzShCommun_Base.fAdd_Fragment_Func_Basics(oFragement);
			GzShCommun_Light.fAdd_Func_fAddLight(oFragement);
		//	GzShCommun_Tile.fAdd_Fragment_Func_fTile(oFragement);
		
			
		
			///////////// Fragment Shader //////////////
<glsl(oFragement)>

//Test UBO
#define MAX_UBO_vec4 4096

layout (std140) uniform myUBO{ 
  vec4 uboVal[MAX_UBO_vec4];
};



#define time iTime
#define res iResolution

float bounce;

// signed box
float sdBox(vec3 p,vec3 b)
{
  vec3 d=abs(p)-b;
  return min(max(d.x,max(d.y,d.z)),0.)+length(max(d,0.));
}

// rotation
void pR(inout vec2 p,float a) 
{
	p=cos(a)*p+sin(a)*vec2(p.y,-p.x);
}

// 3D noise function (IQ)
float noise(vec3 p)
{
	vec3 ip=floor(p);
    p-=ip; 
    vec3 s=vec3(7,2,0.1); //DENSITY
    vec4 h=vec4(0.,s.yz,s.y+s.z)+dot(ip,s);
  //  vec4 h=vec4(0.,s.yz,s.y+s.z); //Nice effect
   // p=p*p*(3.0-2.*p); 
   // p=p*p*(3.09-2.*p); 
   //
    
    h=fract((h)*2000000.5);
    //h=mix(fract((h)*1.5),fract((h+s.x)*1.5),p.x); //Cool effect
    
    h.xy=mix(h.xz,h.yw,p.y);
    return mix(h.x,h.y,p.z); 
}

float map(vec3 p)
{	
	//z-=2.0;
    p*=0.9;
    pR(p.yz,bounce*0.1+0.4*p.x);
    return sdBox(p+vec3(0,sin(1.6*time),0),vec3(20.0, 0.05, 1.2))-.4;
}

//	normal calculation
vec3 calcNormal(vec3 pos)
{
    float eps=0.0001;
	float d=map(pos);
	return normalize(vec3(map(pos+vec3(eps,0,0))-d,map(pos+vec3(0,eps,0))-d,map(pos+vec3(0,0,eps))-d));
}


// 	standard sphere tracing inside and outside
float castRayx(vec3 ro,vec3 rd) 
{
    float function_sign=(map(ro)<0.)?-1.:1.;
    float precis=.01;
    float h=precis*1.;
    float t=0.;
	for(int i=0;i<13;i++) 
	{
       // if(abs(h)<precis||t>12.)break;
		h=function_sign*map(ro+rd*t);
        t+=h;
	}
    return t;
}

// 	refraction
float refr(vec3 pos,vec3 lig,vec3 dir,vec3 nor,float angle,out float t2, out vec3 nor2)
{
    float h=0.;
    t2=2.;
	vec3 dir2=refract(dir,nor,angle);  
 	for(int i=0;i<1;i++) 
	{
		if(abs(h)>3.) break;
		h=map(pos+dir2*t2);
		t2-=h;
	}
    nor2=calcNormal(pos+dir2*t2);
    return(.5*clamp(dot(-lig,nor2),0.,1.)+pow(max(dot(reflect(dir2,nor2),lig),0.),8.));
}

//	softshadow 
float softshadow(vec3 ro,vec3 rd) 
{
    float sh=1.;
    float t=.02;
    float h=.0;
    for(int i=0;i<1;i++)  
  //  for(int i=0;i<10;i++)  
	{
      //  if(t>20.)continue;
        h=map(ro+rd*t);
        sh=min(sh,4.*h/t)*0.90;
		//sh=min(sh,4.*h/t*0.9)*0.9;
        t+=h;
    }
    return sh;
}

//	main function
void mainImage(out vec4 fragColor,in vec2 fragCoord)
{    
   //bounce=abs(fract(0.05*time)-.5)*20.; // triangle function
   // bounce=abs((0.004*time)+ time*0.6)*2.5; // triangle function - disable reverse
  bounce=time * 20.0+ time*0.3;
    
	vec2 uv=gl_FragCoord.xy/res.xy; 
    vec2 p=uv*2.-1.;
    
// 	bouncy cam every 10 seconds
    float wobble=(fract(.1*(1.0-1.))>=0.9)?fract(10.0)*0.1*sin(300.):0.; //Disable bounce
   // float wobble=(fract(.1*(time-1.))>=0.9)?fract(-time)*0.1*sin(30.*time):0.;

//  camera    
    vec3 dir = normalize(vec3(2.*gl_FragCoord.xy -res.xy, res.y));
    vec3 org = vec3(0,2.*0.2,-3.);  
    

// 	standard sphere tracing:
    vec3 color = vec3(0.);
    vec3 color2 =vec3(0.);
    float t=castRayx(org,dir);
	vec3 pos=org+dir*t;
	vec3 nor=calcNormal(pos);

// 	lighting:
    vec3 lig=normalize(vec3(.2,6.,.5));
//	scene depth    
    float depth=clamp((1.-0.09*t),0.,1.);

    vec3 nor2 = vec3(0.);
     // color2 = vec3(max(dot(lig,nor),0.)  +  (max(dot(reflect(dir,nor),lig),0.)));//
    color2 = vec3(max(dot(lig,nor),0.)  +  pow(max(dot(reflect(dir,nor),lig),0.),100.));
    //color2 *=clamp(softshadow(pos,lig),0.,1.);  // shadow            	
    //color2 *=clamp((pos,lig),0.,1.);  // shadow    
     color2 *=(2.,0.,(lig,pos));  // shadow      
    float t2;
    color2.rgb +=refr(pos,lig,dir,nor,0.02, t2, nor2)*depth;//refract
   // color2-=clamp(.1*t2,0.,1.);				// inner intensity loss




	
    color2*=depth;
    //color2+= (1.-depth);	// subtle mist white background

    
//	scene depth included in alpha channel
    fragColor = vec4(  vec3( 0.8 *  color2 ),   0.1) ;
	
    fragColor = uboVal[0];
 //   fragColor = vec4( 1.0,1.0,1.0, 0.1) ;
}
				
</glsl>

	oFragement.fAddMain();
}
		
		
	public function fInsert_Body_Fragment():Void{ ///overrided
	}
		

	}
}