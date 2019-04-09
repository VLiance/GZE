//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Vector)
#define tHDef_Lib_GZ_Vector

#include "Lib_GZ/Base/Easing/gzEase.h"
#include "Lib_GZ/Base/GzTypes.h"
#include "Lib_GZ/Base/GzBaseFunc.h"
#include "Lib_GZ/Base/GzMem.h"


#define GZ_TabSize(_aTab)  (sizeof(_aTab)/sizeof(T))

template <class T> 
struct gzVecSized {
	T* aTab;
	gzUIntX nSize;

};

template <class T> 
struct gzMatrixSized {
	T* aTab;
	gzUIntX nSizeX;
	gzUIntX nSizeY;

};

enum GZ_EuOpp { Plus, Minus, Mul, Div };

namespace GzVector{


	template<class T> inline T fOperator(const T& _oLeft,const T& _oRight, GZ_EuOpp _eOpp ){ 
		switch(_eOpp){
			case Plus:
				return _oLeft + _oRight;
			break;
			case Minus:
				return _oLeft - _oRight;
			break;
			case Mul:
				return _oLeft * _oRight;
			break;
			case Div:
				return _oLeft / _oRight;
			break;
		}
		//return _oLeft + _oRight;
	}

	template<class T> inline void fIntAssign(T* _aTab, const gzUIntX _nSize,  const int  _nVal){
		Pragma_Unroll_8
		for(gzUInt i = 0; i <  _nSize; i++){
			_aTab[i] = _nVal;
		}
	}
	template<class T, class OtherT=T> inline void fTabAssign(T* _aTab, const gzUIntX _nSize,  const gzVecSized<OtherT>&  _vVec){
		Pragma_Unroll_8
		for(gzUInt i = 0; i < gzMin( _nSize, _vVec.nSize); i++){
			_aTab[i] = (T)_vVec.aTab[i];
		}
		
		Pragma_Unroll_8
		for(gzUInt i = gzMin( _nSize, _vVec.nSize); i < _nSize; i++){
			_aTab[i] = 0;
		}
	}
	template<class T> inline void fTabAddStride(T* _aNew, const T* _aTab, const gzUIntX _nSize,  const T* _aOtherTab, const gzUIntX _nOtherSize, const gzUIntX _nStride = 1, const gzUIntX _nOtherStride = 1){

		//Keep old values
		Pragma_Unroll_16
		for(gzUInt i = 0; i < _nSize; i++){
			_aNew[i] = _aTab[i];
		}

		gzUInt y2 = 0;
		Pragma_Unroll_16
		for(gzUInt y = 0; y <  gzMin( _nSize, (_nOtherSize/_nOtherStride)*_nStride); y+=_nStride){
			Pragma_Unroll_16
			for(gzUInt x = 0; x < gzMin(_nStride, _nOtherStride) ; x++){
				_aNew[y + x] = _aTab[y + x] + _aOtherTab[y2 + x];
			}
			y2+= _nOtherStride;
		}
	}
	template<class T, class SubT = T> inline void fTabAdd(T* _aNew, const T* _aTab, const gzUIntX _nSize,  const SubT* _aOtherTab, const gzUIntX _nOtherSize, GZ_EuOpp _eOpp){ //SameSize?

		gzUInt i;
		Pragma_Unroll_16
		for( i = 0; i < gzMin( _nSize, _nOtherSize); i++){
			//_aNew[i] = _aTab[i] + _aOtherTab[i];
			_aNew[i] = fOperator((SubT)_aTab[i],_aOtherTab[i], _eOpp);
		}
		
		//Keep old values  //SameSize?
		Pragma_Unroll_16
		for(; i < _nSize; i++){
			_aNew[i] = _aTab[i];
		}
	}
	
	
#define gzDef_Vec_Func_fPrint(T, _sStr)\
	inline void fPrint( T* _aTab , const gzUIntX _nSize) { \
		printf("{");gzUInt i = 0;\
		Pragma_Unroll_8 \
		for(i = 0; i <  _nSize - 1; i++){\
			printf(_sStr ", ",_aTab[i]);\
		}\
		printf(_sStr,_aTab[i]); \
		printf("}");\
	}
	
gzDef_Vec_Func_fPrint(gzFloat32, "%.2f");
gzDef_Vec_Func_fPrint(gzFloat64, "%.2f");

gzDef_Vec_Func_fPrint(gzInt8, "%d");
gzDef_Vec_Func_fPrint(gzInt16, "%d");
gzDef_Vec_Func_fPrint(gzInt32, "%d");
gzDef_Vec_Func_fPrint(gzInt64, "%lld");

gzDef_Vec_Func_fPrint(gzUInt8, "%u");
gzDef_Vec_Func_fPrint(gzUInt16, "%u");
gzDef_Vec_Func_fPrint(gzUInt32, "%u");
gzDef_Vec_Func_fPrint(gzUInt64, "%llu");



	
	/*
	inline void fPrint( gzInt8* _aTab , const gzUIntX _nSize) {
		printf("{");
		gzUInt i = 0;
		Pragma_Unroll_8
		for(i = 0; i <  _nSize - 1; i++){
				printf("%d, ",_aTab[i]);
		}
		printf("%d",_aTab[i]); 
		printf("}");
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
	*/

	
	
}

#define gzDef_Vec_Func_EaseConv(_Name, _nSize)\
	//inline operator gzVecEase##_Name<T> () const { gzVecEase##_Name<T> _vNew; GzVector::fTabAssign<T, gzEase<T>>(_vNew.aTab,_nSize, *this); return _vNew;};

#define gzDef_Vec_Func_Ease(_Name, _nSize, _SubName)\
	inline void fStep() const {	for(gzUInt8 i = 0; i < (_nSize-1); i++){aTab[i].fStep(vSpeed.nVal,vSpeed.nTo); } }; /* -1 --> Remove vSpeed value from stepping itself */ \
	inline void fStep(T _nSpeed, T _nLimit) const {	for(gzUInt8 i = 0; i < (_nSize-1); i++){aTab[i].fStep(_nSpeed,_nLimit); } }; /* -1 --> Remove vSpeed value from stepping itself */ \
	inline void fSetSpeed(T _nSpeed) const {vSpeed.nVal = _nSpeed; }; \
	inline void fSetLimit(T _nLimit) const {vSpeed.nTo = _nLimit; }; \
	inline operator gzVec##_SubName<SubT> () const { gzVec##_SubName<SubT> _vNew; GzVector::fTabAssign<SubT, T>(_vNew.aTab,_nSize, *this); return _vNew;};\
	inline gzVec##_Name operator*(const gzVecSized<T>&   _vVec) const {gzDef_Operate(_Name, _nSize, _vVec.nSize, GZ_EuOpp::Mul)}; \
	//inline operator gzVecSized<SubT> () const {      gzVec##_SubName<SubT> _vNew; GzVector::fTabAssign<SubT, T>(_vNew.aTab,_nSize, *this); gzVecSized<SubT> _v = {(_vNew.aTab),(sizeof(_vNew.aTab)/sizeof(SubT))};return _v;}; \
	//inline gzVec##_SubName<SubT>  fToSubType() {gzVec##_SubName<SubT> _vNew; GzVector::fTabAssign<SubT, T>(_vNew.aTab,_nSize, *this);return _vNew;};


#define gzDef_Operate(_Name, _nSize, _nOtherSize, _Op) gzVec##_Name _vNew = {0};GzVector::fTabAdd(_vNew.aTab,aTab,_nSize,_vVec.aTab, _nOtherSize,_Op);return _vNew;

//inline gzVec##_Name operator=(const gzVecSized&  _vVec)  const {GzVector::fTabAssign(gzContTab(aTab),GZ_TabSize, _vVec);return *this;}\
//inline gzVec##_Name operator=(int  _nTest)  const {GzVector::fIntAssign(gzContTab(aTab),GZ_TabSize, 0);return *this;}\
	//inline ~gzVec##_Name(){};\ //Not pod 	
#define gzDef_Vec_Func(_Name, _nSize) \
	inline gzUIntX fSize() const {return _nSize;}\
	inline T& operator[](gzUIntX _nIndex) const {return  gzContTab(aTab)[_nIndex];}\
	inline T& operator()(gzUIntX _nIndex) const {return  gzContTab(aTab)[_nIndex];}\
	inline gzVecSized<T> 	   get() const {gzVecSized<T> _v = {gzContTab(aTab),(sizeof(aTab)/sizeof(T))};return _v;}\
	inline operator  gzMatrixSized<T>()const {gzMatrixSized<T> _v = {gzContTab(aTab),(sizeof(aTab)/sizeof(T)),1};return _v;}\
	inline operator  gzVecSized<T>()const {gzVecSized<T> _v = {gzContTab(aTab),(sizeof(aTab)/sizeof(T))};return _v;}\
	inline gzVec##_Name operator+(const gzVecSized<SubT>&   _vVec)  const {gzDef_Operate(_Name, _nSize, _vVec.nSize, GZ_EuOpp::Plus)}\
	inline gzVec##_Name operator-(const gzVecSized<SubT>&   _vVec)  const {gzDef_Operate(_Name, _nSize, _vVec.nSize, GZ_EuOpp::Minus)}\
	inline gzVec##_Name operator*(const gzVecSized<SubT>&   _vVec)  const {gzDef_Operate(_Name, _nSize, _vVec.nSize, GZ_EuOpp::Mul)}\
	inline gzVec##_Name operator/(const gzVecSized<SubT>&   _vVec)  const {gzDef_Operate(_Name, _nSize, _vVec.nSize, GZ_EuOpp::Div)}\
	inline gzVec##_Name operator+(const gzVec##_Name<SubT>& _vVec)  const {gzDef_Operate(_Name, _nSize, GZ_TabSize(_vVec.aTab), GZ_EuOpp::Plus)}\
	inline gzVec##_Name operator-(const gzVec##_Name<SubT>& _vVec)  const {gzDef_Operate(_Name, _nSize, GZ_TabSize(_vVec.aTab), GZ_EuOpp::Minus)}\
	inline gzVec##_Name operator*(const gzVec##_Name<SubT>& _vVec)  const {gzDef_Operate(_Name, _nSize, GZ_TabSize(_vVec.aTab), GZ_EuOpp::Mul)}\
	inline gzVec##_Name operator/(const gzVec##_Name<SubT>& _vVec)  const {gzDef_Operate(_Name, _nSize, GZ_TabSize(_vVec.aTab), GZ_EuOpp::Div)}\
	inline void  fPrint() const {GzVector::fPrint(gzContTab(aTab), GZ_TabSize(aTab) );}\
	inline gzVec##_Name&  fAssertUpcast(gzUIntX _nSizeOf) { GzAssert(_nSizeOf <=  sizeof(aTab), "Upcast Invalid"); return *this;}\
	//inline T& operator= (const T &_val) {
//inline gzVec##_Name operator+(const gzVec##_Name  _vVec)    const {gzVec##_Name _vNew;      GzVector::fTabAdd(_vNew.aTab,aTab,_nSize,_vVec.aTab,     _nSize);return _vNew;}\
//	inline gzVec##_Name<T>  fCopy() const {gzVec##_Name<T> _vNew; GzVector::fTabAssign(_vNew.aTab,_nSize, get());return _vNew;}
//	inline gzVec##_Name<T>  fDownCast(_nSize) const {gzVec##_Name<T> _vNew; GzVector::fTabAssign(_vNew.aTab,_nSize, get());return _vNew;}
	//inline gzVec##_Name&  fAssertSize(gzUIntX _nSize) { printf("\n SIZE: %d ", _nSize); return *this;}	
	
#define gzDef_Vec_Other(_Name, _nSize) \
	template<class T> inline gzVec##_Name<T> gzVec##_Name##_NewFrom(const gzVecSized<T>&  _vVec){gzVec##_Name<T> _vNew; GzVector::fTabAssign(_vNew.aTab,_nSize, _vVec);return _vNew;}

#ifdef GZ_tDebug	
	#define GZ_VecUpCast(T, Var) (((T&)Var.fAssertUpcast( sizeof(T)) ))
#else
	#define GZ_VecUpCast(T, Var) ((T&)Var)
#endif
	
#define gzDef_Vec(_Name, _nSize) gzDef_Vec_(_##_Name,_nSize)

#define gzContTab(a)  const_cast<T*>(a)
#define gzDef_VecNum( _nSize) gzDef_Vec_(_nSize,_nSize)

#define gzDef_Vec_(_Name, _nSize) \
template <class T, class SubT = T> \
struct gzVec##_Name {  \
union{\
	T aTab[_nSize];\
	struct { T x, y, z, w;};\
	struct { T r, g, b, a; };\
	struct { T s, t, p, q; };\
};\
	gzDef_Vec_Func(_Name, _nSize) \
};\
gzDef_Vec_Other(_Name, _nSize);

#define gzDef_Vec_2(_Name, _nSize) \
template <class T, class SubT = T> \
struct gzVec##_Name {  \
union{\
	T aTab[_nSize];\
	struct { T x, y; };\
	struct { T r, g; };\
	struct { T s, t; };\
};\
	gzDef_Vec_Func(_Name, _nSize) \
};\
gzDef_Vec_Other(_Name, _nSize);

#define gzDef_Vec_3(_Name, _nSize) \
template <class T, class SubT = T> \
struct gzVec##_Name {  \
union{\
	T aTab[_nSize];\
	struct { T x, y, z; };\
	struct { T r, g, b; };\
	struct { T s, t, p; };\
};\
	gzDef_Vec_Func(_Name, _nSize) \
};\
gzDef_Vec_Other(_Name, _nSize);


#define _gzVec2(T) const gzVec2<T>&
#define _gzVec3(T) const gzVec3<T>&
#define _gzVec4(T) const gzVec4<T>&

gzDef_Vec_2(2,2);
gzDef_Vec_3(3,3); 
gzDef_VecNum(4);
/*
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
*/
	
#endif
