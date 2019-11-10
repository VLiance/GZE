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
	import GZ.Gfx.Tile.MapData;
	import GZ.Gfx.Tile.TileData;
	import GZ.Gfx.Tile.LayerData;

	/**
	 * @author Maeiky
	 */
	public class LayerData  {


		public wvar oMap : MapData;

		public var sName : String;
		public var nX : UInt;
		public var nY : UInt;

		public var nWidth : UInt;
		public var nHeight : UInt;
		public var nOpacity : Float;
		public var bVisible : Bool;
		public var nOrder : UInt;

		public enum eFlip: UInt {
			Horizontally = 0x80000000;
			Vertically   = 0x40000000;
			Diagonally   = 0x20000000;
		}


		public var aTile : Array<TileData,2>;


		public enum eType: Int {
			Tile;
			ObjectGroup;
			ImageLayer;
		}
		public var hType : eType;

		public var aProperty : Array<Property>;


		public function LayerData(_oMap : MapData):Void {
			oMap = _oMap;
		}


		/////////////////// Tmx Loader ///////////////
		public function fLoadTmxNode( _oFromNode : XmlElement ):Void {


			sName = _oFromNode.fAttribute("name");
			nX = _oFromNode.fAttributeInt("x");
			nY = _oFromNode.fAttributeInt("y");
			
			nWidth = _oFromNode.fAttributeInt("width");
			nHeight = _oFromNode.fAttributeInt("height");


			
			var _oNode : XmlNode = _oFromNode.fFirst();
			while( _oNode ){

				//Map Properties
				if(_oNode.fName() == "properties"){
					var _oPropNode : XmlElement = _oNode;
					aProperty.fPush(Property.fNewProperty(_oPropNode.fAttribute("name"), _oPropNode.fAttribute("value")));
				}

				//Load data
				if(_oNode.fName() == "data"){
                    var _oDataNode : XmlElement = _oNode;
					var _sEncoding : String = _oDataNode.fAttribute("encoding");
					
					if(_sEncoding == "csv"){
						fExtractDataCSV(_oDataNode.fGetText());
					}
				}

				_oNode = _oNode.fNext();
			}
		}


		public function fExtractDataCSV( _sData : String ):Void {
		
			var _aData : Array<String> = _sData.fSplit(",");
			var i : UInt = 0;
		
			for(var _nY : Int = 0; _nY < nHeight; _nY++){
				for(var _nX : Int = 0; _nX < nWidth; _nX++){
					fNewTile(_aData[i], _nX, _nY);
					i++;
				}
			}
		}

		public function fNewTile( _sValue : String, _nX:UInt, _nY:UInt ):Void {
			//Debug.fTrace("fNewTile: " + _sValue);
			var _nValue : UInt = _sValue.fToUInt();
			//var _nValue : UInt = _sValue;
			if(_nValue != 0){ // Not a Empty Tile
				var _bFlipD : Bool = _nValue & eFlip.Diagonally;
				var _bFlipX : Bool = _nValue & eFlip.Horizontally;
				var _bFlipY : Bool = _nValue & eFlip.Vertically;

				_nValue = _nValue & 0x0FFFFFFF; //Remove fliping

				//aTile.fPush(new TileData(oMap, _nValue, _bFlipD, _bFlipX, _bFlipY));
				aTile[_nY][_nX] = new TileData(oMap, _nValue, _bFlipD, _bFlipX, _bFlipY));
			}
		}
		
		public function fGetTileId(_nX : UInt : String,  _nY : UInt : String):UInt {
			var _oTileT : TileData =  aTile[_nY][_nX];
			if(_oTileT){
				return _oTileT.nId;
			}else{
				return 0;
			}
		}
		
	}
}
