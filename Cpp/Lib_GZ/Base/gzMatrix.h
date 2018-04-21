//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Matrix)
#define tHDef_Lib_GZ_Matrix



#define GZ_TabSize  (sizeof(aTab)/sizeof(gzFloat))

	

typedef struct gzMatrixSized {
	gzFloat* aTab;
	gzUIntX nSizeX;
	gzUIntX nSizeY;
	/*
	inline gzMatrixSized operator+(const gzMatrixSized&  _mMat) {
printf("\nAdd");

		Pragma_Unroll_16
		for(gzUInt i = 0; i < gzMin( nSize, _mMat.nSize); i++){
			aTab[i] += _mMat.aTab[i];
		}
		return *this;
	}*/
}gzMatrixSized;



namespace GzMatrix{

	inline void fTabAssign(gzFloat* _aTab, const gzUIntX _nSizeX, const gzUIntX _nSizeY,  const gzMatrixSized&  _mMat){
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
	inline void fPrint( gzFloat* _aTab , const gzUIntX _nSizeX, const gzUIntX _nSizeY) {
		printf("\n{");
		for(int y = 0; y <  _nSizeY; y++){
			if(y != 0){
				printf("\n ");
			}
			printf("{");
			
			gzUInt x = 0;
			Pragma_Unroll_16
			for(x = 0; x <  _nSizeX - 1; x++){
					printf("%.2f, ",_aTab[y *_nSizeX  + x]);
			}
			printf("%.2f",_aTab[y *_nSizeX  + x]); 
			printf("}");
		}
		
		printf("}");
		
		
	}
}


#define gzDef_MatrixNum( _nSizeX, _nSizeY) gzDef_Matrix(_nSizeX##x##_nSizeY,_nSizeX, _nSizeY)

#define gzDef_Matrix(_Name, _nSizeX, _nSizeY) \
typedef struct gzMat##_Name {  \
union{\
		gzFloat aTab[ _nSizeX * _nSizeY ];\
		struct { gzFloat x, y, z, w;};\
		struct { gzFloat r, g, b, a; };\
		struct { gzFloat s, t, p, q; };\
};\
	inline gzUIntX fSize() const {return _nSizeX * _nSizeY;}\
	inline gzFloat& operator[](gzUIntX _nIndex) const {return  gzContFloat(aTab)[_nIndex];}\
	inline gzMat##_Name operator=(const gzMatrixSized&  _mMat)  const {GzMatrix::fTabAssign(gzContFloat(aTab), _nSizeX, _nSizeY, _mMat);return *this;}\
	inline gzMatrixSized get() const {gzMatrixSized _v = {gzContFloat(aTab),_nSizeX,_nSizeY  };return _v;}\
	inline gzMat##_Name operator+(const gzMatrixSized&   _mMat) const {gzMat##_Name _vNew = {0};GzVector::fTabAdd(_vNew.aTab,aTab,_nSizeX*_nSizeY,_mMat.aTab,_mMat.nSizeX*_mMat.nSizeY );return _vNew;}\
	inline gzMat##_Name operator+(const gzMat##_Name _mMat)  const {gzMat##_Name _vNew;GzVector::fTabAdd(_vNew.aTab,aTab,_nSizeX*_nSizeY,_mMat.aTab,      _nSizeX*    _nSizeY );return _vNew;}\
	inline void  fPrint() const {GzMatrix::fPrint(gzContFloat(aTab), _nSizeX, _nSizeY );}\
} gzMat##_Name;\
inline gzMat##_Name gzMat##_Name##_Copy(const gzMatrixSized&  _mMat){gzMat##_Name _vNew; GzMatrix::fTabAssign(_vNew.aTab,_nSizeX,_nSizeY, _mMat);return _vNew;} \
typedef const gzMat##_Name&  _gzMat##_Name


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
