//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef tHDef_GZ_Overplace
#define tHDef_GZ_Overplace

#include "Lib_GZ/Base/GzTypes.h"
#include "Lib_GZ/Base/Container/String/gzString.h"
//#include "Lib_GZ/StThread.h"
//#include "Lib_GZ/Base/gzString.h"



extern "C" {
	GzExport void* Lib_GZ_fRegisterLib(void* _rLib);
}

namespace Lib_GZ{
	struct uLib;
	namespace Lib{
		extern gzUInt nClass;  extern  uLib* rLastLib; //Global var Avoided?
		extern gzPtrFuncRPAny fRegisterLib;
	}


//TODO Atomic vars for thread safety --> keep sName?
    struct uOverplace {uOverplace* rPrec; gzUInt nId; gzPtrFuncRPAny cfOri; gzPtrFuncRPAny cfOver; gzPtrFunc cfIniClass;  gzPtrFuncRAny cfExtAdr; gzDataRC* sName;};
    //struct uOverplace {uOverplace* rPrec; gzUInt nId; gzPtrFuncRPAny cfOri; gzPtrFuncRPAny cfOver; gzPtrFuncRPAny cfExt;  gzPtrFuncRAny cfExtAdr; gzStr8 sName;};
	
	
    //struct uOverplace {uOverplace* rPrec; gzUInt nId; gzPtrFuncRPAny cfOri; gzPtrFuncRPAny cfOver; gzPtrFuncRPAny cfExt;  gzPtrFuncRAny cfExtAdr;};
  //  struct uLib { uLib* rPrec; const char* sName; uOverplace** _rLastClass; gzPtrFuncRInt dIni; };
    struct uLib { Lib_GZ::uLib* rPrec; gzDataRC* sName; uOverplace** _rLastClass; gzPtrFuncRAny dIni; };
    extern uLib zpLib;
	

    inline  uLib* fSetLib(uLib* _rLib){
      // return ( uLib*)Lib_GZ_fRegisterLib(_rLib);
       return ( uLib*)Lib_GZ::Lib::fRegisterLib(_rLib);
	   
    }
}



#endif


