

package  { 

	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Uniform;

	
	public overclass Ubo extends Uniform  {
		
		//public var aData : CArray<Float32, 1, 50>;
		//public var aData : DArray<Float32, 1, 50>;

	//public var aData : DArray<Float, 1, 50>;
				
		public var nCurrentAttributeSetOffset : Int;
		public var nTotalPerAttrib : Int;
		
		public var nTotalAttribute : Int;
		
		
		
		public var aData : Array<Float32>;
				
		public enum eVecType : UInt {
			Vec1;
			Vec2;
			Vec3;
			Vec4;
			IVec1;
			IVec2;
			IVec3;
			IVec4;
		}
		
		public var hVecType : eVecType = eVecType.Vec4;
		
		
		public var nIdBuff : Val;
	//	public wvar oProgram : ProgramShader;
		
	//	public var nTotalData : UInt = 10;
		
		public function Ubo(_oProgram : ProgramShader, _sName : String):Void {
		
		//	oProgram = _oProgram;
			//Debug.fTrace("--- Vbo Created!! ---");
		//	oProgram.aVbo.fPush(this);
			
		//	fLoad();
		}
		
		override public function fLoad():Void {
		}
		
		public function fSetIndex(_nIndex:UInt):Void { //Overrided
		}

			

		
		public function fIniData(_nTotalElement:Int, _nSize:Int, _nTotalAttribute:Int):Void {
			nTotalAttribute = _nTotalAttribute; //TODO automaitc
			nCurrentAttributeSetOffset = 0;
			nTotalPerAttrib = _nTotalElement * _nSize;
			aData.fSetSize(nTotalPerAttrib * nTotalAttribute  );
		}
		

				/*
		public function fSetDefaultDataVertexID():Void {
			aData[0] = 0.0; //gl_VertexID_0
			aData[1] = 0.0;
			aData[2] = 0.0;
			aData[3] = 1.0;
			
			aData[4] = 1.0;//gl_VertexID_1
			aData[5] = 0.0;
			aData[6] = 0.0;
			aData[7] = 1.0;
			
			aData[8] = 2.0;//gl_VertexID_2
			aData[9] = 0.4;
			aData[10] = 0.6;
			aData[11] = 0.2;
			
			aData[12] = 3.0;//gl_VertexID_3
			aData[13] = 0.4;
			aData[14] = 0.6;
			aData[15] = 0.2;
		}
		*/
		
		
	//	public function fGpuDataType():Int;

		
		public function fSendData():Void {
			Debug.fTrace("---fSendData not implemented ---");
		}

	}
}