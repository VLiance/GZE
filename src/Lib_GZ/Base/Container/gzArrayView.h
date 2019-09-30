//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#if !( defined tHDef_Lib_GZ_ArrayView)
#define tHDef_Lib_GZ_ArrayView

#include "Lib_GZ/Base/Container/DataRC.h"
#include "Lib_GZ/Base/Container/Vector/gzVector.h"
#include "Lib_GZ/Base/GzTypes.h"
#include "Lib_GZ/Base/GzBaseFunc.h"
#include "Lib_GZ/Base/GzMem.h"

//#define GZ_TabSize(_aTab)  (sizeof(_aTab)/sizeof(T))




template <class T, class SubT = T, gzUInt TDim = 1> 
class gzArrayView {
	public:
		gzDataRC* oData; //Must be compatible with gzVecSized & gzMatrixSized
		gzUIntX aSize[TDim];
		
		inline gzArrayView(): aSize({0}), oData(0) {
		}
		
		inline gzArrayView(gzVecSized<T> _oVec) : aSize({0}), oData((gzDataRC* )&_oVec) {
			aSize[0] = _oVec.nSize;
		}
		
};


#endif
