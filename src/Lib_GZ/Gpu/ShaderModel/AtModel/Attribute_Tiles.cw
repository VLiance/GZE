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
	
	
	public class Attribute_Tiles {
		/*
		public var oVertex : VertexShader;
		public var oFragement : FragmentShader;
		public var oProgram : ProgramShader;
		public var oGpuBatch : GpuBatch;
		public var oVboBatch : Vbo;
		public var oUiMouse : UnVec2;
		*/
		
		public var oTexture : Texture;
		
		/*
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
		*/
		
		public var nTotalAt : Int = 2;
		public var oAtTilesHV : Attribute;
		public var oAtTilesC : Attribute;
		
		
		
		public wvar oProgram : ProgramShader

		public var nTotalQuad : UInt = 0;

		
		//public var aData : Array<Float>;
		public wvar oVbo : Vbo;
		
		
		public function Attribute_Tiles(_oVbo : Vbo):Void {
			oVbo = _oVbo;
			Debug.fTrace("--- Attribute_Tiles Created!! ---");
			
		}
		
		
		public function fLocateAttribute(_oProgram:ProgramShader):Void {
			oProgram = _oProgram;
			
			//oVbo = new Vbo(oProgram);
			
			
			oAtTilesHV = new Attribute("in_TilesHV", oVbo);
			oAtTilesC = new Attribute("in_TilesC", oVbo);
			//oAtTilesHV = oProgram.fAddAttribute("in_TilesHV");
			//oAtTilesC = oProgram.fAddAttribute("in_TilesC");
			
		}
		
		public function fIniData(_nTotalQuad:UInt, _nCurrentAttribte:Int ):Void {
			
	/*
			nTotalQuad = _nTotalQuad;
			
			var _nTotalPerAttrib : Int = _nTotalQuad * 4; //4 = Vec4

			//oVbo.aData.fMaxSize(_nTotalPerAttrib * _nNbOfAttribtes);
			
			
			oAtTilesHV.fSetOffset(_nTotalPerAttrib * 0);
			oAtTilesC.fSetOffset(_nTotalPerAttrib * 1);
			
			
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
			oAtColor4.fSetOffset(_nTotalPerAttrib * 12);*/
		}
		
		public function fSetIndex(_nIndex:UInt):Void{
			 
			 /*
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
			*/
		}
		
		
		
		public function fUpdate():Void {
			oVbo.fSendData();
		
		}

		
		
	}
}