//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sff.Xml.Xml;
	import GZ.Sff.Xml.XmlNode;
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	import GZ.Sff.Tmx.Tmx;
	import GZ.Gfx.Tile.LayerData;
	import GZ.Gfx.Tile.TileSet;




	/**
	 * @author Maeiky
	 */
	public class MapData  {

		public var nWidth : UInt;
		public var nHeight : UInt;
		public var nTileWidth : UInt;
		public var nTileHeight : UInt;
		public var nBackgroundcolor : UInt;

		public var aTileSet : Array<TileSet>;
		
		public var aLayer : Array<LayerData>;

		public var nHexsideLength : UInt;


		public enum eOrientation: Int {
			Orthogonal;
			Isometric;
			Staggered;
			Hexagonal
		}
		public var hOrientation : eOrientation;

		public enum eRenderOrder: Int {
			RightUp;
			RightDown;
			LeftUp;
			LeftDown
		}
		public var hRenderOrder : eRenderOrder;


		public enum eStaggerAxis: Int {
			X;
			Y;
		}
		public var hStaggerAxis : eStaggerAxis;

		public enum eStaggerIndex: Int {
			Even;
			Odd;
		}
		public var hStaggerIndex : eStaggerIndex;


		public function MapData():Void {
		}




		/////////////////// Tmx Loader ///////////////

		public function fLoadTxmNode( _oMapNode : XmlElement ):Void {

			Debug.fTrace1("Tmx Map : " + _oMapNode.fAttribute("map"));

			nWidth =  _oMapNode.fAttributeInt("width");
			nHeight =  _oMapNode.fAttributeInt("height");
			nTileWidth =  _oMapNode.fAttributeInt("tilewidth");
			nTileHeight =  _oMapNode.fAttributeInt("tileheight");
			nBackgroundcolor =  _oMapNode.fAttributeInt("backgroundcolor");
			nTileHeight =  _oMapNode.fAttributeInt("backgroundcolor");

			var _sOri : String = _oMapNode.fAttribute("orientation");
			if(_sOri == "orthogonal"){
				hOrientation = eOrientation.Orthogonal;
			}else if(_sOri == "isometric"){
				hOrientation = eOrientation.Isometric;
			}else if(_sOri == "staggered"){
				hOrientation = eOrientation.Staggered;
			}else if(_sOri == "hexagonal"){
				hOrientation = eOrientation.Hexagonal;
			}

			var _sOrder : String = _oMapNode.fAttribute("renderorder");
			if(_sOrder == "right-up"){
				hRenderOrder = eRenderOrder.RightUp;
			}else if(_sOrder == "right-down"){
				hRenderOrder = eRenderOrder.RightDown;
			}else if(_sOrder == "left-up"){
				hRenderOrder = eRenderOrder.LeftUp;
			}else if(_sOrder == "left-down"){
				hRenderOrder = eRenderOrder.LeftDown;
			}

			var _sStgAxis : String = _oMapNode.fAttribute("staggeraxis");
			if(_sStgAxis == "x"){
				hStaggerAxis = eStaggerAxis.X;
			}else if(_sStgAxis == "y"){
				hStaggerAxis = eStaggerAxis.Y;
			}

			var _sStgIndex : String = _oMapNode.fAttribute("staggeraxis");
			if(_sStgAxis == "even"){
				hStaggerIndex = eStaggerIndex.Even;
			}else if(_sStgAxis == "odd"){
				hStaggerIndex = eStaggerIndex.Odd;
			}

			nHexsideLength  = _oMapNode.fAttributeInt("hexsidelength");

			Debug.fTrace1("Map " + nWidth + "x" + nHeight):

			fExtactAllMapTmxNode(_oMapNode);
		}

		public function fExtactAllMapTmxNode( _oFromNode : XmlNode ):Void {
			var _oNode : XmlNode = _oFromNode.fFirst();
			while( _oNode ){

				//Map Properties
				if(_oNode.fName() == "properties"){
					Debug.fTrace1("found Map properties");
				}

				//Map Tilesets
				if(_oNode.fName() == "tileset"){
					var _oTilseSet : TileSet =  new TileSet();
					_oTilseSet.fLoadTmxNode(_oNode);
					aTileSet.fPush( _oTilseSet );
				}
				

				//Map Layers
				if(_oNode.fName() == "layer"){
					var _oLayer : LayerData =  new LayerData(this);
					_oLayer.fLoadTmxNode(_oNode);
					aLayer.fPush( _oLayer );
				}
				
				

				Debug.fTrace1(_oNode.fName());
				_oNode = _oNode.fNext();
			}
		}
		/////////////////////////////////////////////////


	}
}
