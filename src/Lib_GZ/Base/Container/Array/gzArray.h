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
#include "Lib_GZ/Base/SmartPtr/SmartPtr.h"


#define gzArray2D(_type) gzArray<gzArray<_type>>
#define gzArray3D(_type) gzArray<gzArray<gzArray<_type>>>
#define gzArray4D(_type) gzArray<gzArray<gzArray<gzArray<_type>>>>
#define gzArray5D(_type) gzArray<gzArray<gzArray<gzArray<gzArray<_type>>>>>

#define gzPArray2D(_type) const gzArray<gzArray<_type>>&
#define gzPArray3D(_type) const gzArray<gzArray<gzArray<_type>>>&
#define gzPArray4D(_type) const gzArray<gzArray<gzArray<gzArray<_type>>>>&
#define gzPArray5D(_type) const gzArray<gzArray<gzArray<gzArray<gzArray<_type>>>>>&

//gzDataArrayShared

//#define gzDataObj(_aData) ((gzDataRoot){ (gzDataRC*)&_aData,0,0 })


//extern const gzDataRC gzNullStr_Data;

namespace Lib_GZ{namespace Base{class csClass;}}



template <class T>
class gzArray_ {
public:
	
	gzDataRC* aData;
	gzUInt nLock;
	

	#undef gzp_TestLock 
	#ifdef D_Debug
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
	//#define gzp_Stride (sizeof(T))
	#define gzp_Stride (1)
	#define gzp_SearchIndex(ex) (ex * gzp_Stride)
	
	
	#undef gzp_Data
	#define gzp_Data aData
	
	#define gzp_nS  *_nS
	#define gzp_DataType gzArray_<T>
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
	
	
	inline gzArray_(){
		//gzConst_Data(gzUInt, gzNull_Data);
		// aData = (gzDataRC *)&gzNull_Data; ///Cannort do that because it cause detach when assingn on it
		 aData = fEmptyArray(0,4);
		 aData->nInst = 1;
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
		///if(_oRC->nType == gzDataType_Both_HEAP_AND_SUBFREE){ //Cond before func? Remove all sub instances & sub free
		if( gzDataType_IS_Array_MUSTFREE(_oRC) ){  //Cond before func? Remove all sub instances & sub free
			for(gzUInt i = 0; i < _oRC->nSize / sizeof(T); i++){
				//(Base* ) aTab[i]->Delete(); 
				((T*) aData->aTab)[i] = T(); //Todo not for basic type 
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

	/*
		inline void fRemoveInstance(const gzDataRC& _oRC) const{
			if( _oRC.nInst == 1 ){//nType >= 0 Heap data -> must be freed 
				Delete(_oRC);
				//if(_oRC->nWeakInst == 0){
					Free(_oRC);
				//}
			}else{
				_oRC.fRemoveInstance();
			}
			
		}
	*/
	
	
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
		
		
		//Lock free unsafe version (can be double delete)
	//	_oRC->fRemoveInstance();
	//	if( _oRC->nInst == 0 ){//nType >= 0 Heap data -> must be freed
		//	Delete(_oRC);
			//if(_oRC->nWeakInst == 0){
		//		Free(_oRC);
			//}
	//	}
		
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
		/*
		printf("\n ---_nOldSize %d", _nOldSize);
		printf("\n ---nSize %d", _nSize);
		printf("\n ---nSpaceBef %d", aData->nSpaceBef);
		*/
		
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
	 gzArray_<T>* array;
	// T* element;
	 
	 
	  gzPodLock(gzArray_<T>* _array):array(_array){
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



		//	static const gzUIntX* _nZero = 0;
		

		
	#undef gzp_Data
	#define gzp_Data  m.aData
	
	#undef gzp_DataType
	#define gzp_DataType gzArray_<T>
	
	#undef gzp_DataSize
	#define gzp_DataSize  aData->nSize
	
	#undef gzp_DataArray
	#define gzp_DataArray  aData->aTab
	
	#undef gzp_DataLimit
	#define gzp_DataLimit  aData->nLimit
	
	/////////////////////////////
	#undef gzp_Type
	#define gzp_Type gzArray<T>
	#undef gzp_Data_
	#define gzp_Data_ m.aData
	#undef gzp_Size
	#define gzp_Size m.aData->nSize
	#undef gzp_Array
	#define gzp_Array m.aData->aTab
	#undef gzp_Limit
	#define gzp_Limit  m.aData->nLimit
	/////////////////////////////////
	
	//#define gzp_DataTypeOnly(_Exp)  _Exp;
	//#define gzp_DataRelSize(_nFullSize) (_nFullSize)
	
//	#define gzp_RIni(Exp) Exp;return *gzDtThis;
	#undef gzp_RIni
    #define gzp_RIni(Exp) gzp_DataType _oNew(gzDtThis, true);_oNew.Exp;return _oNew;	
		
		
	
template <class T>
class gzArray {
	public:
	gzArray_<T> m;
	
	gzBool bCatchMe;
	
	#include "ArrayContainerCommun.h"
	
	
	
	inline gzArray():m(){//TODO TODO Default construction!!!!!!
		//bCatchMe = false;
		//m.fSetArrayAndSize( (2) * (sizeof(T))  ); //TODO Begin with size of 2?
	}
	
	inline gzArray(gzBool _bCatchMe):m(){//TODO TODO Default construction!!!!!!
		//bCatchMe = true;
	}
	
	
	/*
	//READING
	inline T& operator()(gzUIntX _nIndex) {
		return  *((T*)(&m.aData->aTab[_nIndex * GzS]));
	}
	*/
	
	//const gzUInt GZ_ZERO;

	
	inline  operator void* ()  { return m.aData;};
	
	
	
	//READING :: return RVO
	inline T operator()(gzUIntX _nIndex) const { 

		
		if(_nIndex >= gzp_length){
				//printf("\n!*******Return !! %d", _nZero);  
			return T();
		}
	//	GzUnAssert(_nIndex >= gzp_length, "Reading array Out of bound");
	//	GzUnAssert(_nIndex >= m.aData->nSize, "Reading array Out of bound");
	//		printf("\n!!!!!!!!! return !! %d",((T*)(&m.aData->aTab[_nIndex * GzS]))->get());
		//return  *((T*)(&m.aData->aTab[_nIndex * GzS]));
		//  *((T*)(m.aData->aTab)[_nIndex * GzS]));
		return	((T*)m.aData->aTab)[_nIndex]; //Todo not for basic type 
			
	}
		
	//WRITING 
	inline T&  operator[](gzUIntX _nIndex) const {
		//GzAssert(m.aData->nType != 0, "DataArray is readOnly, use () instead if you reading only values"); //IF READONLY WE RECREATE ONE (COW), TODO VERIFY?
		//GzUnAssert(_nIndex >=  gzp_length , "Writing m Out of bound"); //OUT OF BOUND REALLOC ARRAY
		gzIntX _nLength = gzp_length;
		//	m.fSetArrayAndSize( (_nIndex+1) * (sizeof(T))  );
		 //return  *((T*)(&m.aData->aTab[_nIndex * GzS]));
		if(_nIndex >= _nLength){
			gzUIntX _nMax = -1;
			if(_nIndex > _nMax/2){ //If it's a negative value (or increddibly high) just return a dummy element. (use max index to return a temp value (so it can be overrited but it's a temp value))//TODO max can be affected ex:var _oTileT : TileData = _aTileData[nCaseY - 1][nCaseX];
				_nIndex = _nLength;
			}
			m.fSetArrayAndSize( (_nIndex+1) * (sizeof(T))  );
			((T*)m.aData->aTab)[_nIndex] = T();
		}
		 
		return  ((T*)m.aData->aTab)[_nIndex];
		
	}
	 gzUInt8* get() const {
	 	return gzp_Array;
	}
	inline void fSet(gzUIntX _nIndex, T _nVal)  {
		printf("\n ***Val: %p", (T)_nVal);
		/*
		 ((T*)(m.aData->aTab))[_nIndex] = (T)_nVal;
		 T _ptest = (T)_nVal;
		// T* _aTestTab = (T*)(m.aData->aTab);
		 //_aTestTab[_nIndex] =_nVal;
		 
		 printf("\n **Val: %p", (T)_nVal);
		 printf("\n **ValSet: %p",  ((T*)(m.aData->aTab))[_nIndex] );
		 printf("\n **_ptest: %p", _ptest );
		// printf("\n **_aTestTab: %p",  _aTestTab[_nIndex] );*/
	}
	
	
	inline const T&  fPush(const T& _oObj) const {
		
		(*this)[gzp_length] = _oObj;
		return _oObj;
	}
	/*
	inline gzUIntX GnSize() const {
		return gzp_length;
	}*/

	

	gzPodLock<T> getsafe(){  //(safe)
//		return gzPodLock<T>(  &m , (T*)(&m.aData->aTab[0]));
		return gzPodLock<T>(  &m);
	}
	
	/*
	
	//	gzPodLock<T> fGetLock(gzUIntX _nIndex){
	//	printf("\n------%d", sizeof(T));
		//return *(T*)&(m.aData->aTab[_nIndex * GzS]);
	//	return *(T*)&(m.aData->aTab[_nIndex * GzS]);
	//	((gzFloat*)m.aData->aTab)[0] = 5.5;
	
	//	return (T*)(&m.aData->aTab[_nIndex * GzS]);
	*/
	
	

	gzArray(const gzArray_<T>& _oOther):m(_oOther){}

	gzArray(gzDataRC* _oOther):m(_oOther){}
/*
	gzArray(const gzDataRC& _oOther):m(_oOther){
		printf("\noku\n");
	}*/
	

	gzArray<T> operator=(const gzArray_<T>& _oOther) {
		m = _oOther;
	   return *this;
	}
	gzArray operator+=(const gzArray_<T>& _oOther) {
		m += _oOther;
	   return *gzDtThis;
	}
	
	inline void fPrint() const {
		printf("\n %p ", m.aData);
		for(gzUInt i = 0; i < gzp_length; i++){
			printf("[%d] ", i);((T*)(&m.aData->aTab[i * GzS]))->fPrint();printf("\n");
			//printf("[%d] ", i); printf( "%p", m.aData->aTab[i * GzS]  );printf("\n");
		//	printf("[%d] ", i); printf( "%c", m.aData->aTab[i * GzS]  );printf("\n");
		}
	 }
	 
	 inline void fClear(){

		for(gzUIntX i = 0; i < (gzp_Size)/GzS; i++){
			 //Lib_GZ::fRemove(((T*)(&m.aData->aTab[i * GzS])));
			//((T*) m.aData->aTab)[i] = 0;
			
			((T*) m.aData->aTab)[i] = T(); //Todo not for basic type 
			
			//((T*) m.aData->aTab)[i * GzS] = 0;
			//((T*)(&m.aData->aTab[i * GzS]))->remove();
		}
		gzp_Size = 0;
	}
	 
	 inline void fMaxSize(  gzUIntX _nMaxSize) const { //public
		m.fIsFit(_nMaxSize);
	}
	 
	 	 
	inline void f_SubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex )  {
		return m.f_SubStr(_nBeginIndex * GzS,_nEndIndex * GzS);
	 }
	inline gzp_DataType fSubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex )  {
		return m.fSubStr(_nBeginIndex * GzS,_nEndIndex * GzS );
	 }
	inline void f_SubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1){
		return m.f_SubStrCount(_nBeginIndex * GzS,_nCount * GzS);
	}
	inline gzp_DataType fSubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1 ){
		return m.fSubStrCount(_nBeginIndex * GzS,_nCount * GzS);
	}


/*
	inline gzArray_& operator->()
	{ return m; }
	*/

	
/*
	inline operator gzArray_*() {
		return m;
	};
*/
/*
	inline operator gzArray_&() {
		return *m;
	};
	*/
	
	inline ~gzArray(){
		if(bCatchMe){
		//	printf("\nDelete CatchMe array");
		}
	}
	
};


//typedef  const gzArray_& _gzArray_;


#endif
