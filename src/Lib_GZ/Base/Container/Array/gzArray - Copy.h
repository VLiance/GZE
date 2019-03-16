//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Array)
#define tHDef_Lib_GZ_Array

#include "Lib_GZ/Base/Container/DataRC.h"
#include "Lib_GZ/Base/Container/Array/DataArray.h"
#include "Lib_GZ/Base/Result/gzResult.h"
#include "Lib_GZ/Base/Math/MathBit.h"
#include "Lib_GZ/Debug/Debugging.h"

//gzDataArrayShared

//#define gzDataObj(_aData) ((gzDataRoot){ (gzDataRC*)&_aData,0,0 })


//extern const gzDataRC gzNullStr_Data;



//template <class T>
class gzArray_ {
public:
	
	gzDataRC* aData;
	gzUInt nLock;
	

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
	#define gzp_DataRelSize(_nFullSize) (_nFullSize)
	
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
	
	
	inline gzArray_(){//TODO TODO Default construction!!!!!!
		gzConst_Data(gzUInt, gzNull_Data);
		
		 aData = (gzDataRC *)&gzNull_Data;
	}
	/*
	inline gzArray_( const gzArray_& _oOther ){//TODO TODO Default construction!!!!!!
		 aData = _oOther.aData;
		 nLock = _oOther.nLock;
	}*/
	
	/////Clone array
	inline gzp_DataType(gzp_DataType* _oOther, gzBool _bClone){
		aData =  GZ::fDataCopyAlloc(_oOther->aData->aTab, _oOther->aData->nSize, _oOther->aData->nSize,  _oOther->aData->nLimit );
		aData->nInst = 1;
		//printf("\n %p: Set: %d  ",aData->aTab, aData->nInst);
	}
	/////////
	/*
	gzp_DataType operator=(const gzp_DataType& _oOther) {
		aData = _oOther.aData;
		nLock = _oOther.nLock;
	   return *this;
	}*/

	inline void Delete(gzDataRC* _oRC) const {
		if(_oRC->nType == gzDataType_Both_HEAP_AND_SUBFREE){ //Cond before func? Remove all sub instances & sub free
			for(gzUInt i = 0; i < _oRC->nSize; i++){
				//(Base* ) aTab[i]->Delete();
			}
		}
		
	//	printf("\Delete:");fPrint();
		//printf("\nFree:");fPrint();
		//GZ_fFree((void*)this); //Combined array
	}
	
	inline void Free(gzDataRC* _oRC) const { //Don't free if we have weak_ptr  alive
		//printf("\nTestfrreee!");
		//if(_oRC->nType  > 1){ //If Not read only
		//	printf("\nFree---xxxxxxxxxxxxxxxxx-:");_oRC->fPrint();
			//printf("\nFree--%d:", _oRC->nSpaceBef);
			//GZ_fFree(_oRC->aTab - gzp_Data->nSpaceBef); 	GZ_nArrayTotalFree++; //Combined array
			if( gzDataType_IS_Array_MUSTFREE(_oRC) ){ 
				GZ_fFree(_oRC->aTab - _oRC->nSpaceBef); 	GZ_nArrayTotalFree++; //Combined array
			}
			if( gzDataType_IS_DataRC_MUSTFREE(_oRC) ){ 
				GZ_fFree(_oRC); 	GZ_nArrayTotalFree++; //Combined array
			}
		//}
	}

	inline void fRemoveInstance(gzDataRC* _oRC) const{
		//printf("\nSub: %d  ", _oRC->nInst);fPrint();
		
		//Lock free safe version (can be not deleted)
		if( _oRC->nInst == 1 ){//nType >= 0 Heap data -> must be freed 
			Delete(_oRC);
			//if(_oRC->nWeakInst == 0){
				Free(_oRC);
			//}
		}else{
			_oRC->fRemoveInstance();
		}
		
		/*
		//Lock free unsafe version (can be double delete)
		_oRC->fRemoveInstance();
		if( _oRC->nInst == 0 ){//nType >= 0 Heap data -> must be freed
			Delete(_oRC);
			//if(_oRC->nWeakInst == 0){
				Free(_oRC);
			//}
		}
		*/
		
		
	}
	

	inline gzUInt8* fArrayNewAlloc( gzUIntX _nSize) const {
		GZ_nArrayTotalAlloc++;
		return (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); 
	}	

	
	
	inline gzUInt8* fArrayAlloc( gzUIntX _nSize) const {
		GZ_nArrayTotalAlloc++;
		return (gzUInt8*)GZ_fCalloc(_nSize, sizeof(gzUInt8)); 
	}	


	
	
	
	//inline void fArrayRealloc( gzUIntX _nSize, bool _bOldReadonly) const { //Only new array for now
	//Rule # Always nType > 1
	inline void fArrayRealloc( gzUIntX _nSize) const { //Only new array for now
		gzUInt8* _aOldTab = aData->aTab ;
		gzUInt _nOldSize = aData->nSize;
		printf("\n ---_nOldSize %d", _nOldSize);
		printf("\n ---nSize %d", _nSize);
		printf("\n ---nSpaceBef %d", aData->nSpaceBef);
		
		
		aData->aTab = fArrayAlloc(_nSize); //Reset aTab
		memcpy( aData->aTab , _aOldTab, _nOldSize );
	//	if(!_bOldReadonly){ //Old nLimit-> read only   /*// Never read Only?????
	
		GZ_fFree(_aOldTab);	GZ_nArrayTotalFree++;
	
		/* //Always nType > 1
		 if(aData->nType > 1){
			GZ_fFree(_aOldTab);	GZ_nArrayTotalFree++;
		}else{
		
			aData =  GZ::fDataCopyAlloc(_oOther->aData->aTab, _oOther->aData->nSize, _oOther->aData->nSize,  _oOther->aData->nLimit );
		
			aData->nType = 2; //Or 3 ??
			printf("\nSet at 2 %d ",_nSize);
		}
		*/
			
		//}
	}
	 
	inline void fResizeMem( gzUIntX _nToSize) const {

		int _nToLimitSize = _nToSize * GZ_Array_Expand_Factor;
		//fMalloc(_nToLimitSize);
		/*
		// Never read Only?????
		if(aData->nType <= 1 ){ //read only var  || new array -> Malloc 
			aData->nType = 2; //Always PureData? //Or Is Ptr? TODO
			//aData->nType = 3; //Is Ptr? TODO
			fArrayRealloc(_nToLimitSize, true);
			
		}else{ //Realloc, free?*/
		//Array Allow write 
			fArrayRealloc(_nToLimitSize);
	//	}
		
		//printf("\nResize2 : %d",_nToLimitSize );
		gzp_DataLimit = _nToLimitSize; //Double factor
	}
	
	
	inline void fSetArrayAndSizeExtFunc( gzUIntX _nNewSize) const {

		_nNewSize = GZ_fMax(_nNewSize,gzp_DataSize);

		if(gzDataType_IS_Both_READONLY( aData)){//Clone if readonly -> become writable & Stack to heap clone to be generic on free both array & obj -> cannot have hybrid
		//if( aData->nType <= 1){//Clone if readonly -> become writable & Stack to heap clone to be generic on free both array & obj -> cannot have hybrid
		//if( aData->nType == 0){//Clone if readonly -> become writable
		//	this = gzp_DataType((gzp_DataType*)this, true);
			
			//TODO Check if we can never use both readOnly array to remove this condition
			//DETATCH!!!! ALL OTHER RC will no longuer point to sames values (Only espected in COW principe)
			
			gzDtThis->aData  =  (gzDataRC*)GZ::fDataCopyAlloc(aData->aTab, aData->nSize, _nNewSize, _nNewSize * GZ_Array_Expand_Factor);
			aData->nInst = 1;
			
			//printf("\n %p: Set: %d  ",aData->aTab, aData->nInst);
			//gzp_DataSize = GZ_fMax(_nNewSize,gzp_DataSize);
		}else{
		 
			//gzp_DataSize = GZ_fMax(_nNewSize,gzp_DataSize);
		
			//if( aData->nType == 1 || _nNewSize > gzp_DataLimit){ //If is readOnly create new array of writable data //TODO aData->nType == 1 used??
			if( _nNewSize > gzp_DataLimit){ //If is readOnly create new array of writable data //TODO aData->nType == 1 used??
				fResizeMem(_nNewSize);
			}
			gzp_DataSize = _nNewSize;
			
		}
	}
	
	
	
	inline void fSetArrayAndSize( gzUIntX _nNewSize) const {
		//printf("\n aData->nType %d ", aData->nType);
		//printf("\n _nNewSize %d ", _nNewSize);
		//printf("\n gzp_DataSize %d ", gzp_DataSize);

		//maybe ... 
		if(gzDataType_IS_Array_READONLY(aData) || _nNewSize > gzp_DataSize){  
			fSetArrayAndSizeExtFunc(_nNewSize);   ///TODO make external function to optimize
		} 
		
		/*
		if( aData->nType == 0){ //If is readOnly create new array of writable data
			fResizeMem(GZ_fMax(_nNewSize,gzp_DataSize));
		}else{
			if(_nNewSize > gzp_DataSize ){
				/// Call function? = 1 cond ////
				if(_nNewSize > gzp_DataLimit){
					fResizeMem(_nNewSize );
				}
				gzp_DataSize = _nNewSize;	
				///////////////////////////////
			}
		}*/
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
#define gzp_length (m.aData->nSize / (sizeof(T)))

template <class T>
class gzPodLock{
	
	 public:
	 gzArray_* m;
	// T* element;
	 
	 
	  gzPodLock(gzArray_* _array):m(_array){
		 printf("\n***CreateLock***");
		 m->nLock ++;
	 }
	 
	 /*
	  gzPodLock(gzArray_* _array,  T* _element ):m(_array), element(_element){
		 printf("\n***CreateLock***");
		 m->nLock ++;
	 }
	 */
	 
	 /*
	 	inline T& operator[](gzUIntX _nIndex) {
		return  *((T*)(&m.aData->aTab[_nIndex * GzS]));
		//return  ((T)(m.aData->aTab[_nIndex * GzS]));
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
		return  *((T*)(&m->aData->aTab[_nIndex * GzS]));
		//return  ((T)(m.aData->aTab[_nIndex * GzS]));
	}
	
	

	
	 ~gzPodLock(){

		 printf("\n***DestroyLock****");
		  m->nLock --;
	 }
};



		//	static const gzUIntX* _nZero = 0;
			
template <class T>
class gzArray {
	public:
	gzArray_ array;
	
	#include "ArrayContainerCommun.h"
	
	inline gzArray(){//TODO TODO Default construction!!!!!!
		
	}
	
	/*
	//READING
	inline T& operator()(gzUIntX _nIndex) {
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
	*/
	
	//const gzUInt GZ_ZERO;

	
	//READING :: return RVO
	inline T operator()(gzUIntX _nIndex) const { 

		
		if(_nIndex >= gzp_length){
			//	printf("\n!Return !! %d", _nZero);  
			return 0;
		}
	//	GzUnAssert(_nIndex >= gzp_length, "Reading array Out of bound");
	//	GzUnAssert(_nIndex >= array.aData->nSize, "Reading array Out of bound");
	//		printf("\n!!!!!!!!! return !! %d",((T*)(&array.aData->aTab[_nIndex * GzS]))->get());
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
		
	//WRITING 
	inline T&  operator[](gzUIntX _nIndex) const {
		//GzAssert(array.aData->nType != 0, "DataArray is readOnly, use () instead if you reading only values"); //IF READONLY WE RECREATE ONE (COW), TODO VERIFY?
		//GzUnAssert(_nIndex >=  gzp_length , "Writing array Out of bound"); //OUT OF BOUND REALLOC ARRAY
		
		array.fSetArrayAndSize( (_nIndex+1) * (sizeof(T))  );
		return  *((T*)(&array.aData->aTab[_nIndex * GzS]));
	}
	inline const T&  fPush(const T& _oObj) const {
		(*this)[gzp_length] = _oObj;
		return _oObj;
	}
	inline gzUIntX GnSize() const {
		return gzp_length;
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
	
	

	gzArray(const gzArray_& _oOther):array(_oOther){}

	gzArray(gzDataRC* _oOther):array(_oOther){}
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
		printf("\n %p ", array.aData);
		for(gzUInt i = 0; i < gzp_length; i++){
			printf("[%d] ", i);((T*)(&array.aData->aTab[i * GzS]))->fPrint();printf("\n");
			//printf("[%d] ", i); printf( "%p", array.aData->aTab[i * GzS]  );printf("\n");
		//	printf("[%d] ", i); printf( "%c", array.aData->aTab[i * GzS]  );printf("\n");
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
