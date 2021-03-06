//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.PtA;
	import GZ.Gfx.Tile.TileInfo;
	import GZ.Gfx.Tile.TileSet;
	import GZ.Gfx.Tile.TileData;
	import GZ.Gfx.Tile.MapData;
	import GZ.Gfx.Clip.Img;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Root;
	//import GZ.Base.Rect;
	import GZ.Base.Poly.PolyRect;
	import GZ.Base.Pt;
	import GZ.Base.Dim;
	import GZ.Gfx.Tile.LayerData;


	/**
	 * @author Maeiky
	 */
	public class Tile  extends Img {

		public var oOffsetL : Pt<Float>;
		public var oOffsetT : Pt<Float>;
		public var oOffsetR : Pt<Float>;
		public var oOffsetB : Pt<Float>;

		public var nPosL : Int;
		public var nPosT : Int;
		public var nPosB : Int;
		public var nPosR : Int;



		public var nNPosTL : Int;
		public var nNPosTR : Int;
		public var nNPosBR : Int;
		public var nNPosBL : Int;



		public var nCaseX : UInt;
		public var nCaseY : UInt;


		public var oTileData : TileData;
		public var oLayerData : LayerData;
		
		public var oImg : Img;
		
		
		public var bActivate : Bool = false;
		public var nTime : Float = 0;
		public var nOriYaw : Float = 0;
		public var nOriPitch : Float = 0;
		public var nColor : Float = 1.0;
		


		public function Tile(_oParent : Root, _oLayerData : LayerData, _oTileData : TileData, _nCaseX : UInt, _nCaseY : UInt): Void {
			oTileData = _oTileData;
			oLayerData = _oLayerData;
			var _oTileset : TileSet = oTileData.oTileset;

			hType = Root.eType.Tile;


			
			nCaseX = _nCaseX;
			nCaseY = _nCaseY;

			if(oTileData.oTileset.nTilePerRow > 0){
				var _oSrcPos : Pt<Float> =  _oTileset.fGetTilePos(oTileData.nId);
				var _oDim  : Dim<Float> = new Dim<Float>(_oTileset.nTileWidth,_oTileset.nTileHeight);
				var _oRegion : PolyRect<Float> = new PolyRect<Float>(_oSrcPos ,_oDim);
				//var _oRegion : PolyRect<Float> = new PolyRect<Float>(_oSrcPos , new Dim<Float>(_oTileset.nTileWidth,_oTileset.nTileHeight));
				
				if(oTileData.nFlipX < 0){
					_oRegion.fFlipX();
				}
				if(oTileData.nFlipY < 0){
					_oRegion.fFlipY();
				}
				if(oTileData.nFlipD < 0){
					_oRegion.fFlipD();
				}
				
				
				var _nX : Float = oTileData.oTileset.nTileWidth * nCaseX;
				var _nY : Float = oTileData.oTileset.nTileHeight * nCaseY;
				
				var _vPt : Pt<Float> = new Pt<Float>(0, 0);
			//	var _vPt : Pt<Float> = new Pt<Float>(_nX, _nY);
				var _oDimPt  : Dim<Float> = new Dim<Float>(_oTileset.nTileWidth,_oTileset.nTileHeight);
				var _oPts : PolyRect<Float> = new PolyRect<Float>(_vPt, _oDimPt);

				//Img(_oParent, oTileData.oTileset.nTileWidth * nCaseX, oTileData.oTileset.nTileHeight * nCaseY, oTileData.oTileset.oRc, false, 0,0,false,false, _oRegion, oTileData.oTileset.nTileWidth, oTileData.oTileset.nTileHeight);
				//oImg = new Img(_oParent, 0, 0, oTileData.oTileset.oRc, false, 0,0,false,false, _oRegion, oTileData.oTileset.nTileWidth, oTileData.oTileset.nTileHeight, _oPts);
			
				
				fSetNeighbor(_oSrcPos);
				
				
				
			//	Clip(_oParent, _vPt.nX, _vPt.nY );
				
			//		oImg = new Img(this, 0, 0, oTileData.oTileset.oRc, false, 0,0,false,false, _oRegion, oTileData.oTileset.nTileWidth, oTileData.oTileset.nTileHeight);
			Img(_oParent, _nX, _nY, oTileData.oTileset.oRc, true, 0,0,false,false, _oRegion, oTileData.oTileset.nTileWidth, oTileData.oTileset.nTileHeight);

				///fApplyPos();
			//	vPos.nX = 1000;
				//vPos.nY = _vPt.nY;
				
			
				
			}

			vSize.nWidth = 0;
			vSize.nHeight = 0;
			vSize.nWidth.fTo(1.0);
			vSize.nHeight.fTo(1.0);
			vSize.fSetSpeed(20);
			

			
			vColor.nAlpha = 0;
			vColor.fSetSpeed(60);
			vColor.nAlpha.fTo(1.0);
			
			vRot.nRoll.fTo(3.1416 * 2.0);
			vRot.fSetSpeed(30);
			//oOffsetL = oTileData.oTileset.fGetTilePos(oTileData.nId)
		}

	
		override public function fUpdateParentToChild():Void {

			nTime+= 0.5;

			if(vRot.nRoll > 3.13 * 2.0){
				vRot.nRoll = 0.0;
			}
			if(vSize.nWidth > 0.99){
				vSize.nWidth = 1.0;
			}

			if(vSize.nHeight > 0.99){
				vSize.nHeight = 1.0;
			}

			if(nTime > 600){
				bActivate = true;
				nTime = 0;
				nColor = nColor * -0.5;
			}
			if(bActivate == false){
				return;
			}
/*
			if(nTime > 1000){
				nTime = 0;
		
			}*/
			
			var _nPosY : Int = vPos.nY/32;
			

			if(_nPosY % 2 == 0 ){
				if(nTime  == vPos.nX / 2  ){
					vRot.fSetSpeed(40);
					vRot.nYaw.fTo(nOriYaw + 3.1416 * 2.0);
					
				}
				if(vRot.nYaw > nOriYaw + 3.10 * 2.0){
					vRot.nYaw = nOriYaw;
				}
			}else{
				

			}


			if(nTime  == vPos.nY / 2  ){
				vRot.fSetSpeed(40);
				vRot.nPitch.fTo(nOriPitch + 3.1416 * 2.0);
				vColor.nRed.fTo(nColor);
				
			}
			if(vRot.nPitch > nOriPitch + 3.10 * 2.0){
				vRot.nPitch = nOriPitch;
			}

			//vRot.nYaw = vRot.nYaw + 0.1;
		}



		//TODO Already in IMG ???!
		override public function  fApplyGlobalPos():Void {

	//vRot.nYaw = vRot.nYaw + 0.1;

			for( var i : UInt = 0; i < aNewPt3dOri.nSize; i++){
				var _oPt : PtA = aNewPt3dOri[i];
					
				_oPt.vTf.nX = _oPt.vPt.nX * vSize.nWidth ;
				_oPt.vTf.nY = _oPt.vPt.nY * vSize.nHeight;
				_oPt.vTf.nZ = _oPt.vPt.nZ * vSize.nLength;

				_oPt.vTf.fRotate(vQuaternion);

				_oPt.vTf.nX += vPos.nX ;
				_oPt.vTf.nY += vPos.nY ;
				_oPt.vTf.nZ += vPos.nZ ;
				
			}
		}

		
		public function fSetNeighbor(_oSrcPos : Pt<Float>):Void{


			var _nTileWidth : UInt = oTileData.oTileset.nTileWidth;
			var _nTileHeight : UInt = oTileData.oTileset.nTileHeight;
			var _nSpacing : UInt = oTileData.oTileset.nSpacing;

			var _nX : Float = _oSrcPos.nX + _nSpacing;
			var _nY : Float = _oSrcPos.nY + _nSpacing;

			var _aTileData : Array<TileData,2> = oLayerData.aTile;
			var _oTileT : TileData = _aTileData[nCaseY - 1][nCaseX];
			var _oTileB : TileData = _aTileData[nCaseY + 1][nCaseX];
			var _oTileR : TileData = _aTileData[nCaseY][nCaseX + 1];
			var _oTileL : TileData = _aTileData[nCaseY][nCaseX - 1];


			var _nWidth : Float = (oTileData.oTileset.oRc.nWidth + 2.0);
			var _oTileset : TileSet = oTileData.oTileset;

			var _oPtT : Pt<Float> = new Pt<Float>();
			var _oPtR : Pt<Float> = new Pt<Float>();
			var _oPtB : Pt<Float> = new Pt<Float>();
			var _oPtL : Pt<Float> = new Pt<Float>();
			if(_oTileT){
				_oPtT =  _oTileset.fGetTilePos(_oTileT.nId);
			}
			if(_oTileR){
				_oPtR =  _oTileset.fGetTilePos(_oTileR.nId);
			}
			if(_oTileB){
				_oPtB =  _oTileset.fGetTilePos(_oTileB.nId);
			}
			if(_oTileL){
				_oPtL =  _oTileset.fGetTilePos(_oTileL.nId);
			}


			///// Left /////
			if(_oTileL){
				_oPtL.nX += _nTileWidth;
				
				if(_oTileL.nFlipX < 0){ 
					_oPtL.nX -= _nTileWidth-1;
				}

			}


			///// Top ////////
			if(_oTileT){
				_oPtT.nY += _nTileHeight;
				
				if(_oTileT.nFlipY < 0){ 
					_oPtT.nY -= _nTileHeight - 1;
				}
			}

			///// Right ////////
			if(_oTileR){
				_oPtR.nX += 1;
				
				if(_oTileR.nFlipX < 0){
					_oPtR.nX += _nTileWidth - 1;
				}
			}


			////// Bottom ////////
			if(_oTileB){
				_oPtB.nY += 1;
				
				if(_oTileB.nFlipY < 0){ 
					_oPtB.nY += _nTileHeight - 1;
				}
			}


			///Pack
			nPosL = _oPtL.nY * _nWidth + _oPtL.nX;
			nPosT = _oPtT.nY * _nWidth + _oPtT.nX;
			nPosR = _oPtR.nY * _nWidth + _oPtR.nX;
			nPosB = _oPtB.nY * _nWidth + _oPtB.nX;

			if(_oTileB){
				if(_oTileB.nFlipX < 0){
					nPosB *= -1;
				}
			}
			if(_oTileT){
				if(_oTileT.nFlipX < 0){
					nPosT *= -1;
				}
			}
			
			if(_oTileL){
				if(_oTileL.nFlipY < 0){
					nPosL *= -1;
				}
			}
			if(_oTileR){
				if(_oTileR.nFlipY < 0){
					nPosR *= -1;
				}
			}

			/////////////////////////////// CORNER //////////////////////////

			var _oTileTL : TileData = _aTileData[nCaseY - 1][nCaseX - 1];
			var _oTileTR : TileData = _aTileData[nCaseY - 1][nCaseX + 1];
			var _oTileBR : TileData = _aTileData[nCaseY + 1][nCaseX + 1];
			var _oTileBL : TileData = _aTileData[nCaseY + 1][nCaseX - 1];
			var _oPtTL : Pt<Float> = new Pt<Float>();
			var _oPtTR : Pt<Float> = new Pt<Float>();
			var _oPtBR : Pt<Float> = new Pt<Float>();
			var _oPtBL : Pt<Float> = new Pt<Float>();
			if(_oTileTL){
				 _oPtTL  =_oTileset.fGetTilePos(_oTileTL.nId);
			}
			if(_oTileTR){
				 _oPtTR  =_oTileset.fGetTilePos(_oTileTR.nId);
			}
			if(_oTileBR){
				 _oPtBR  =_oTileset.fGetTilePos(_oTileBR.nId);
			}
			if(_oTileBL){
				 _oPtBL  =_oTileset.fGetTilePos(_oTileBL.nId);
			}

			//TopLeft
			_oPtTL.nX += _nTileWidth;
			_oPtTL.nY += _nTileHeight;


			//TopRight
			_oPtTR.nY += _nTileHeight;
			_oPtTR.nX += 1;


			//BotRight
			_oPtBR.nX += 1;
			_oPtBR.nY += 1;


			//BotLeft
			_oPtBL.nX += _nTileWidth;
			_oPtBL.nY += 1;


			////// FLIP /////
			if(_oTileTR){
				if(_oTileTR.nFlipX < 0){
					_oPtTR.nX += _nTileWidth - 1;
				}
			}
			if(_oTileBR){
				if(_oTileBR.nFlipX < 0){
					_oPtBR.nX += _nTileWidth - 1;
				}
			}
			if(_oTileTL){
				if(_oTileTL.nFlipX < 0){
					_oPtTR.nX -= _nTileWidth - 1;
				}
			}
			if(_oTileBL){
				if(_oTileBL.nFlipX < 0){
					_oPtBL.nX -= _nTileWidth - 1;
				}
			}
			
			if(_oTileTR){
				if(_oTileTR.nFlipY < 0){
					_oPtTR.nY -= _nTileHeight - 1;
				}
			}
			if(_oTileBR){
				if(_oTileBR.nFlipY < 0){
					_oPtBR.nY += _nTileHeight - 1;
				}
			}
			if(_oTileTL){
				if(_oTileTL.nFlipY < 0){
					_oPtTR.nY -= _nTileHeight - 1;
				}
			}
			if(_oTileBL){
				if(_oTileBL.nFlipY < 0){
					_oPtBL.nY += _nTileHeight - 1;
				}
			}


			nNPosBR = _oPtBR.nY * _nWidth + _oPtBR.nX;
			nNPosTR = _oPtTR.nY * _nWidth + _oPtTR.nX;
			nNPosTL = _oPtTL.nY * _nWidth + _oPtTL.nX;
			nNPosBL = _oPtBL.nY * _nWidth + _oPtBL.nX;
			
			var _nTemp : Int;
			if(oTileData.nFlipX < 0){
				_nTemp = nNPosTL;
				nNPosTL = nNPosTR;
				nNPosTR = _nTemp;
				
				_nTemp = nNPosBL;
				nNPosBL = nNPosBR;
				nNPosBR = _nTemp;
			}
			if(oTileData.nFlipY < 0){
				_nTemp = nNPosTL;
				nNPosTL = nNPosBL;
				nNPosBL = _nTemp;
				
				_nTemp = nNPosTR;
				nNPosTR = nNPosBR;
				nNPosBR = _nTemp;
			}
			
			if(oTileData.nFlipD < 0){
				nNPosTL *= -1;
			}
			
			
			

			/////////////////////////////////////////////////////////////////
		}
		
			//Overited
		override function fGetTypeName():String {
			return "Tile";
		}
		
		
	}
}
