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
		public function GzShModel_Shadertoy():Void {
			Debug.fTrace("--- GzShModel_Shadertoy Created!! ---");
		}
		
		public function fLoad():Bool {
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

					//gl_Position.xy = atObjPos.xy; //Temp
					//vColor = atObjPos;
					//vColor = vec4(atObjPos.y, 0.0,1.0,1.0 );
					// vColor = vec4(1.0,0.0,0.0,1.0);
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
			
			//	uniform vec2 vTexDim;
			//	uniform vec2 vWinDim;
			//	uniform vec2 iMouse;
				///uniform vec2 iTime;
				//uniform vec2 iResolution;
				
				
				
			//	xflat in vec4 vColor;
			//	xflat in vec2 ioTexture;

			//	vec3 cam_pos = vec3(0,0,0);
			//	float PI=3.14159265;
				
///////////////////////// OBJ /////////////////	 		 
				 
const int MAX_MARCHING_STEPS = 255;
const float MIN_DIST = 0.0;
const float MAX_DIST = 100.0;
const float EPSILON = 0.0001;
float sphere( vec3 p, float s )
{
    return length(p)-s;
}
float capsule( vec3 p, vec3 a, vec3 b, float r )
{
    vec3 pa = p - a, ba = b - a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h ) - r;
}
            
float ellipsoid( in vec3 p, in vec3 r )
{
    float k0 = length(p/r);
    float k1 = length(p/(r*r));
    return k0*(k0-1.0)/k1;
}
            
float octahedron( in vec3 p, in float s)
{
    p = abs(p);
    float m = p.x+p.y+p.z-s;
    vec3 q;
            if( 3.0*p.x < m ) q = p.xyz;
    else if( 3.0*p.y < m ) q = p.yzx;
    else if( 3.0*p.z < m ) q = p.zxy;
    else return m*0.57735027;
    
    float k = clamp(0.5*(q.z-q.y+s),0.0,s); 
    return length(vec3(q.x,q.y-s+k,q.z-k)); 
}
            
float obj724c629e1cddc8c1d48232c38ae28ce9;
float sceneSDF(vec3 p) {
obj724c629e1cddc8c1d48232c38ae28ce9 = sphere(p,1.000); 
    return obj724c629e1cddc8c1d48232c38ae28ce9;
}
float shortestDistanceToSurface(vec3 eye, vec3 marchingDirection, float start, float end) {
    float depth = start;
    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        float dist = sceneSDF(eye + depth * marchingDirection);
        if (dist < EPSILON) {
            return depth;
        }
        depth += dist;
        if (depth >= end) {
            return end;
        }
    }
    return end;
}
/**
 * Return the normalized direction to march in from the eye point for a single pixel.
 * 
 * fieldOfView: vertical field of view in degrees
 * size: resolution of the output image
 * fragCoord: the x,y coordinate of the pixel in the output image
 */
vec3 rayDirection(float fieldOfView, vec2 size, vec2 fragCoord) {
    vec2 xy = fragCoord - size / 2.0;
    float z = size.y / tan(radians(fieldOfView) / 2.0);
    return normalize(vec3(xy, -z));
}
        
/**
 * Using the gradient of the SDF, estimate the normal on the surface at point p.
 */
vec3 estimateNormal(vec3 p) {
    return normalize(vec3(
        sceneSDF(vec3(p.x + EPSILON, p.y, p.z)) - sceneSDF(vec3(p.x - EPSILON, p.y, p.z)),
        sceneSDF(vec3(p.x, p.y + EPSILON, p.z)) - sceneSDF(vec3(p.x, p.y - EPSILON, p.z)),
        sceneSDF(vec3(p.x, p.y, p.z  + EPSILON)) - sceneSDF(vec3(p.x, p.y, p.z - EPSILON))
    ));
}
/**
 * Lighting contribution of a single point light source via Phong illumination.
 * 
 * The vec3 returned is the RGB color of the light's contribution.
 *
 * k_a: Ambient color
 * k_d: Diffuse color
 * k_s: Specular color
 * alpha: Shininess coefficient
 * p: position of point being lit
 * eye: the position of the camera
 * lightPos: the position of the light
 * lightIntensity: color/intensity of the light
 *
 * See https://en.wikipedia.org/wiki/Phong_reflection_model#Description
 */
vec3 phongContribForLight(vec3 k_d, vec3 k_s, float alpha, vec3 p, vec3 eye,
                            vec3 lightPos, vec3 lightIntensity) {
    vec3 N = estimateNormal(p);
    vec3 L = normalize(lightPos - p);
    vec3 V = normalize(eye - p);
    vec3 R = normalize(reflect(-L, N));
    
    float dotLN = dot(L, N);
    float dotRV = dot(R, V);
    
    if (dotLN < 0.0) {
        // Light not visible from this point on the surface
        return vec3(0.0, 0.0, 0.0);
    } 
    
    if (dotRV < 0.0) {
        // Light reflection in opposite direction as viewer, apply only diffuse
        // component
        return lightIntensity * (k_d * dotLN);
    }
    return lightIntensity * (k_d * dotLN + k_s * pow(dotRV, alpha));
}        
        
/**
 * Lighting via Phong illumination.
 * 
 * The vec3 returned is the RGB color of that point after lighting is applied.
 * k_a: Ambient color
 * k_d: Diffuse color
 * k_s: Specular color
 * alpha: Shininess coefficient
 * p: position of point being lit
 * eye: the position of the camera
 *
 * See https://en.wikipedia.org/wiki/Phong_reflection_model#Description
 */
vec3 phongIllumination(vec3 k_a, vec3 k_d, vec3 k_s, float alpha, vec3 p, vec3 eye) {
    const vec3 ambientLight = 0.5 * vec3(1.0, 1.0, 1.0);
    vec3 color = ambientLight * k_a;
    
    vec3 light1Pos = vec3(4.0 * sin(iTime),
                            2.0,
                            4.0 * cos(iTime));
    vec3 light1Intensity = vec3(0.4, 0.4, 0.4);
    
    color += phongContribForLight(k_d, k_s, alpha, p, eye,
                                    light1Pos,
                                    light1Intensity);
    
    vec3 light2Pos = vec3(2.0 * sin(0.37 * iTime),
                            2.0 * cos(0.37 * iTime),
                            2.0);
    vec3 light2Intensity = vec3(0.4, 0.4, 0.4);
    
    color += phongContribForLight(k_d, k_s, alpha, p, eye,
                                    light2Pos,
                                    light2Intensity);    
    return color;
}
        
/**
 * Return a transform matrix that will transform a ray from view space
 * to world coordinates, given the eye point, the camera target, and an up vector.
 *
 * This assumes that the center of the camera is aligned with the negative z axis in
 * view space when calculating the ray marching direction. See rayDirection.
 */
mat4 viewMatrix(vec3 eye, vec3 center, vec3 up) {
    // Based on gluLookAt man page
    vec3 f = normalize(center - eye);
    vec3 s = normalize(cross(f, up));
    vec3 u = cross(s, f);
    return mat4(
        vec4(s, 0.0),
        vec4(u, 0.0),
        vec4(-f, 0.0),
        vec4(0.0, 0.0, 0.0, 1)
    );
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec3 viewDir = rayDirection(45.0, iResolution.xy, fragCoord);
    vec3 eye = vec3(vPosition.x, vPosition.y, 10.0);
    
    mat4 viewToWorld = viewMatrix(eye, vec3(0.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0));
    
    vec3 worldDir = (viewToWorld * vec4(viewDir, 0.0)).xyz;
    
    float dist = shortestDistanceToSurface(eye, worldDir, MIN_DIST, MAX_DIST);
    
    if (dist > MAX_DIST - EPSILON) {
        // Didn't hit anything
        fragColor = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    
    // The closest point on the surface to the eyepoint along the view ray
    vec3 p = eye + dist * worldDir;
    
    vec3 K_a = vec3(0.2, 0.2, 0.2);
    vec3 K_d = vec3(0.7, 0.2, 0.2);
    vec3 K_s = vec3(1.0, 1.0, 1.0);
    float shininess = 10.0;
    
    vec3 color = phongIllumination(K_a, K_d, K_s, shininess, p, eye);
    
    fragColor = vec4(color, 1.0);
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
			
			var _oPersv : Perspective = new Perspective();
			
			
	
			
			
			//	oGpuBatch.fDraw();
		
			///var _oPod : TestPod = new TestPod(5, 5);
			///var _oPod2 : TestPod2 = new TestPod2(1, 2.5, 3, 4);
			///	fPod(_oPod2);
		}
		
			/*
		public function fPod(_oPod : TestPod2):Void {
			Debug.fTrace("PodsX:" + _oPod.nW);
		}*/
		
		
		
		public function fUpdate():Void {
		
			
			<cpp>
				static gzFloat _nTime = 0;
				_nTime+=0.01666; //60fps
				oUiTime->nVal = _nTime;
			</cpp>
		
			oUiTime.fSend();
		
		
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
				
		//		Debug.fTrace("oUiMouse.vVal.nX" + oUiMouse.vVal.nX);
			oVboBatch.fSetDefaultDataVertexID();
			oVboBatch.fSendData();
			oGpuBatch.fDraw();
		}
		
		
	}
}