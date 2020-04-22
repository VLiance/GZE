//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {


	import GZ.Sff.Xml.Xml;
	import GZ.Sff.Xml.XmlNode;
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	import GZ.File.RcImg;
	import GZ.Gfx.Tile.TileInfo;
	import GZ.Base.Pt;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	
	/**
	 * @author Maeiky
	 */
	public class TileSet  {


		public var sName : String;
		
		
		
		public var nWidth : UInt;
		public var nHeight : UInt;
		public var nTileWidth : UInt;
		public var nTileHeight : UInt;
		public var nTileWidthB : UInt;
		public var nTileHeightB : UInt;
		public var nTilePerRow : UInt;
		
		
		public var nMargin : Int;
		public var nSpacing : UInt;
		public var nFirstGrid : UInt;

		public var oRc : RcImg;
		
		public var aTileInfo : Array<TileInfo>;

		public function TileSet( ):Void {

		}


		/////////////////// Tmx Loader ///////////////
		public function fLoadTmxNode( _oFromNode : XmlElement ):Void {
			//Debug.fTrace("Extact tileset");

			nFirstGrid = _oFromNode.fAttributeInt("firstgid");

			// If the tileset  node contains a 'source' tag, we must load a external TSX (Tile Set XML) file
			var  _sSource : String = _oFromNode.fAttribute("source");
			if ( _sSource.nSize > 0 ){
				Debug.fError("Todo, make a TSX loaded for tileset");
			}

			nTileWidth = _oFromNode.fAttributeInt("tilewidth");
			nTileHeight = _oFromNode.fAttributeInt("tileheight");
			nMargin = _oFromNode.fAttributeInt("margin");
			nSpacing = _oFromNode.fAttributeInt("spacing");
			sName = _oFromNode.fAttributeInt("name");
			
		
			 //Todo Parse the tile offset if exists.
			 //Todo Parse terrain if exists.
			 
			var _oImgNode : XmlElement = _oFromNode.fFirst("image")
			if(_oImgNode){
				////Find in RC ??
				
				var _sSrc : String = _oImgNode.fAttribute("source");
				//var _nWidth : UInt = _oImgNode.fAttributeInt("width");
				//var _nWidth : UInt = _oImgNode.fAttributeInt("height");
				
				Debug.fTrace("Open: "  + _sSrc);
				oRc = new RcImg("Exe|Rc/Tiled/" + _sSrc);	
				
				if(Context.oItf.bGpuDraw){
					oRc.fSetGpuTexLayer(Attribute_Quad.oTexture);
					Debug.fTrace("TileSetLayer: " + Attribute_Quad.oTexture.nSlot);
				}
				
				//oRc.fLoadFromDrive(_sSrc);
				oRc.fCpuLoad();
				oRc.fGpuLoad();	
			 }
			 
			var _oTileNode : XmlElement = _oFromNode.fFirst("tile")
			while(_oTileNode){
				var _oTile : TileInfo = new TileInfo();
				_oTile.fLoadTmxNode(_oTileNode);
				aTileInfo[_oTile.nId ] = _oTile; //Waste some space to retreive easily index
				_oTileNode = _oTileNode.fNext("tile");
			}
			 
			 
		    fIni();
			//Debug.fTrace("tilewidth:" + nTileWidth);

		}
		
		
		public function fIni():Void {
			nWidth = oRc.nWidth - nMargin + nSpacing;
			nTileWidthB = nTileWidth + nSpacing;
			
			nTilePerRow = nWidth / nTileWidthB;
		}
		
		public function fGetTilePos(_nId : UInt):Pt<Float> {
			var _nTileId : UInt = _nId - nFirstGrid;
			var _nTileY : UInt = (_nTileId / nTilePerRow);
			var _nTileX : UInt = (_nTileId - (_nTileY * nTilePerRow));
			var _nPosX : Float = _nTileX* nTileWidthB + nMargin;
			var _nPosY : Float = _nTileY* nTileWidthB + nMargin;
			var _oPt : Pt<Float> = new Pt<Float>(_nPosX, _nPosY);
			return _oPt;
		}
		

	}
}
