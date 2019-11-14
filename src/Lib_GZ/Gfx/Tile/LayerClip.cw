//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {


	import GZ.Sff.Xml.Xml;
	import GZ.Sff.Xml.XmlNode;
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	import GZ.File.RcImg;
	import GZ.Base.Property.Property;
	import GZ.Gfx.Tile.LayerData;
	import GZ.Gfx.Tile.TileData;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Tile.Tile;
	import GZ.Gfx.Root;

	/**
	 * @author Maeiky
	 */
	public class LayerClip  extends Clip {


		public var aTile : Array<Tile, 2>;
		public var oLayerData : LayerData;
		
		public enum eOrientation: Int {
			Normal;
			Floor;
			SideWall;

		}
		public var hOrientation : eOrientation;

		public function LayerClip(_oParent : Root, _oLayerData : LayerData, _nX: Float, _nY:Float, _hOrientation:eOrientation = eOrientation.Normal ):Void {
			Clip(_oParent, _nX , _nY);
			oLayerData = _oLayerData;
			hOrientation = _hOrientation;
			fLoadLayer(_oLayerData);
		
		}

		public function fLoadLayer(_oLayerData : LayerData):Void {

			Debug.fWarning("************fLoadLayer********** ");
			var _aTileData : Array<TileData,2> = _oLayerData.aTile;
			Debug.fWarning("************_aTileData********** ");
			for(var _nY : Int = 0; _nY < _oLayerData.nHeight; _nY++){
				for(var _nX : Int = 0; _nX < _oLayerData.nWidth; _nX++){
				//	if(_aTileData[_nY] != null){
		
					var _oTileData : TileData = _aTileData[_nY][_nX];
					if(_oTileData ){
						var _oTile : Tile = new Tile(this, _oLayerData, _oTileData, _nX, _nY));
						aTile[_nY][_nX] = _oTile;
						if(hOrientation == eOrientation.Floor){

							_oTile.vPos.nY = _oTile.vPos.nY - 16;
							_oTile.vPos.nZ = _oTile.vPos.nZ - 16;
							_oTile.vRot.nPitch =  1.5708; //Rotate
						}
						if(hOrientation == eOrientation.SideWall){

							_oTile.vPos.nX = _oTile.vPos.nX - 16;
							_oTile.vPos.nZ = _oTile.vPos.nZ - 16;
							_oTile.vRot.nYaw =  1.5708; //Rotate
						}
						
						_oTile.nOriYaw = _oTile.vRot.nYaw;						
						_oTile.nOriPitch = _oTile.vRot.nPitch;			

					}
					//}
				}
			}
	Debug.fWarning("************End ********** ");
			/*
			for(var i : Int = 0; i < _aTileData.nSize; i++){
				var _oTileData : TileData = _aTileData[i];
				aTile.fPush(new Tile(this, _oTileData));
			}*/
		}


	}
}
