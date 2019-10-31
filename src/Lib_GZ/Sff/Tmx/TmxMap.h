//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace GZ{class cTmxMap;}
#if !( defined tHDef_GZ_TmxMap)
#define tHDef_GZ_TmxMap
#include "Lib_GZ/GZ.h"
namespace GZ{namespace TmxMap{

//Structure Definition

}}

//Optimised Class include -> direct class or header of header (Constants)
#include "Lib_GZ/Sff/Xml/_XmlNode.h"

namespace GZ{namespace Sff{namespace Xml{class cXmlElement;class cXmlText;class cXml;}}}
#include "Lib_GZ/Sff/Tmx/_TmxMap.h"
namespace GZ{namespace Sys{class cDebug;}}

namespace GZ{namespace Sff{namespace Tmx{
class cTmx;

class cTmxMap : public GZ::cDelegate {

	public:


		//Var
		gzWp<cTmx> oTmx;
		gzUInt nWidth;
		gzUInt nHeight;
		gzUInt nTileWidth;
		gzUInt nTileHeight;
		gzUInt nBackgroundcolor;
		gzUInt nHexsideLength;
		TmxMap::eOrientation hOrientation;
		TmxMap::eRenderOrder hRenderOrder;
		TmxMap::eStaggerAxis hStaggerAxis;
		TmxMap::eStaggerIndex hStaggerIndex;
		cTmxMap();
		virtual void Ini_cTmxMap(cTmx* _opTmx);
		void fLoad(::GZ::Sff::Xml::cXmlElement* _opMapNode);
		void fExtactAllNode(::GZ::Sff::Xml::cXmlNode* _opFromNode);

		virtual ~cTmxMap();

	private:

		//Var

};
namespace TmxMap{
//Object Creation Wrapper
inline gzSp<cTmxMap> New(cTmx* _opTmx){
	gzSp<cTmxMap>_oTemp = gzSp<cTmxMap>(new cTmxMap());
	_oTemp->Ini_cTmxMap(_opTmx);
	return _oTemp;
}
}
}}}
#endif
