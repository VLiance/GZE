package  { 

	import GzOpenGL.OpGpuInfo;
	//import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gpu.GpuObj.GpuFace;
	//import GZ.Gfx.Object;
	//import GZ.Gfx.Buffer;
	import GZ.Gfx.Buffer;
	//import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gfx.Face;
	import GZ.Gfx.Shape;
	import GZ.Base.Vec4;
	
	
	public class OpGpuFace overplace GpuFace {
	
	public var oAt : Attribute_Quad;
	
	
	
	public function OpGpuFace( _oFace :Face):Void{

	}
		
	//	public function fIni(_oFace:Face):Void;

	override public function fDraw( _oSource : Buffer, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
	//	Debug.fTrace("GPU draw face! " );
		//fCreateDara();
		
		oAt = Attribute_Quad;
		<cpp>
		if(oAt == 0){ //TODO correction in C~ if(oAt == null){
			return;
		}
		</cpp>
		/*
		if(oAt == null){
		//if(oAt == 0){
			return;
		}*/
		//Attribute_Quad.oAtObjPos.fSet(oFace.oShape.vPos);
		/*
		<cpp>
			gzArrayView<gzFloat> _aTest = oFace->oShape->vPos.get(); //TODO arrayview
		</cpp>
		*/
		//Debug.fTrace("GPU draw face! " + oFace.oShape.vPos.nX + ", "  + oFace.oShape.vPos.nY );
					
		/*		
		oAt.oAtObjPos.fSetVal(0,oFace.oShape.oGblPt.vPt.nX);
		oAt.oAtObjPos.fSetVal(1,oFace.oShape.oGblPt.vPt.nY); 
		oAt.oAtObjPos.fSetVal(2,oFace.oShape.oGblPt.vPt.nZ); 
		*/
		
	//	Debug.fTrace("aBefDataLinkedSize! " + Attribute_Quad.oAtObjPos.aDataLinked.nSize  );
		oAt.oAtObjPos.fSet(oFace.oShape.oGblPt.vPt);

		//oAtObjSize
		oAt.oAtObjRot.fSet(oFace.oShape.vGblRot);
		
		oAt.oAtPt1.fSet(oFace.oPt1.vPt);
		oAt.oAtPt2.fSet(oFace.oPt2.vPt);
		oAt.oAtPt3.fSet(oFace.oPt3.vPt);
		oAt.oAtPt4.fSet(oFace.oPt4.vPt);
		
		//var _aSrc : Array<Float> = new  Array<Float>(oFace.rPtS1);
		
		oAt.oAtTexSource0.fSetVal(0, oFace.rPtS1.nX);
		oAt.oAtTexSource0.fSetVal(1, oFace.rPtS1.nY);
		oAt.oAtTexSource0.fSetVal(0, oFace.rPtS2.nX);
		oAt.oAtTexSource0.fSetVal(1, oFace.rPtS2.nY);
		
		oAt.oAtTexSource1.fSetVal(0, oFace.rPtS3.nX);
		oAt.oAtTexSource1.fSetVal(1, oFace.rPtS3.nY);
		oAt.oAtTexSource1.fSetVal(0, oFace.rPtS4.nX);
		oAt.oAtTexSource1.fSetVal(1, oFace.rPtS4.nY);
		
		var _vColor : Vec4<Float> = new Vec4<Float>(0.5,0.5,0.5,0.5);
		oAt.oAtColor1.fSet(_vColor);
		oAt.oAtColor2.fSet(_vColor);
		oAt.oAtColor3.fSet(_vColor);
		oAt.oAtColor4.fSet(_vColor);
		
		
		
		//oAt.oAtTexSource1.fSet(oFace.rPtS3);
		
		
		
		
		
		
		/*
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
		*/
		
		
		
		
	//	Debug.fTrace("aDataLinked! " + Attribute_Quad.oAtObjPos.aDataLinked[0]  );
	//	Debug.fTrace("aDataLinkedSize! " + Attribute_Quad.oAtObjPos.aDataLinked.nSize  );
				
		
		//;
		
		/*
		_aFaces[oGzSh->nStObjPos+_nIdx+0] = oShape->oGblPt->nX;
		_aFaces[oGzSh->nStObjPos+_nIdx+1] = oShape->oGblPt->nY;
		_aFaces[oGzSh->nStObjPos+_nIdx+2] = oShape->oGblPt->nZ;
		*/
	//	Context.oGpu.oGzSh
		
		
		
		
		
		
	}

	//	public function fSetImg(_oRc : RcImg):Void;
		
	}
}