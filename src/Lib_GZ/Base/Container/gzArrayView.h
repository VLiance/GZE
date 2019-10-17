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


#define GZ_EaseStride(_T) sizeof(gzEase<_T>)/ sizeof(_T)



template <class SubT> 
class gzArrayView {
	public:
		gzDataRC* oData; //Must be compatible with gzVecSized & gzMatrixSized
		gzUIntX nOffset;
		gzUIntX nSize;
		gzUInt16 nStride;
		gzUInt8 nDim;
		
		
		inline gzArrayView(): oData(0), nOffset(0), nSize(0), nStride(0), nDim(0)   {
		}
		inline gzArrayView(const gzArrayView<SubT>& _o)						 : oData(_o.oData), 		   nOffset(_o.nOffset), nSize(_o.nSize),     nStride(_o.nStride), 		   nDim(_o.nDim)  {
		}
		
		inline gzArrayView(const gzVecSized<SubT>& _oVec)							 : oData((gzDataRC* )&_oVec),  nOffset(0), 		    nSize(_oVec.nSize),  nStride(0), 		 		   nDim(1) {}
		inline gzArrayView(const gzVecSized<gzEase<SubT>>& _oVec)					 : oData((gzDataRC* )&_oVec),  nOffset(0), 		    nSize(_oVec.nSize),  nStride(GZ_EaseStride(SubT)), nDim(1) {}
		
		inline gzArrayView(gzDataRC* _oData, gzUIntX  _nOffset = 0, gzUIntX _nStride = 0): oData(_oData) , nOffset(_nOffset),   nSize(_oData->nSize), nStride(_nStride),  		   nDim(1) {}
		
		
		 gzUIntX GnSize() const {
			 return nSize;
		}

		//READING :: return RVO
		inline SubT operator()(gzUIntX _nIndex) const { 
			return	((SubT*)oData->aTab)[(nOffset + _nIndex) * nStride]; //Todo not for basic type 
		}
			
		
		//WRITING 
		inline SubT&  operator[](gzUIntX _nIndex) const {
			return  ((SubT*)oData->aTab)[ (nOffset + _nIndex) * nStride];
		}
		
		//inline gzArrayView<T, SubT, TDim> operator=(const gzArrayView<SubT>&  _aOther)  const {GzVector::fTabAssign(gzContTab(oData->aTab),oData->aSize[0], _aOther.oData->aTab, _aOther.oData->aTab->aSize[0]);return *this;}
	
		
		
		
};


#endif
