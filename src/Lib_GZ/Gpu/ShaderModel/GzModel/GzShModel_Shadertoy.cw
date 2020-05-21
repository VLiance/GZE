package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnFloat;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Input.Key;
	import GZ.Gpu.Base.UnInt;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public overclass GzShModel_Shadertoy extends GzShModel {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUiMouse : UnVec2;
		*/
		
		public var oAt : Attribute_Quad;
		public var oVbo : Vbo;
		
		public function GzShModel_Shadertoy():Void {
			Debug.fTrace("--- GzShModel_Shadertoy Created!! ---");
		}
		
		
			
		override public function fIni_Base():Void {
			Debug.fTrace("fIni_Base !!!  ------------------");
			oVbo = new Vbo(oProgram);
			
			oAt = new Attribute_Quad(oVbo);
			Attribute_Quad = oAt; //Singleton
		}
		
		
		override function fLoad():Bool {
			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
			<glsl(oVertex)>
				
				in vec4 atObjPos;
				//xflat out vec4 vColor;
				out vec2 ioTexture;
				
				void main(){

					if (nVertexID < 2){
						if(nVertexID == 0){
							gl_Position.x = -1.0;
							gl_Position.y = -1.0;
						}else{
							gl_Position.x = 1.0;
							gl_Position.y = -1.0;
						}
					}else{
						if(nVertexID == 2){
							gl_Position.x = 1.0;
							gl_Position.y = 1.0;
						}else{
							gl_Position.x = -1.0;
							gl_Position.y = 1.0;
						}
					}
					gl_Position.z = 0.5;
					gl_Position.w = 1.0;

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
}		 
				 
				 
			</glsl>
			
			oFragement.fAddMain();
			
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
			
				
			//var _oAtObjPos : Attribute = oProgram.fAddAttribute(null, "atObjPos"); //TODO null
			//var _oAtVertexID : Attribute = oProgram.fAddAttribute(null, "atVertexID",0);  //Must advance each vertex //TODO null
			
			//var _oAtObjPos : Attribute = new Attribute("atObjPos", null); //TODO null!
			var _oAtVertexID : Attribute =  new Attribute("atVertexID", oVboBatch, 0);//TODO null!
			//oProgram.fAttachAttribute(_oAtObjPos);
		//	oProgram.fAttachAttribute(_oAtVertexID);
			
			
			oUiTime = new UnFloat(oProgram, "iTime");
			oUiMouse = new UnVec2(oProgram, "iMouse");
			oUiResolution = new UnVec2(oProgram, "iResolution");
			oUvPosition = new UnVec2(oProgram, "vPosition");
			//oUiTime = new UnVec2(oProgram, "iTime");
			oUnType = new UnInt(oProgram, "nType");
			
		//	var _oPersv : Perspective = new Perspective();
			
			//	oGpuBatch.fDraw();
		
			///var _oPod : TestPod = new TestPod(5, 5);
			///var _oPod2 : TestPod2 = new TestPod2(1, 2.5, 3, 4);
			///	fPod(_oPod2);
		}
		
	
		
		override function fUpdate():Void {
		
			
			<cpp>
				static gzFloat _nTime = 0;
				_nTime+=0.01666; //60fps
				oUiTime->nVal = _nTime;
			</cpp>
		
			oUiTime.fSend();
			
			//Debug.fTrace("oUiTime.nVal " + oUiTime.nVal);  
			
			//Key
			var _nSpeed : Float = 0.1;
			if(Key.fIsDown(Up)){
				oUvPosition.vVal.nY += _nSpeed;
			}
			if(Key.fIsDown(Down)){
				oUvPosition.vVal.nY -= _nSpeed;
			}
			if(Key.fIsDown(Left)){
				oUvPosition.vVal.nX -= _nSpeed;
				//Debug.fTrace("Left");
			}
			if(Key.fIsDown(Right)){
				oUvPosition.vVal.nX += _nSpeed;
			}
			oUvPosition.fSend();
		
			//nDestX = oWindow.nMouseX  + nDragX + ( oWindow.nMouseX - oWindow.nLastMouseX)/1.5;
			//nDestY = oWindow.nMouseY  + nDragY + ( oWindow.nMouseY - oWindow.nLastMouseY)/1.5;
			//	Debug.fTrace("aaaaa");
			//	if(oUiMouse.oVal.nX < 6){
			//oUiMouse.vVal.nX = Context.nMouseX/ 5.5;
		//	Debug.fTrace( Context.nMouseX + ": " + Context.nMouseY  );
				
				
			oUiMouse.vVal.nX = Context.nMouseX/Context.nFrameWidth - 0.5;
			oUiMouse.vVal.nY = Context.nMouseY/Context.nFrameHeight - 0.5;
			oUiMouse.fSend();
			
			oUiResolution.vVal.nX  = Context.nFrameWidth;
			oUiResolution.vVal.nY  = Context.nFrameHeight;
			oUiResolution.fSend();
				
		
	//	Debug.fTrace("oUiResolution.vVal.nX" + oUiResolution.vVal.nX);
	//	Debug.fTrace("oUiResolution.vVal.nY" + oUiResolution.vVal.nY);
				
		//		Debug.fTrace("oUiMouse.vVal.nX" + oUiMouse.vVal.nX);
			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
			oGpuBatch.fDraw();
		}
		
		
	}
}