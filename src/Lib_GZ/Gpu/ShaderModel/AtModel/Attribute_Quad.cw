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

		
		public function Attribute_Quad():Void {
			Debug.fTrace("--- Attribute_Quad Created!! ---");
		}
		
		
		public function fLocateAttribute(_oProgram:ProgramShader):Void {
			oProgram = _oProgram;

			oAtObjPos = oProgram.fAddAttribute("in_ObjPos");
			//oAtObjSize = oProgram.fAddAttribute("in_ObjSize");
			oAtObjRot = oProgram.fAddAttribute("in_ObjRot");
			
			oAtPt1 = oProgram.fAddAttribute("in_Pt1");
			oAtPt2 = oProgram.fAddAttribute("in_Pt2");
			oAtPt3 = oProgram.fAddAttribute("in_Pt3");
			oAtPt4 = oProgram.fAddAttribute("in_Pt4");
			
			oAtTexSource0 = oProgram.fAddAttribute("in_TexSource0");
			oAtTexSource1 = oProgram.fAddAttribute("in_TexSource1");
			
			oAtColor1 = oProgram.fAddAttribute("in_Color1");
			oAtColor2 = oProgram.fAddAttribute("in_Color2");
			oAtColor3 = oProgram.fAddAttribute("in_Color3");
			oAtColor4 = oProgram.fAddAttribute("in_Color4");
		}
		
		public function fSetOffset(_nTotalQuad:UInt):Void {
			Debug.fTrace("Total Quad : "  + _nTotalQuad) ;
				
			nTotalQuad = _nTotalQuad;
			
			var _nTotalPerAttrib : Int = _nTotalQuad * 4; //4 = Vec4
			
			
			oAtObjPos.fSetOffset(_nTotalPerAttrib * 0);
			oAtObjRot.fSetOffset(_nTotalPerAttrib * 1);
			
			oAtPt1.fSetOffset(_nTotalPerAttrib * 2);
			oAtPt2.fSetOffset(_nTotalPerAttrib);
			oAtPt3.fSetOffset(_nTotalPerAttrib * 4);
			oAtPt4.fSetOffset(_nTotalPerAttrib * 5);
			
			oAtTexSource0.fSetOffset(_nTotalPerAttrib * 6);
			oAtTexSource1.fSetOffset(_nTotalPerAttrib);
			
			oAtColor1.fSetOffset(_nTotalPerAttrib * 8);
			oAtColor2.fSetOffset(_nTotalPerAttrib * 9);
			oAtColor3.fSetOffset(_nTotalPerAttrib * 10);
			oAtColor4.fSetOffset(_nTotalPerAttrib * 11);
		}
		

		
		
	}
}