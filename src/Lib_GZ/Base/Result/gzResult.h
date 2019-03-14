//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_GZ_Result)
#define tHDef_GZ_Result

#include "Lib_GZ/Base/GzTypes.h"
#include "Lib_GZ/Base/Result/Result_Int.h"

//namespace Lib_GZ{namespace Base{namespace Result{class cResult_Int;}}}

typedef  Lib_GZ::Base::Result::cResult_Int gzResult_Int; 
/*
struct gzResults : gzAny{
	gzBool bValid;
	inline gzResults(gzBool _bValid):bValid(_bValid){};
};

struct  gzResults_UInt :  gzResults{
	gzUInt nVal;
	inline gzResults_UInt():gzResults(false), nVal(0) {};
	inline gzResults_UInt(gzUInt _nVal):gzResults(true), nVal(_nVal) {};
	inline operator gzInt(){
      return nVal;
   }
};*/






#endif
