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
	
	
	public class OpGpuFace overplace GpuFace {
	
	public var oAt : Attribute_Quad;
	
	
	
	public function OpGpuFace( _oFace :Face):Void{

	}
		
	//	public function fIni(_oFace:Face):Void;

	override public function fDraw( _oSource : Buffer, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Void{
		Debug.fTrace("GPU draw face! " );
		//fCreateDara();
		
		//oAt = Attribute_Quad;
		//Attribute_Quad.oAtObjPos.fSet(oFace.oShape.vPos);
		<cpp>
			gzArrayView<gzFloat> _aTest = oFace->oShape->vPos.get();
			
			
		</cpp>
		
		
		
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