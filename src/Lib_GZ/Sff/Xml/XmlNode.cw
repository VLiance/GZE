//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	//import GZ.Base.Math;

	/**
	 * @author Maeiky
	 */
	public extension XmlNode  {

		public wvar oParentNode : XmlNode;
		
		public enum eType : Int {
			Element;
			Text;
			Comment;
			Document;
			Declaration;
			Unknown;
		}
		
		public var hType : eType;
		

		
		public function XmlNode(_oParentNode:XmlNode):Void{
			oParentNode = _oParentNode;
		}
		
		public function fName():String;
	
		public function fFirst( _sElement : String = ""):XmlNode;
		
		public function fLast( _sElement : String = ""):XmlNode;
		
		public function fNext( _sElement : String = ""):XmlNode;
		
		public function fPrevious( _sElement : String = ""):XmlNode;
		
	}
}
