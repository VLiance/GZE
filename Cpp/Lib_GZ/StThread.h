﻿//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace Lib_GZ{class cStThread;}

#if !( defined tHDef_GZ_StThread )
#define tHDef_GZ_StThread

//#include "Lib_GZ/Delegate.h"
#include "Lib_GZ/Class.h"

namespace Lib_GZ{namespace StThread{

	//Structure Definition

}}


namespace Lib_GZ{
namespace StThread{

}

class cStThread : public ::Lib_GZ::cClass  {  //Extend cClass!?

	public:
		inline cStThread(cClass* _parent): cClass(_parent){};
		virtual ~cStThread(){};

	private:

};



}

#endif
