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
	
	
	public class Attribute_Quad {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUiMouse : UnVec2;
		*/
		
		public var oAtObjPos : Attribute;
		//public var oAtObjSize : Attribute;
		public var oAtObjRot : Attribute;
		public var oAtPt1 : Attribute;
		public var oAtPt2 : Attribute;
		public var oAtPt3 : Attribute;
		public var oAtPt4 : Attribute;
		public var oAtTexSource0 : Attribute;
		public var oAtTexSource1 : Attribute;
		public var oAtColor1 : Attribute;
		public var oAtColor2 : Attribute;
		public var oAtColor3 : Attribute;
		public var oAtColor4 : Attribute;
		public var oAtOffsetHV : Attribute;
		public var oAtOffsetC : Attribute;
		
		public wvar oProgram : ProgramShader
		
		
		public var nTotalQuad : UInt = 0;

		
		public var aData : Array<Float>;
		
		
		public function Attribute_Quad():Void {
			Debug.fTrace("--- Attribute_Quad Created!! ---");
			
			
			//aData[0] = 777.0;

			
			oAtObjPos = new Attribute("in_ObjPos", aData);
			
		//	Debug.fTrace("aDataLinked: " + oAtObjPos.aDataLinked[0]);
			 
			
			//oAtObjSize = oProgram.fAddAttribute("in_ObjSize");
			oAtObjRot =new Attribute("in_ObjRot", aData);
			
			oAtPt1 = new Attribute("in_Pt1", aData);
			oAtPt2 = new Attribute("in_Pt2", aData);
			oAtPt3 = new Attribute("in_Pt3", aData);
			oAtPt4 = new Attribute("in_Pt4", aData);
			
			oAtTexSource0 = new Attribute("in_TexSource0", aData);
			oAtTexSource1 =new Attribute("in_TexSource1", aData);
			
			oAtColor1 = new Attribute("in_Color1", aData);
			oAtColor2 = new Attribute("in_Color2", aData);
			oAtColor3 = new Attribute("in_Color3", aData);
			oAtColor4 = new Attribute("in_Color4", aData);
		}
		
		
		public function fLocateAttribute(_oProgram:ProgramShader):Void {
			oProgram = _oProgram;

			oProgram.fAttachAttribute(oAtObjPos);
			//oAtObjSize = oProgram.fAttachAttribute("in_ObjSize");
			oProgram.fAttachAttribute(oAtObjRot);
			
			oProgram.fAttachAttribute(oAtPt1);
			oProgram.fAttachAttribute(oAtPt2);
			oProgram.fAttachAttribute(oAtPt3);
			oProgram.fAttachAttribute(oAtPt4);
			
			oProgram.fAttachAttribute(oAtTexSource0);
			oProgram.fAttachAttribute(oAtTexSource1);
			
			oProgram.fAttachAttribute(oAtColor1);
			oProgram.fAttachAttribute(oAtColor2);
			oProgram.fAttachAttribute(oAtColor3);
			oProgram.fAttachAttribute(oAtColor4);
			
			
			/*
			oAtObjPos = oProgram.fAddAttribute(aData, "in_ObjPos");
			//oAtObjSize = oProgram.fAddAttribute("in_ObjSize");
			oAtObjRot = oProgram.fAddAttribute(aData, "in_ObjRot");
			
			oAtPt1 = oProgram.fAddAttribute(aData, "in_Pt1");
			oAtPt2 = oProgram.fAddAttribute(aData, "in_Pt2");
			oAtPt3 = oProgram.fAddAttribute(aData, "in_Pt3");
			oAtPt4 = oProgram.fAddAttribute(aData, "in_Pt4");
			
			oAtTexSource0 = oProgram.fAddAttribute(aData, "in_TexSource0");
			oAtTexSource1 = oProgram.fAddAttribute(aData, "in_TexSource1");
			
			oAtColor1 = oProgram.fAddAttribute(aData, "in_Color1");
			oAtColor2 = oProgram.fAddAttribute(aData, "in_Color2");
			oAtColor3 = oProgram.fAddAttribute(aData, "in_Color3");
			oAtColor4 = oProgram.fAddAttribute(aData, "in_Color4");
			*/
			
		}
		
		public function fIniData(_nTotalQuad:UInt):Void {
			//Debug.fTrace("Total Quad : "  + _nTotalQuad) ;
			

				
			nTotalQuad = _nTotalQuad;
			
				Debug.fTrace("nTotalQuad: " +nTotalQuad)
			
			var _nTotalPerAttrib : Int = _nTotalQuad * 4; //4 = Vec4
			aData.fMaxSize(_nTotalPerAttrib * 12);
			
			Debug.fTrace("fMaxSize: " + _nTotalPerAttrib * 12)
			//aData[0] = 9999;
			
			
			oAtObjPos.fSetOffset(_nTotalPerAttrib * 0);
			oAtObjRot.fSetOffset(_nTotalPerAttrib * 1);
			
			oAtPt1.fSetOffset(_nTotalPerAttrib * 2);
			oAtPt2.fSetOffset(_nTotalPerAttrib * 3);
			oAtPt3.fSetOffset(_nTotalPerAttrib * 4);
			oAtPt4.fSetOffset(_nTotalPerAttrib * 5);
			
			oAtTexSource0.fSetOffset(_nTotalPerAttrib * 6);
			oAtTexSource1.fSetOffset(_nTotalPerAttrib * 7);
			
			oAtColor1.fSetOffset(_nTotalPerAttrib * 8);
			oAtColor2.fSetOffset(_nTotalPerAttrib * 9);
			oAtColor3.fSetOffset(_nTotalPerAttrib * 10);
			oAtColor4.fSetOffset(_nTotalPerAttrib * 11);
			
			
		}
		

		
		
	}
}