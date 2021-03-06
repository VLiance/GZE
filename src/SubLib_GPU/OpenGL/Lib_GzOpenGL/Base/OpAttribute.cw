package  { 

	import GzOpenGL.OpenGL;
	import GzOpenGL.OpGpuInfo;
	import GZ.Gpu.ShaderBase.Vbo;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.ShaderBase.ProgramShader;
	
	public class OpAttribute overplace Attribute {

		
		public function OpAttribute(_sName : String, _oVbo : Vbo, _nDivisor : Int = 1):Void {
		
		}
		
		override public function fLoad():Void {
			//Debug.fTrace("--- OpAttribute Created!! ---");
			
			OpenGL.fBindBuffer(ARRAY_BUFFER, oVbo.nId);
			
			nId = OpenGL.fGetAttribLocation(oProgram.nId,  sName );
			<cpp>
			if(nId == gzVal(-1) ){
			</cpp>
				Debug.fWarning("OpenGL: Unabled to find Attribute (or optimised out): " + sName );
				return;
			<cpp>
			}
			</cpp>
			
			bValid = true; //TODO
			OpenGL.fEnableVertexAttribArray( nId ); //Important
			
			OpenGL.fVertexAttribPointer(nId, Vec4, FLOAT, false, 0, 0);  //Must be initialised
			
			
			/*
			if(nId >= 0){

				Debug.fWarning(" *** bValid ---- " );

				bValid = true;
				OpenGL.fEnableVertexAttribArray( nId ); //Important
			}else{
				//  if(glProgramIsAttribInactive(...))
				//Inactive attribute.
			 // else
				//Name mismatch.

				Debug.fWarning("Gpu: Attribute not found/used: " + sName);
			}
			*/

			/*
			 if(nId == -1){
			   Debug::fError(gzU8("Warning, Uniform not found/used : ") + _sAttrib );
				if(_bBindIfNotFound){
					_nLoc = 15;
					GL_fBindAttribLocation(nId, _nLoc, (gzUInt8*)(_sAttrib.sStr->array + 1)); // Todo set to last possible value
			   }
			 }*/
			
			
		}
		/*
		public function fVboSetOffset():Void{ //overided
			
		//	fSetOffset(oVbo.);
		}*/
		
		override public function fSetOffset(_nValOffset : UInt):Void{ 
		

			nOffset = _nValOffset;
			
			var _nSizeType : Int;
			<cpp>
			_nSizeType = sizeof(gzFloat32);
			</cpp>
	
			if(bValid == true){
				OpenGL.fBindBuffer(ARRAY_BUFFER, oVbo.nId);
				OpenGL.fVertexAttribPointer(nId, Vec4, FLOAT, false, 0, _nSizeType * _nValOffset );
				/*
				<cpp>
				//GL_fVertexAttribPointer(nId,  GL_vec4, fGpuDataType(), GL_FALSE, 0,(Void*)(sizeof(gzFloat32) * (_nValOffset)));
				</cpp>
				*/
			}
			
		}
		
		/*
		override public function fGpuDataType():Int{
			if(hDataType == eDataType.Float){

			}
			return -1;
		}*/

		override public function fSetDivisor(_nDiv:UInt = 1):Void{

			if(bValid == true){
				OpenGL.fBindBuffer(ARRAY_BUFFER, oVbo.nId);
				//OpenGL.fVertexAttribPointer(nId, Vec4, FLOAT, false, 0, 0);
			//	fSetOffset(nOffset);//TODO Not sure
				OpenGL.fVertexAttribDivisor(nId, _nDiv);
				
				/*
				<cpp>
				#ifndef D_Platform_Web_Emsc
				</cpp>
			//		OpenGL.fVertexAttribDivisor(nId, _nDiv); //Temp
				<cpp>
				#endif
				</cpp>
				*/
			}
			
			//Debug.fTrace("SetDivisor");
		}
		
		
		


	}
}