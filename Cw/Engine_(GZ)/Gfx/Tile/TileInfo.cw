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


	/**
	 * @author Maeiky
	 */
	public class TileInfo  {


		public var sName : String;

		public var nId : UInt;
		public var nTotalFrame : UInt;
		
		public var aProperty : Array<Property>;
		
		
		
		public function TileInfo( ):Void {
			
		}
		
		
		/////////////////// Tmx Loader ///////////////
		public function fLoadTmxNode( _oFromNode : XmlElement ):Void {
			
			nId = _oFromNode.fAttributeInt("id");
			
			var _oNode : XmlNode = _oFromNode.fFirst();
			while( _oNode ){

				//Map Properties
				if(_oNode.fName() == "properties"){
					var _oPropNode : XmlElement = _oNode;
					aProperty.fPush(Property.fNewProperty(_oPropNode.fAttribute("name"), _oPropNode.fAttribute("value")));
				}
				
				_oNode = _oNode.fNext();
			}
			 

		}

	}
}
