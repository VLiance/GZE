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
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Tiles;
	import GZ.Gfx.Face;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Root;
	import GZ.Base.Vec4;
	
	import GZ.Gfx.Tile.Tile;
	
	
	public class OpGpuFace overplace GpuFace {
	
	public var oAt : Attribute_Quad;
	public var oAtTiles : Attribute_Tiles;
	
	

	
	
	
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
		
		oAt.fSetIndex(GpuFace.nCurrent);
		GpuFace.nCurrent++;
				

	//	Debug.fTrace("aBefDataLinkedSize! " + Attribute_Quad.oAtObjPos.aDataLinked.nSize  );
		oAt.oAtObjPos.fSet(oFace.oShape.oParent.oGblPt.vPt);
		oAt.oAtObjSize.fSet(oFace.oShape.oParent.vGblSize);
		
		//Set Texture location
		if(oFace.oShape.oRc.oLinkRc.oGpuTexLayer != null){
			oAt.oAtObjSize.fSetVal(3, oFace.oShape.oRc.oLinkRc.oGpuTexLayer.nSlot);  //Use 4e value ObjSize var to save space
		}

		//oAtObjSize
		oAt.oAtObjRot.fSet(oFace.oShape.oParent.vQuaternion);
		

		
		oAt.oAtPt1.fSet(oFace.oPt1.vTf);
		oAt.oAtPt2.fSet(oFace.oPt2.vTf);
		oAt.oAtPt3.fSet(oFace.oPt3.vTf);
		oAt.oAtPt4.fSet(oFace.oPt4.vTf);
		
		//var _aSrc : Array<Float> = new  Array<Float>(oFace.rPtS1);
		
		oAt.oAtTexSource0.fSetVal(0, oFace.rPtS1.nX);
		oAt.oAtTexSource0.fSetVal(1, oFace.rPtS1.nY);
		oAt.oAtTexSource0.fSetVal(2, oFace.rPtS2.nX);
		oAt.oAtTexSource0.fSetVal(3, oFace.rPtS2.nY);
		
		oAt.oAtTexSource1.fSetVal(0, oFace.rPtS3.nX);
		oAt.oAtTexSource1.fSetVal(1, oFace.rPtS3.nY);
		oAt.oAtTexSource1.fSetVal(2, oFace.rPtS4.nX);
		oAt.oAtTexSource1.fSetVal(3, oFace.rPtS4.nY);

		
		
		oAt.oAtColor1.fSet(oFace.oShape.vGblColor);
	//	oAt.oAtColor2.fSet(oFace.oShape.vGblColor); //Not used
	//	oAt.oAtColor3.fSet(oFace.oShape.vGblColor); //Not used
		
	//	var _vColor4 : Vec4<Float> = new Vec4<Float>(0.0,1.0,0.5,1.0);
	//	oAt.oAtColor4.fSet(_vColor4); //Not used
	//	oAt.oAtColor4.fSet(oFace.oShape.vGblColor); //Not used

		

		
	
		
		//if(oAtTiles.oAtTilesHV == 0){return;}
	
		var _nType : UInt = 4;

		
		if (oFace.oShape.hType == Root.eType.Line){
			_nType = 8; //8 is Line
		}
		

		if (oFace.oShape.hType == Root.eType.Font){
			_nType = 7; //7 is font
			
		}
		
		
		
		
		//if (oFace.oShape.oParent.hType == Root.eType.Tile){//BAD evil Cast
		if (oFace.oShape.hType == Root.eType.Tile){//BAD evil Cast
		
			oAtTiles = Attribute_Tiles;
			
			<cpp>
			if(oAtTiles == 0){ //TODO correction in C~ if(oAt == null){
				return;
			}
			</cpp>
		
			oAtTiles.fSetIndex(GpuFace.nCurrent - 1);
		
			_nType = 6;

			
			//var _oTile : Tile = oFace.oShape.oParent; //Cast to tile  //BAD evil Cast
			var _oTile : Tile = oFace.oShape; //Cast to tile  //BAD evil Cast
		
				//	Debug.fWarning(oFace.oShape.oParent.fGetTypeName());
			//if(_oTile == 0){		return;}
			//Debug.fTrace("Update tiles : " + _oTile.nPosL);
			
			oAtTiles.oAtTilesHV.fSetVal(0, _oTile.nPosL);
			oAtTiles.oAtTilesHV.fSetVal(1, _oTile.nPosT);
			oAtTiles.oAtTilesHV.fSetVal(2, _oTile.nPosR);
			oAtTiles.oAtTilesHV.fSetVal(3, _oTile.nPosB);
				
			oAtTiles.oAtTilesC.fSetVal(0, _oTile.nNPosTL);
			oAtTiles.oAtTilesC.fSetVal(1, _oTile.nNPosTR);
			oAtTiles.oAtTilesC.fSetVal(2, _oTile.nNPosBR);
			oAtTiles.oAtTilesC.fSetVal(3, _oTile.nNPosBL);
		
		}
		

		oAt.oAtObjPos.fSetVal(3, _nType); //Merge pos and type to save space
		
		//	return;
		
		
		/*
   cTile* _oTile = (cTile*)oShape;
   
        //Left
        _aFaces[oGzSh->nStOffsetHV+_nIdx+0] = _oTile->nPosL;
        //Top
        _aFaces[oGzSh->nStOffsetHV+_nIdx+1] = _oTile->nPosT;
        //Right
        _aFaces[oGzSh->nStOffsetHV+_nIdx+2] = _oTile->nPosR;
        //Bottom
        _aFaces[oGzSh->nStOffsetHV+_nIdx+3] = _oTile->nPosB;


        //TL
        _aFaces[oGzSh->nStOffsetC+_nIdx+0] = _oTile->nNPosTL;
        //TR
        _aFaces[oGzSh->nStOffsetC+_nIdx+1] = _oTile->nNPosTR;
        //BR
        _aFaces[oGzSh->nStOffsetC+_nIdx+2] = _oTile->nNPosBR;
        //BL
        _aFaces[oGzSh->nStOffsetC+_nIdx+3] = _oTile->nNPosBL;
		*/
		
		
		
		
	}

	//	public function fSetImg(_oRc : RcImg):Void;
		
	}
}