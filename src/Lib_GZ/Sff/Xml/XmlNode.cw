//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	//import GZ.Base.Math;
	
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	
	<cpp_h>
		#include "Lib_GZ/3rdparty/Xml/tinyxml2.h"
	</cpp_h>
	/**
	 * @author Maeiky
	 */
//	public extension XmlNode  {
	public class XmlNode  {

		public wvar oParentNode : XmlNode;
		public wvar oTinyNode : Any;
		
		
		public enum eType : Int {
			Text;
			Element;
			Comment;
			Document;
			Declaration;
			Unknown;
		}
		
		public var hType : eType;
		

		
		public function XmlNode(_oParentNode:XmlNode, _oTinyNode:Any = null):Void{  //Any = tinyxml2::XMLNode*
			oParentNode = _oParentNode;
			oTinyNode = _oTinyNode;
			hType = eType.Unknown;
		}
/*
var _oXmlElement : XmlElement = new XmlElement(this, _oNode);
return _oXmlElement;
*/
			
		public function fNewCwNode(_oNode : Any):XmlNode {
			<cpp>
			if(((tinyxml2::XMLNode*)_oNode)->ToElement()){
				</cpp>
				return new XmlElement(this, _oNode);
				<cpp>
			}
			if(((tinyxml2::XMLNode*)_oNode)->ToText()){
				</cpp>
				return new XmlText(this, _oNode);
				<cpp>
			}
			if(((tinyxml2::XMLNode*)_oNode)->ToComment()){
				//TODO
			}
			if(((tinyxml2::XMLNode*)_oNode)->ToDocument()){
				//TODO
			}
			if(((tinyxml2::XMLNode*)_oNode)->ToDeclaration()){
				//return new XmlNode(this, _oNode);
			}
			//if(_oNode->ToUnknown()){	
			//}
			</cpp>
			return new XmlNode(this, _oNode);
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
			var _oCwNode : Any;
			<cpp>
			tinyxml2::XMLNode* _oNode;

			if(_sElement.GnSize() > 0){
				_oNode =  ((tinyxml2::XMLNode*)oTinyNode)->FirstChildElement((const char*)_sElement.fToCStr().get());
			}else{
				_oNode =  ((tinyxml2::XMLNode*)oTinyNode)->FirstChildElement(0);
			}
			_oCwNode = _oNode;
			
			if(_oNode && _oNode->ToElement()){
				</cpp>
				Debug.fPass("New XML node!");
				return fNewCwNode(_oCwNode);
				<cpp>
			//	return gzSCast<::GZ::Sff::Xml::cXmlNode>( XmlElement::New(this, this, _oNode) );
			}
			
			</cpp>
				Debug.fError("Unknow Node!");
			<cpp>
			
			
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
			var _oCwNode : Any;
			<cpp>
		    tinyxml2::XMLNode* _oNode =  ((tinyxml2::XMLNode*)oTinyNode)->NextSibling();
			_oCwNode = _oNode;
			if(_oNode){
				</cpp>
				return fNewCwNode(_oCwNode);
				<cpp>
			}
			//Empty
			gzSp<cXmlNode> _oXmlNode;
			return _oXmlNode;
			</cpp>
		}
		
		public function fPrevious( _sElement : String = ""):XmlNode{
			var _oCwNode : Any;
			<cpp>
				tinyxml2::XMLNode* _oNode =  ((tinyxml2::XMLNode*)oTinyNode)->PreviousSibling();
				_oCwNode = _oNode;
				if(_oNode){
					</cpp>
					return fNewCwNode(_oCwNode);
					<cpp>
				}
				//Empty
				gzSp<cXmlNode> _oXmlNode;
				return _oXmlNode;
			</cpp>
		}
		
		

	}
}
