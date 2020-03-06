//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef tHDef_GZ_Lib
#define tHDef_GZ_Lib

#include "Lib_GZ/Base/SmartPtr/gzSp.h"
#include "Lib_GZ/Base/Thread/Thread.h"


namespace Lib_GZ{

	namespace Global {
		extern gzInt nNumWindows;
		
	}

	//GzExport void* Lib_GZ_fAllClass(uOverplace*);

	namespace Lib {

		extern gzPtrFuncRBoolPAny fAllClass;
		extern gzPtrFuncRPAny fRegisterLib;
		
		extern  gzInt32 nThreadCount; //Atomic

		
		extern void fLoadAllLib();
		extern void fLoadLib( Lib_GZ::uLib* _oLib);
		extern void fIniClassLib(Lib_GZ::uLib* _rLib);

		//extern void fAllClass(uOverplace* _rLastClass);
		extern void fIniAllClass(uOverplace* _rLastClass);

		extern void fDoOverPlace(uOverplace* _rClass);
	 
	}
}

#endif

