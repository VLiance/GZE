//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {


	import GZ.GFX.Tile.TileInfo;
	import GZ.GFX.Tile.TileSet;
	import GZ.GFX.Tile.MapData;


	/**
	 * @author Maeiky
	 */
	public class TileData  {


		public var oInfo : TileInfo;
		
		public wvar oTileset : TileSet;

		public var nId : UInt;
		public var nFlipX : Int8 = 1;
		public var nFlipY : Int8 = 1;
		public var nFlipD : Int8 = 1;


		public function TileData(_oMap:MapData, _nId:UInt, _bFlipD : Bool = 1, _bFlipX : Bool = 1, _bFlipY : Bool = 1): Void {
			nId = _nId;

			if(_bFlipD){
				nFlipD = -1;
			}
			if(_bFlipX){
				nFlipX = -1;
			}
			if(_bFlipY){
				nFlipY = -1;
			}

			if(_nId != 0){ //Empty tile
				fFoundInfo(_oMap);
			}else{
				Debug.fError("Tile Error: Trying to create an empty tile data");
			}
		}

		public function fFoundInfo(_oMap:MapData): Bool{
			var _aTileSet : Array<TileSet> = _oMap.aTileSet;
			for(var i : Int = _aTileSet.nSize - 1; i >= 0; i-- ){
				var _oTileSet : TileSet = _aTileSet[i];
				if(nId >= _oTileSet.nFirstGrid){
					oInfo = _oTileSet.aTileInfo[nId - _oTileSet.nFirstGrid ];
					oTileset = _oTileSet;
					return true;
				}
			}

		}


	}
}
