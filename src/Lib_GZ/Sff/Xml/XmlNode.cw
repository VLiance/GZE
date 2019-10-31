//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	//import GZ.Base.Math;
	<cpp_h>
		#include "Lib_GZ/3rdparty/Xml/tinyxml2.h"
	</cpp_h>
	/**
	 * @author Maeiky
	 */
	public extension XmlNode  {

		public wvar oParentNode : XmlNode;
		public wvar oTinyNode : Any;
		
		
		public enum eType : Int {
			Element;
			Text;
			Comment;
			Document;
			Declaration;
			Unknown;
		}
		
		public var hType : eType;
		

		
		public function XmlNode(_oParentNode:XmlNode, _oTinyNode:Any = null):Void{  //Any = tinyxml2::XMLNode*
			oParentNode = _oParentNode;
			oTinyNode = _oTinyNode;
		}
		/*
		public function fSetNode(_oTinyNode :XmlNode):String {
		
		}
		*/
				
		public function fName():String{
			<cpp>
			 return gzStrC(((tinyxml2::XMLNode*)oTinyNode)->Value());
			 </cpp>
		}
	
		public function fFirst( _sElement : String = ""):XmlNode {
			<cpp>
			tinyxml2::XMLNode* _oNode;
			if(_sElement.GnSize() > 0){
				_oNode =  ((tinyxml2::XMLNode*)oTinyNode)->FirstChildElement((const char*)_sElement.fToCStr().get());
			}else{
				_oNode =  ((tinyxml2::XMLNode*)oTinyNode)->FirstChildElement(0);
			}

			if(_oNode && _oNode->ToElement()){
				return gzSCast<::GZ::Sff::Xml::cXmlNode>( XmlElement::New(this, this, _oNode) );
			}

			//Unknow
			gzSp<cXmlNode> _oXmlNode;
			return _oXmlNode;
			</cpp>
		}
		
			
		public function fLast( _sElement : String = ""):XmlNode{
			<cpp>
			    gzSp<cXmlNode> _oXmlNode;
				return _oXmlNode;
			</cpp>
		}
		
		public function fNext( _sElement : String = ""):XmlNode{
			<cpp>
		    tinyxml2::XMLNode* _oNode =  ((tinyxml2::XMLNode*)oTinyNode)->NextSibling();
			if(_oNode){
				return gzSCast<::GZ::Sff::Xml::cXmlNode>( XmlElement::New(this, this, _oNode) );
			}
			//Empty
			gzSp<cXmlNode> _oXmlNode;
			return _oXmlNode;
			</cpp>
		}
		
		public function fPrevious( _sElement : String = ""):XmlNode{
			<cpp>
				tinyxml2::XMLNode* _oNode =  ((tinyxml2::XMLNode*)oTinyNode)->PreviousSibling();
				if(_oNode){
					return gzSCast<::GZ::Sff::Xml::cXmlNode>( XmlElement::New(this, this, _oNode) );
				}
				//Empty
				gzSp<cXmlNode> _oXmlNode;
				return _oXmlNode;
			</cpp>
		}
		
		

	}
}
