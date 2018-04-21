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

		public function XmlElement( _sFile : String = ""):Void;
		public function fLoad( _sFile : String = ""):Void;
		
		
		public function fGetText():String;
		
		public function fAttribute(_sAttribute:String):String {
		}
		public function fAttributeInt(_sAttribute:String):Int {
		}
		public function fAttributeUInt(_sAttribute:String):UInt {
		}
		public function fAttributeBool(_sAttribute:String):Bool {
		}
		public function fAttributeFloat(_sAttribute:String):Float {
		}
		
		
	}
}
