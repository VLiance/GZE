//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sff.Xml.XmlNode;
	import GZ.File.RcText;

	<cpp_h>
		#include "Lib_GZ/3rdparty/Xml/tinyxml2.h"
	</cpp_h>
	
	/**
	 * @author Maeiky
	 */
	public class Xml extends XmlNode {

		//public var nX : Float;
		
		<cpp_class_h>
		tinyxml2::XMLDocument* doc;
      //  gzStr sPath;
        gzBool bLoaded;
       // gzUInt nErrCode;
        gzStr sError;
		</cpp_class_h>
		

		//public function Xml( _sPath : String = ""):Void;
		public function Xml(_oParentNode:XmlNode, _oTinyNode:Any = null):Void {
			
			<cpp>
				
			doc = new tinyxml2::XMLDocument();

			//sPath = _sPath;
		//	Ini_cXmlNode(this, doc);
			
			</cpp>
		}
		
		public function fLoad(_oRc : RcText) : Bool {
		
		
		   var _sPath : String = _oRc.sPath; //TODO don't load 2 times
		  
		  
			<cpp>
				if(_sPath.GnSize() > 0){
					doc->LoadFile( (const char*)_sPath.fToCStr().get());
				}else{
					doc->LoadFile( (const char*)_sPath.fToCStr().get());
				}

				if (doc->Error()) {
					sError = gzStrC(doc->ErrorName());
					const char* _sError1 = doc->GetErrorStr1();
					if(_sError1){
						sError +=  gzU8(" : ") + gzStrC(_sError1);
					}
					const char* _sError2 = doc->GetErrorStr2();
					if(_sError2){
						sError +=  gzU8(" : ") + gzStrC(_sError2);
					}
					
					</cpp>
						Debug.fError("Xml Error");
						return false;
					<cpp>
					
					//GZ::Sys::Debug::Get(thread)->fError(sError);
					//return false;
				}
				bLoaded = true;
				//GZ::Sys::Debug::Get(thread)->fTrace1(gzStrL("Success"));
				///return true;
							
			</cpp>
			
			Debug.fPass("Xml Success");
			return true;
		}
		
		
	}
	
	
	//TODO destructor
	/*
	cXml::~cXml(){
		delete doc;
	}
	*/
	
	
}
