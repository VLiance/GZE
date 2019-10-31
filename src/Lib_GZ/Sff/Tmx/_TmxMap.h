//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace GZ{class cTmxMap;}
#ifndef DEF_HH_GZ_TmxMap
#define DEF_HH_GZ_TmxMap
#include "Lib_GZ/GzTypes.h"
namespace GZ{namespace Sff{namespace Tmx{

namespace TmxMap{


	//Enum
	struct eOrientation{
		enum Type {
			Orthogonal = 0,
			Isometric = 1,
			Staggered = 2,
			Hexagonal = 3
		};
		Type t_;inline eOrientation(Type t) : t_(t) {}operator Type () const {return t_;}
		inline eOrientation();
	};
	struct eRenderOrder{
		enum Type {
			RightUp = 0,
			RightDown = 1,
			LeftUp = 2,
			LeftDown = 3
		};
		Type t_;inline eRenderOrder(Type t) : t_(t) {}operator Type () const {return t_;}
		inline eRenderOrder();
	};
	struct eStaggerAxis{
		enum Type {
			X = 0,
			Y = 1
		};
		Type t_;inline eStaggerAxis(Type t) : t_(t) {}operator Type () const {return t_;}
		inline eStaggerAxis();
	};
	struct eStaggerIndex{
		enum Type {
			Even = 0,
			Odd = 1
		};
		Type t_;inline eStaggerIndex(Type t) : t_(t) {}operator Type () const {return t_;}
		inline eStaggerIndex();
	};
}
}}}
#endif
