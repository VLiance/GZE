//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Array)
#define tHDef_Lib_GZ_Array

#include "DataRC.h"

//gzDataArrayShared

//#define gzDataObj(_aData) ((gzDataRoot){ (gzDataRC*)&_aData,0,0 })



//template <class T>
class gzArray_ {
public:
	
	gzDataRC* aData;
	gzUInt nLock;
	
	inline gzArray_(){//TODO TODO Default construction!!!!!!
		
	}
	
	#undef gzp_TestLock 
	#ifdef GZ_tDebug
		#define gzp_TestLock GzAssert(nLock == 0, "Array is locked, no modification are allowed");
	#else
		#define gzp_TestLock 
	#endif
	
	//gzUInt8* aSubTab;
	//gzUIntX nSubSize;

	#undef gzp_DataType
	#undef gzp_DataSize
	#undef gzp_DataArray
	#undef gzp_DataLimit
	#undef gzp_RIni 
	#undef gzp_RReturn 
	#undef gzp_DataTypeOnly 
	#undef gzp_Additional_fAssign
	#undef gzp_Additional_fAssign2
	#undef gzp_Additional_fAssignType
	#undef gzp_Additional_fAssignType_PTR
	#undef gzp_WRITE_OPERATION_
	#undef gzp_SearchIndex
	#undef gzp_Stride
	#undef gzp_RelSize 
	#undef gzp_RelSizeO 
	#undef gzp_nS 
	
	#define gzp_RelSize (gzp_DataSize / gzp_Stride)
	#define gzp_RelSizeO gzp_DataSize / gzp_Stride
	
	#define gzp_WRITE_OPERATION_(ex) gzp_TestLock
	#define gzp_Stride (sizeof(1))
	#define gzp_SearchIndex(ex) (ex * gzp_Stride)
	
	
	#undef gzp_Data
	#define gzp_Data aData
	
	#define gzp_nS  *_nS
	#define gzp_DataType gzArray_
	#define gzp_DataSize aData->nSize
	#define gzp_DataArray aData->aTab
	#define gzp_DataLimit  aData->nLimit
	#define gzp_DataTypeOnly(_Exp)  _Exp;
	
//	#define gzp_RIni(Exp) Exp;return *gzDtThis;
    #define gzp_RIni(Exp) gzp_DataType _oNew(gzDtThis, true);_oNew.Exp;return _oNew;
	//#define gzp_RIni(Exp)  gzp_DataType _oNew(gzDtThis);_oNew.Exp;return _oNew;	//Copy

	
	#define gzp_RReturn 
	#define gzp_Additional_fAssign gzDtThis->nLock = 0;
	#define gzp_Additional_fAssign2
	#define gzp_Additional_fAssignType
	#define gzp_Additional_fAssignType_PTR

	#undef gzp_ReturnType 
	#define gzp_ReturnType gzUInt8
	
	
	/////Clone array
	gzp_DataType(gzp_DataType* _oOther, gzBool _bClone){
		aData =  GZ::fDataCopyAlloc(_oOther->aData->aTab, _oOther->aData->nSize, _oOther->aData->nSize,  _oOther->aData->nLimit );
		aData->nInst = 1;
	}
	/////////

	inline void Delete(gzDataRC* _oRC) const {
		if(_oRC->nType == 3){ //Cond before func? Remove all sub instances & sub free
			for(gzUInt i = 0; i < _oRC->nSize; i++){
				//(Base* ) aTab[i]->Delete();
			}
		}
		
	//	printf("\Delete:");fPrint();
		//printf("\nFree:");fPrint();
		//GZ_fFree((void*)this); //Combined array
	}
	
	inline void Free(gzDataRC* _oRC) const { //Don't free if we have weak_ptr  alive
		if(_oRC->nType  > 1){ //If Not read only
			//printf("\nFree---xxxxxxxxxxxxxxxxx-:");_oRC->fPrint();
			GZ_fFree(_oRC->aTab); 	GZ_nArrayTotalFree++; //Combined array
			GZ_fFree(_oRC); 	GZ_nArrayTotalFree++; //Combined array
		}
	}

	inline void fRemoveInstance(gzDataRC* _oRC) const{
		//printf("\nSub: %d  ", _oRC->nInst);fPrint();
		_oRC->nInst--;
		if( _oRC->nInst == 0 ){//nType >= 0 Heap data -> must be freed
			Delete(_oRC);
			if(_oRC->nWeakInst == 0){
				Free(_oRC);
			}
		}
	}
	

	inline gzUInt8* fArrayNewAlloc( gzUInt _nSize) const {
		GZ_nArrayTotalAlloc++;
		return (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); 
	}	

	
	
	inline gzUInt8* fArrayAlloc( gzUInt _nSize) const {
		GZ_nArrayTotalAlloc++;
		return (gzUInt8*)GZ_fCalloc(_nSize, sizeof(gzUInt8)); 
	}	


	
	inline void fArrayRealloc( gzUInt _nSize) const { //Only new array for now
		gzUInt8* _aOldTab = aData->aTab ;
		gzUInt _nOldSize = aData->nSize;
		
		aData->aTab = fArrayAlloc(_nSize); //Reset aTab
		memcpy( aData->aTab , _aOldTab, _nOldSize );
	//	if(!_bOldReadonly){ //Old nLimit-> read only   /*// Never read Only?????
			GZ_fFree(_aOldTab);	GZ_nArrayTotalFree++;
	//	}
	}
	 
	inline void fResizeMem( gzUInt _nToSize) const {

		int _nToLimitSize = _nToSize * GZ_Array_Expand_Factor;
		//fMalloc(_nToLimitSize);
		
		/*// Never read Only?????
		if(aData->nType == 0 ){ //read only var  || new array -> Malloc 
			aData->nType = 2; //Always PureData?
			gzp_DataArray = fArrayMalloc(_nToLimitSize);
			
		}else{ //Realloc, free?*/
		//Array Allow write 
			fArrayRealloc(_nToLimitSize);
		//}
		
		//printf("\nResize2 : %d",_nToLimitSize );
		gzp_DataLimit = _nToLimitSize; //Double factor
	}
	
	
	
	
	
	inline void fSetArrayAndSize( gzUInt _nNewSize) const {

		if(_nNewSize > gzp_DataSize){
			if(_nNewSize > gzp_DataLimit){
				fResizeMem(_nNewSize );
			}
			gzp_DataSize = _nNewSize;	
		}
	}
	
	 inline void fPrint() const {
		// fPrintData();
		fPrintData();
		
	 }
	 
	/*
	gzArray<T> (const gzArray<T>& _oOther){
	  fFirstAssign(_oOther.aData);
	  gzp_Additional_fAssignType
	}*/
	 
	
	/*
	 //WRITING / READING
	inline T* operator[](gzUIntX _nIndex) {
		return &aData->aTab[_nIndex ];
	}
	
	 //READING
	inline T* operator()(gzUIntX _nIndex) {
		return &aData->aTab[_nIndex ];
	}*/
	
	
	#include "DataArrayCommun.h"
};




#define GzS (sizeof(T))
#define gzp_length (array.aData->nSize / (sizeof(T)))

template <class T>
class gzPodLock{
	
	 public:
	 gzArray_* array;
	// T* element;
	 
	 
	  gzPodLock(gzArray_* _array):array(_array){
		 printf("\n***CreateLock***");
		 array->nLock ++;
	 }
	 
	 /*
	  gzPodLock(gzArray_* _array,  T* _element ):array(_array), element(_element){
		 printf("\n***CreateLock***");
		 array->nLock ++;
	 }
	 */
	 
	 /*
	 	inline T& operator[](gzUIntX _nIndex) {
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
		//return  ((T)(array.aData->aTab[_nIndex * GzS]));
	}*/
	/*
	 T& get(){
		 return *element;
	 }*/
	 /*
	 //WRITING / READING
	inline T* operator[](gzUIntX _nIndex) {
		return &((T)*element)[_nIndex ];
	}*/
	
	inline T& operator[](gzUIntX _nIndex) {
		return  *((T*)(&array->aData->aTab[_nIndex * GzS]));
		//return  ((T)(array.aData->aTab[_nIndex * GzS]));
	}
	
	
	 ~gzPodLock(){

		 printf("\n***DestroyLock****");
		  array->nLock --;
	 }
};




template <class T>
class gzArray {
	public:
	gzArray_ array;
	
	
	inline gzArray(){//TODO TODO Default construction!!!!!!
		
	}
	
	/*
	//READING
	inline T& operator()(gzUIntX _nIndex) {
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
	*/
	
	//READING 
	inline T* operator()(gzUIntX _nIndex) {
		return  ((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
		
	//WRITING 
	inline T&  operator[](gzUIntX _nIndex) {
		GzAssert(array.aData->nType != 0, "DataArray is readOnly, use () instead if you reading only values");
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
	
	

	gzPodLock<T> getsafe(){  //(safe)
//		return gzPodLock<T>(  &array , (T*)(&array.aData->aTab[0]));
		return gzPodLock<T>(  &array);
	}
	
	/*
	
	//	gzPodLock<T> fGetLock(gzUIntX _nIndex){
	//	printf("\n------%d", sizeof(T));
		//return *(T*)&(array.aData->aTab[_nIndex * GzS]);
	//	return *(T*)&(array.aData->aTab[_nIndex * GzS]);
	//	((gzFloat*)array.aData->aTab)[0] = 5.5;
	
	//	return (T*)(&array.aData->aTab[_nIndex * GzS]);
	*/
	
	

	gzArray(const gzArray_& _oOther):array(_oOther){
	}

	gzArray(gzDataRC* _oOther):array(_oOther){

	}
/*
	gzArray(const gzDataRC& _oOther):array(_oOther){
		printf("\noku\n");
	}*/
	

	gzArray<T> operator=(const gzArray_& _oOther) {
		array = _oOther;
	   return *this;
	}
	gzArray operator+=(const gzArray_& _oOther) {
		array += _oOther;
	   return *gzDtThis;
	}
	
	inline void fPrint() const {
		for(gzUInt i = 0; i < gzp_length; i++){
			printf("[%d] ", i);((T*)(&array.aData->aTab[i * GzS]))->fPrint();printf("\n");
		}

	 }
	 
	 	 
	inline void f_SubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex )  {
		return array.f_SubStr(_nBeginIndex * GzS,_nEndIndex * GzS);
	 }
	inline gzp_DataType fSubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex )  {
		return array.fSubStr(_nBeginIndex * GzS,_nEndIndex * GzS );
	 }
	inline void f_SubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1){
		return array.f_SubStrCount(_nBeginIndex * GzS,_nCount * GzS);
	}
	inline gzp_DataType fSubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1 ){
		return array.fSubStrCount(_nBeginIndex * GzS,_nCount * GzS);
	}
	

	/////// Repeat all function 
	
	
	
	

/*
	inline gzArray_& operator->()
	{ return array; }
	*/

	
/*
	inline operator gzArray_*() {
		return array;
	};
*/
/*
	inline operator gzArray_&() {
		return *array;
	};
	*/
	
	
	
};

typedef  const gzArray_& _gzArray_;


#endif
