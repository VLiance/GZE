//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sff.Xml.XmlNode;

	/**
	 * @author Maeiky
	 */
	public class XmlElement extends XmlNode {

		//public var nX : Float;

		//public function XmlElement( _sFile : String = ""):Void;
		public function XmlElement(_oParentNode:XmlNode, _oTinyNode:Any):Void{
			
			//Ini_cXmlNode(_opParentNode, _oTinyNode);
			hType = XmlNode.eType.Element;
			
		}
		
		
	//	public function fLoad( _sFile : String = ""):Void;
		
		
		public function fGetText():String {
			<cpp>
				return gzStrC(((tinyxml2::XMLElement*)oTinyNode)->GetText());
		   </cpp>
		}
		
		public function fAttribute(_sAttribute:String):String {
			<cpp>
			 const char* _sGet =  ((tinyxml2::XMLElement*)oTinyNode)->Attribute( (const char*)_sAttribute.fToCStr().get() );
			return gzStrC(_sGet);
			</cpp>
		}
		public function fAttributeInt(_sAttribute:String):Int {
			<cpp>
		    return ((tinyxml2::XMLElement*)oTinyNode)->IntAttribute( (const char*)_sAttribute.fToCStr().get() );
			</cpp>
		}
		public function fAttributeUInt(_sAttribute:String):UInt {
			<cpp>
			return 0;
			</cpp>
		}
		public function fAttributeBool(_sAttribute:String):Bool {
			<cpp>
			return true;
			</cpp>
		}
		public function fAttributeFloat(_sAttribute:String):Float {
			<cpp>
			return true;
			</cpp>
		}
		
	}
}
