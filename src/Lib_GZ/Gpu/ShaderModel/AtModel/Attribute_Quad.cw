package  { 

	import GZ.Gpu.ShaderBase.FragmentShader;
	import GZ.Gpu.ShaderBase.VertexShader;
	import GZ.Gpu.ShaderBase.ProgramShader;
	import GZ.Gpu.Base.Attribute;
	import GZ.Gpu.Base.Uniform;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.Base.Texture;
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
		
		public var oTexture : Texture;
		
		
		public var oAtObjPos : Attribute;
		//public var oAtObjSize : Attribute;
		public var oAtObjRot : Attribute;
		public var oAtObjSize : Attribute;
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

		
		//public var aData : Array<Float>;
		public var oVbo : Vbo;
		
		
		public function Attribute_Quad():Void {
			Debug.fTrace("--- Attribute_Quad Created!! ---");
			
		}
		
		
		public function fLocateAttribute(_oProgram:ProgramShader):Void {
			oProgram = _oProgram;
			
			oVbo = new Vbo(oProgram);

			
			oAtObjPos = new Attribute("in_ObjPos", oVbo);
			
		//	Debug.fTrace("aDataLinked: " + oAtObjPos.aDataLinked[0]);
			 
			//oAtObjSize = oProgram.fAddAttribute("in_ObjSize");
			oAtObjRot =new Attribute("in_ObjRot", oVbo);
			oAtObjSize =new Attribute("in_ObjSize", oVbo);
			
			oAtPt1 = new Attribute("in_Pt1", oVbo);
			oAtPt2 = new Attribute("in_Pt2", oVbo);
			oAtPt3 = new Attribute("in_Pt3", oVbo);
			oAtPt4 = new Attribute("in_Pt4", oVbo);
			
			oAtTexSource0 = new Attribute("in_TexSource0", oVbo);
			oAtTexSource1 =new Attribute("in_TexSource1", oVbo);
			
			oAtColor1 = new Attribute("in_Color1", oVbo);
			oAtColor2 = new Attribute("in_Color2", oVbo);
			oAtColor3 = new Attribute("in_Color3", oVbo);
			oAtColor4 = new Attribute("in_Color4", oVbo);

			
			
			oTexture = new Texture(oProgram, "TexCurrent");
			oTexture.fSend(0);
			
			var _oTexture2 : Texture = new Texture(oProgram, "TexSource");
			_oTexture2.fSend(1);
			
		/*
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
			*/
			
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
			//Debug.fTrace("-----------------------*********************************************************** " ) ;
			//Debug.fTrace("fIniData: Total Quad : "  + _nTotalQuad) ;
			//Debug.fTrace("-----------------------*********************************************************** " ) ;
			

				
			nTotalQuad = _nTotalQuad;
			
			//	Debug.fTrace("nTotalQuad: " +nTotalQuad)
			
			var _nTotalPerAttrib : Int = _nTotalQuad * 4; //4 = Vec4
			oVbo.aData.fMaxSize(_nTotalPerAttrib * 13);
			

			oAtObjPos.fSetOffset(_nTotalPerAttrib * 0);
			oAtObjRot.fSetOffset(_nTotalPerAttrib * 1);
			oAtObjSize.fSetOffset(_nTotalPerAttrib * 2);
			
			oAtPt1.fSetOffset(_nTotalPerAttrib * 3);
			oAtPt2.fSetOffset(_nTotalPerAttrib * 4);
			oAtPt3.fSetOffset(_nTotalPerAttrib * 5);
			oAtPt4.fSetOffset(_nTotalPerAttrib * 6);
			
			oAtTexSource0.fSetOffset(_nTotalPerAttrib * 7);
			oAtTexSource1.fSetOffset(_nTotalPerAttrib * 8);
			
			oAtColor1.fSetOffset(_nTotalPerAttrib * 9);
			oAtColor2.fSetOffset(_nTotalPerAttrib * 10);
			oAtColor3.fSetOffset(_nTotalPerAttrib * 11);
			oAtColor4.fSetOffset(_nTotalPerAttrib * 12);
		}
		
		public function fSetIndex(_nIndex:UInt):Void{
			 
			oAtObjPos.fSetIndex(_nIndex);
			oAtObjRot.fSetIndex(_nIndex);
			oAtObjSize.fSetIndex(_nIndex);
			
			oAtPt1.fSetIndex(_nIndex);
			oAtPt2.fSetIndex(_nIndex);
			oAtPt3.fSetIndex(_nIndex);
			oAtPt4.fSetIndex(_nIndex);
			
			oAtTexSource0.fSetIndex(_nIndex);
			oAtTexSource1.fSetIndex(_nIndex);
			
			oAtColor1.fSetIndex(_nIndex);
			oAtColor2.fSetIndex(_nIndex);
			oAtColor3.fSetIndex(_nIndex);
			oAtColor4.fSetIndex(_nIndex);
		}
		
		
		
		public function fUpdate():Void {
			oVbo.fSendData();
		
		}

		
		
	}
}