//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Vector)
#define tHDef_Lib_GZ_Vector

#include "GzTypes.h"
#include "GzBaseFunc.h"
#include "GzMem.h"


#define GZ_TabSize  (sizeof(aTab)/sizeof(gzFloat))


typedef struct gzVecSized {
	gzFloat* aTab;
	gzUIntX nSize;
	/*
	inline gzVecSized operator+(const gzVecSized&  _vVec) {
printf("\nAdd");
		
		
		Pragma_Unroll_8
		for(gzUInt i = 0; i < gzMin( nSize, _vVec.nSize); i++){
			aTab[i] += _vVec.aTab[i];
		}
		return *this;
	}*/
}gzVecSized;



namespace GzVector{

	inline void fTabAssign(gzFloat* _aTab, const gzUIntX _nSize,  const gzVecSized&  _vVec){
		Pragma_Unroll_8
		for(gzUInt i = 0; i < gzMin( _nSize, _vVec.nSize); i++){
			_aTab[i] = _vVec.aTab[i];
		}
		
		Pragma_Unroll_8
		for(gzUInt i = gzMin( _nSize, _vVec.nSize); i < _nSize; i++){
			_aTab[i] = 0;
		}
	}
	inline void fTabAdd(gzFloat* _aNew, const gzFloat* _aTab, const gzUIntX _nSize,  const gzFloat* _aOtherTab, const gzUIntX _nOtherSize ){

		gzUInt i;
		Pragma_Unroll_16
		for( i = 0; i < gzMin( _nSize, _nOtherSize); i++){
			_aNew[i] = _aTab[i] + _aOtherTab[i];
		}
		//Keep old values
		Pragma_Unroll_16
		for(; i < _nSize; i++){
			_aNew[i] = _aTab[i];
		}
	}
	inline void fPrint( gzFloat* _aTab , const gzUIntX _nSize) {
		printf("{");
		gzUInt i = 0;
		Pragma_Unroll_8
		for(i = 0; i <  _nSize - 1; i++){
				printf("%.2f, ",_aTab[i]);
		}
		printf("%.2f",_aTab[i]); 
		printf("}");
		
	}
}

#define gzDef_Vec(_Name, _nSize) gzDef_Vec_(_##_Name,_nSize)

#define gzContFloat(a)  const_cast<gzFloat*>(a)
#define gzDef_VecNum( _nSize) gzDef_Vec_(_nSize,_nSize)

#define gzDef_Vec_(_Name, _nSize) \
typedef struct gzVec##_Name {  \
union{\
	gzFloat aTab[_nSize];\
	struct { gzFloat x, y, z, w;};\
	struct { gzFloat r, g, b, a; };\
	struct { gzFloat s, t, p, q; };\
};\
	inline gzUIntX fSize() const {return _nSize;}\
	inline gzFloat& operator[](gzUIntX _nIndex) const {return  gzContFloat(aTab)[_nIndex];}\
	inline gzFloat& operator()(gzUIntX _nIndex) const {return  gzContFloat(aTab)[_nIndex];}\
	inline gzVec##_Name operator=(const gzVecSized&  _vVec)  const {GzVector::fTabAssign(gzContFloat(aTab),GZ_TabSize, _vVec);return *this;}\
	inline gzVecSized get() const {gzVecSized _v = {gzContFloat(aTab),(sizeof(aTab)/sizeof(gzFloat))};return _v;}\
	inline gzVec##_Name operator+(const gzVecSized&   _vVec) const {gzVec##_Name _vNew = {0};GzVector::fTabAdd(_vNew.aTab,aTab,_nSize,_vVec.aTab,_vVec.nSize);return _vNew;}\
	inline gzVec##_Name operator+(const gzVec##_Name _vVec)  const {gzVec##_Name _vNew;GzVector::fTabAdd(_vNew.aTab,aTab,_nSize,_vVec.aTab,     _nSize);return _vNew;}\
	inline void  fPrint() const {GzVector::fPrint(gzContFloat(aTab), GZ_TabSize );}\
	\
\
} gzVec##_Name;\
inline gzVec##_Name gzVec##_Name##_Copy(const gzVecSized&  _vVec){gzVec##_Name _vNew; GzVector::fTabAssign(_vNew.aTab,_nSize, _vVec);return _vNew;} \
typedef const gzVec##_Name&  _gzVec##_Name


gzDef_VecNum(2);
gzDef_VecNum(3); 
gzDef_VecNum(4);
gzDef_VecNum(5);
gzDef_VecNum(6);
gzDef_VecNum(7);
gzDef_VecNum(8);
gzDef_VecNum(9);
gzDef_VecNum(10);
gzDef_VecNum(11);
gzDef_VecNum(12);
gzDef_VecNum(13);
gzDef_VecNum(14);
gzDef_VecNum(15);
gzDef_VecNum(16);
	
	
#endif
