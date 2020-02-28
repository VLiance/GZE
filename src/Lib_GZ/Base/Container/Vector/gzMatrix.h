//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



#if !( defined tHDef_Lib_GZ_Matrix)
#define tHDef_Lib_GZ_Matrix



//#define GZ_TabSize  (sizeof(aTab)/sizeof(T))


namespace GzMatrix{

	template<class T> inline void fTabAssign(T* _aTab, const gzUIntX _nSizeX, const gzUIntX _nSizeY,  const gzMatrixSized<T>&  _mMat){
		gzUIntX _nSize  = _nSizeX * _nSizeY;
		gzUIntX _nMatSize  = _mMat.nSizeX * _mMat.nSizeY;
			
		Pragma_Unroll_16
		for(gzUInt i = 0; i < gzMin( _nSize, _nMatSize); i++){
			_aTab[i] = _mMat.aTab[i];
		}
		
		Pragma_Unroll_16
		for(gzUInt i = gzMin( _nSize, _nMatSize); i < _nSize; i++){
			_aTab[i] = 0;
		}
	}
	
	/*
	inline void fTabAdd(gzFloat* _aNew, const gzFloat* _aTab, const gzUIntX _nSizeX, const gzUIntX _nSizeY,  const gzFloat* _aOtherTab, const gzUIntX _nOtherSizeX, const gzUIntX _nOtherSizeY ){
		Pragma_Unroll_16
		for(gzUInt i = 0; i < gzMin( _nSize, _nOtherSize); i++){
			_aNew[i] = _aTab[i] + _aOtherTab[i];
		}
	}*/
	
	
#define gzDef_Mat_Func_fPrint(T)\
	inline void fPrint( T* _aTab , const gzUIntX _nSizeX, const gzUIntX _nSizeY) { \
		for(int y = 0; y <  _nSizeY; y++){\
			GZ_printf("\n|");GzVector::fPrint(&_aTab[y], _nSizeX);GZ_printf("|");\
		}\
		GZ_printf("\n");\
	}

gzDef_Mat_Func_fPrint(gzFloat32);
gzDef_Mat_Func_fPrint(gzFloat64);

gzDef_Mat_Func_fPrint(gzInt8);
gzDef_Mat_Func_fPrint(gzInt16);
gzDef_Mat_Func_fPrint(gzInt32);
gzDef_Mat_Func_fPrint(gzInt64);

gzDef_Mat_Func_fPrint(gzUInt8);
gzDef_Mat_Func_fPrint(gzUInt16);
gzDef_Mat_Func_fPrint(gzUInt32);
gzDef_Mat_Func_fPrint(gzUInt64);

	
	/*
	template<class T>  inline void fPrint( T* _aTab , const gzUIntX _nSizeX, const gzUIntX _nSizeY) {
		GZ_printf("\n{");
		for(int y = 0; y <  _nSizeY; y++){
			if(y != 0){
				GZ_printf("\n ");
			}
			GZ_printf("{");
			
			gzUInt x = 0;
			Pragma_Unroll_16
			for(x = 0; x <  _nSizeX - 1; x++){
					GZ_printf("%.2f, ",_aTab[y *_nSizeX  + x]);
			}
			GZ_printf("%.2f",_aTab[y *_nSizeX  + x]); 
			GZ_printf("}");
		}
		
		GZ_printf("}");
	}
	*/
	
}


#define gzDef_MatrixNum( _nSizeX, _nSizeY) gzDef_Matrix(_nSizeX##x##_nSizeY,_nSizeX, _nSizeY)

#define gzDef_Matrix(_Name, _nSizeX, _nSizeY) \
template <class T> \
struct gzMat##_Name {  \
union{\
		T aTab[ _nSizeX * _nSizeY ];\
};\
	inline gzUIntX fSize() const {return _nSizeX * _nSizeY;}\
	inline T& operator[](gzUIntX _nIndex) const {return  gzContTab(aTab)[_nIndex];}\
	inline gzMat##_Name operator=(const gzMatrixSized<T>&  _mMat)  const {GzMatrix::fTabAssign(gzContTab(aTab), _nSizeX, _nSizeY, _mMat);return *this;}\
	inline gzMatrixSized<T>      get() const {gzMatrixSized<T> _v = {gzContTab(aTab),_nSizeX,_nSizeY  };return _v;}\
	inline operator gzMatrixSized<T>() const {gzMatrixSized<T> _v = {gzContTab(aTab),_nSizeX,_nSizeY  };return _v;}\
	inline operator gzVecSized<T>() 	const {gzVecSized<T>    _v = {gzContTab(aTab),_nSizeX * _nSizeY };return _v;}\
	inline gzMat##_Name operator+(const gzMatrixSized<T>&   _mMat) const {gzMat##_Name _vNew;GzVector::fTabAddStride(_vNew.aTab,aTab,_nSizeX*_nSizeY,_mMat.aTab,_mMat.nSizeX*_mMat.nSizeY, _nSizeX, _mMat.nSizeX );return _vNew;}\
	inline gzMat##_Name operator+(const gzMat##_Name _mMat)        const {gzMat##_Name _vNew;GzVector::fTabAdd(_vNew.aTab,aTab,_nSizeX*_nSizeY,_mMat.aTab,      _nSizeX*    _nSizeY );return _vNew;}\
	inline void  fPrint() const {GzMatrix::fPrint(gzContTab(aTab), _nSizeX, _nSizeY );}\
	inline gzMat##_Name&  fAssertUpcast(gzUIntX _nSizeOf) { GzAssert(_nSizeOf <=  sizeof(aTab), "Upcast Invalid"); return *this;}	\
};\
  template<class T> inline gzMat##_Name<T> gzMat##_Name##_NewFrom(const gzMatrixSized<T>&  _mMat){gzMat##_Name<T> _vNew; GzMatrix::fTabAssign(_vNew.aTab,_nSizeX,_nSizeY, _mMat);return _vNew;} \



gzDef_MatrixNum(2,2);
gzDef_MatrixNum(3,2);
gzDef_MatrixNum(4,2);

gzDef_MatrixNum(2,3);
gzDef_MatrixNum(3,3);
gzDef_MatrixNum(4,3);

gzDef_MatrixNum(2,4);
gzDef_MatrixNum(3,4);
gzDef_MatrixNum(4,4);

	
#endif
