package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.GpuObj.GpuBatch;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	
	//import GZ.Base.TestPod;
	//import GZ.Base.TestPod2;
	
	
	public overclass GzShModel_Raymarching extends GzShModel {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUvMouse : UnVec2;
		*/
		public function GzShModel_Raymarching():Void {
			Debug.fTrace("--- GzShModel_Raymarching Created!! ---");
		}
		
		public function fLoad():Bool {
			oVertex = new VertexShader();
			oFragement = new FragmentShader();
			oProgram = new ProgramShader();
			
	
			<glsl(oVertex)>
				
				in vec4 atObjPos;
				xflat out vec4 vColor;
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
					vColor = atObjPos;
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
				uniform vec2 vTexDim;
				uniform vec2 vWinDim;
				uniform vec2 vMouse;
				
				xflat in vec4 vColor;
				xflat in vec2 ioTexture;

				vec3 cam_pos = vec3(0,0,0);
				float PI=3.14159265;
				
				 ///////////////////////// OBJ /////////////////
				 
				 //Sol
				vec2 obj_floor( vec3 p){
					return vec2(p.y+10.0,0);
				}
				
				 //Sphere
				vec2 obj_sphere( vec3 p){
					float d = length(p)-1.9;
					 return vec2(d,1);
				}	 
				
				 //Tore
				 vec2 obj_torus( vec3 p){
					 vec2 r = vec2(1.4,1.2);
					 vec2 q = vec2(length(p.xz)-r.x,p.y);
					 float d = length(q)-r.y;
					 return vec2(d,1);
				}	
				
								
				//Box
				vec2 obj_round_box(vec3 p){
					float d = length(max(abs(p)-vec3(0.3,0.15,1.0),0.0))-0.2;
					return vec2(d,1);
				}
				/*
				vec2 obj_round_box(vec3 p){
					  float d= length(max(abs(p)-vec3(1.0,0.5,2.0),0.0))-0.08;
				//  float d = length(max(abs(p)-vec3(2.0,0.5,2.0),0.0))-0.2;
				  return vec2(d,1);
				}*/

								
				 ///////////////////////////////////////////////////////

				/// Operator ////////	
				vec2 op_union(vec2 a, vec2 b){
				  float d = min(a.x, b.x);
				  return vec2(d,1);
				}
				
				vec2 op_rep(vec3 p, vec3 c){
				  vec3 q = mod(p,c)-0.5*c;
				  return obj_round_box(q);
				}
				
				vec2 op_sub(vec2 a, vec2 b)	{
				  float d = max(a.x, -b.x);
				  return vec2(d,1);
				}
				
				vec2 op_blend(vec3 p, vec2 a, vec2 b){
				 float s = smoothstep(length(p), 0.0, 1.0);
				 float d = mix(a.x, b.x, s);
				 return vec2(d,1);
				}

				///////////   Union  ////////////////////
				vec2 obj_union( vec2 obj0,  vec2 obj1){ 
					if (obj0.x < obj1.x){
						return obj0;
					}else{
						return obj1;
					}
				}
				
				// Union d'objets
				vec2 distance_to_obj( vec3 p){
					 //return obj_floor(p);
					 //return obj_union(obj_floor(p), obj_round_box(p));
					 //return obj_union(obj_floor(p), op_union(obj_round_box(p), obj_sphere(p)));  
				  	 //return obj_union(obj_floor(p), op_sub(obj_round_box(p), obj_sphere(p)));
					 //return obj_union(obj_floor(p), op_blend(p, obj_round_box(p), obj_torus(p))   )  ;
				  	 //return obj_union(obj_floor(p), op_blend(p, obj_round_box(p), obj_torus(p))   )  ;
					  return obj_union(obj_floor(p), op_rep(p , vec3(3.0, 2.0, 6.0)));
				}
			

				 //// Couleur du sol (damier)
				 vec3 floor_color( vec3 p){
					 
					 vec3 c = vec3(8.0, 5.0, 9.0);
					 
					 vec3 q = mod(p,c) - 0.5 * c;
					  return  q ;
					   
					//return  vec3( smoothstep(length(p), fract(p.x*0.2), fract(p.y*0.2)),1,1);
					 /*
					 if (fract(p.x*0.2)>0.2){
						 if (fract(p.z*0.2)>0.2){
							 return vec3(0,0.1,0.2);
						}else{
							return vec3(1,1,1);
						}
					}else{
						if (fract(p.z*.2)>.2){
							return vec3(1,1,1);
						}else{
							return vec3(0.3,0,0);
						}
					}*/
				 }
				 
				 //// Couleur de la primitive
				 vec3 prim_c( vec3 p){
					 return vec3(0.9137,0.83,0.70);
				 }
				 
				 void main(){
					 
					  vec2 q = ( gl_FragCoord.xy / vec2(800.0,800.0) );
					  
					 
					 //FragColor = vec4(0,q.y,0,1.0);
					 //return;
					 
					 
					 float _nMoveX = 2.5 * vMouse.x * vMouse.y;
					// float _nMoveY = 2.5 * vMouse.y;
					 
					 
					
					 //vec2 q = vec2(1.0, 0.5);
					 vec2 vPos = -1.0 + 2.0 * q;
					 
				 	// Inclinaison de la caméra.
					vec3 vuv = vec3(0,1.5,0.0);
					
					// Direction de la caméra.
					vec3 vrp = vec3(0.5,0.5,1.0);
					//vec3 vrp = vec3(0.0, _nMove,  0.0) * 6.0;
					
					
					// Position de la caméra.
					//vec2 mouse = vec2(0.5, 0.5);
					float mx = vMouse.x* PI * 2.0;
					float my = vMouse.y* PI / 2.01;
					vec3 prp = vec3(  cos(my)*cos(mx),  sin(my),   cos(my)*sin(mx)  ) * 6.0;
					
					//vec3 prp = vec3(  _nMoveX * 1.5 - 0.2 , _nMoveX - 0.3- 1.0,   -0.6 ) * 6.0 ;
					
					//vec3 prp = cam_pos;
					
					vec3 vpn = normalize(vrp-prp);
					vec3 u = normalize(cross(vuv , vpn));
					vec3 v = cross(vpn , u);
					vec3 vcv = (prp + vpn);
					
					//vec3 scrCoord=vcv+vPos.x*u*resolution.x/resolution.y+vPos.y*v;
					
					vec3 scrCoord = vcv + vPos.x * u * 0.8 + vPos.y * v * 0.8;
					vec3 scp = normalize(scrCoord - prp);
					
					 // Raymarching.
					const vec3 e = vec3(0.02, 0, 0);
					const float maxd = 100.0;
					vec2 d = vec2(0.02,0.0);
					vec3 c,p,N;
					
					float f = 1.0;
					for(int i = 0; i< 260; i++){
						if ((abs(d.x) < .001) || (f > maxd)) {
							break;
						}
						
						f += d.x;
						p = prp + scp * f;
						d = distance_to_obj(p);
					}
					
					if (f < maxd){
						if (d.y==0.0){
							c=floor_color(p);
						}else{
							c=prim_c(p);
						}
						
						vec3 n = vec3(d.x-distance_to_obj(p-e.xyy).x, d.x-distance_to_obj(p-e.yxy).x,  d.x-distance_to_obj(p-e.yyx).x);
						N = normalize(n);
						float b=dot(N,normalize(prp-p));
						// Simple éclairage Phong, LightPosition = CameraPosition
						FragColor = vec4((b*c+pow(b,16.0))*(1.0-f*.01),1.0);
						
					}else{
						//FragColor = vec4(0.0 + vColor.x,0,0,1.0);
						//FragColor = vec4(0.0 + vMouse.x ,0.0 + vMouse.y ,0.0 ,1.0);
						FragColor = vec4(0.0 ,0.0 ,0.0 ,1.0);
						//FragColor = vec4(0 ,0,0,1.0);
					}
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
			oGpuBatch = new GpuBatch();
			
			
			var _oAtObjPos : Attribute = oProgram.fAddAttribute("atObjPos");
			var _oAtVertexID : Attribute = oProgram.fAddAttribute("atVertexID");
			
			oUvMouse = new UnVec2(oProgram, "vMouse");
			
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
		
		
		
		public function fDraw():Void {
		
			
			//nDestX = oWindow.nMouseX  + nDragX + ( oWindow.nMouseX - oWindow.nLastMouseX)/1.5;
			//nDestY = oWindow.nMouseY  + nDragY + ( oWindow.nMouseY - oWindow.nLastMouseY)/1.5;
			//	Debug.fTrace("aaaaa");
			//	if(oUvMouse.oVal.nX < 6){
			//oUvMouse.vVal.nX = Context.nMouseX/ 5.5;
			//Debug.fTrace( Context.nMouseX + ": " +Context.nMouseY  );
				
				
			oUvMouse.vVal.nX = Context.nMouseX/800 - 0.5;
			oUvMouse.vVal.nY = Context.nMouseY/600 - 0.5;
				
		//	}
			oUvMouse.fSend();
			
			oVboBatch.fSendData();
			oGpuBatch.fDraw();
		}
		
		
	}
}