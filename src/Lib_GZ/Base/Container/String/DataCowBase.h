//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



//#RULE #1 DataCow are always readonly
//#RULE #2 DataCow never have ptr (Always pods) (like string)
//#RULE #3 DataCow never have weak_ptr


//#define gzDataObj(_aData) ((gzDataRoot){ (gzDataRC*)&_aData,0,0 })
/*
	struct m{
		gzDataRC* aData;

		gzUInt8* aSubTab;
		gzUIntX nSubSize;
		gzUIntX nSubLimit; //(m.aData->nLimit - (m.aSubTab - m.aData->aTab))
	}m;*/
	GZ_DataCOW m;


	#undef gzp_TestLock 
	#define gzp_TestLock 
	
	#undef gzp_DataSize
	#undef gzp_DataArray
	#undef gzp_DataLimit
	#undef gzp_DataTypeOnly
	#undef gzp_RIni
	#undef gzp_RReturn
	#undef gzp_Additional_fAssign
	#undef gzp_Additional_fAssignType
	#undef gzp_Additional_fAssignType_PTR


	#undef gzp_Data
	
	/////////////////////
	#define gzp_Data m.aData
	#define gzp_DataSize m.nSubSize
	#define gzp_DataArray m.aSubTab
	#define gzp_DataLimit  m.nSubLimit
	////////////////////////////////
	#undef gzp_Type
	#define gzp_Type gzp_DataType
	#undef gzp_Data_
	#define gzp_Data_ m.aData
	#undef gzp_Size
	#define gzp_Size m.nSubSize
	#undef gzp_Array
	#define gzp_Array m.aSubTab
	#undef gzp_Limit
	#define gzp_Limit  m.nSubLimit
	/////////////////////////////////
	
	#define gzp_DataTypeOnly(_Exp)
	#define gzp_RIni(Exp) gzp_DataType _oNew(gzDtThis);_oNew.Exp;return _oNew;
	//#define gzp_RIni(Exp) gzp_DataType _oNew(gzDtThis);_oNew.Exp;return _oNew;

	#define gzp_RReturn
	//#define gzp_Additional_fAssign gzDtThis->m.aSubTab = m.aData->aTab; gzDtThis->m.nSubSize = m.aData->nSize; gzDtThis->gzp_DataLimit = m.aData->nLimit;
	#define gzp_Additional_fAssign         gzDtThis->m.aSubTab = m.aData->aTab;      gzDtThis->m.nSubSize = m.aData->nSize;    gzDtThis->gzp_DataLimit = m.aData->nLimit;
	#define gzp_Additional_fAssignType     gzDtThis->m.aSubTab = _oOther.m.aSubTab;  gzDtThis->m.nSubSize = _oOther.m.nSubSize; gzDtThis->m.nSubLimit = _oOther.m.nSubLimit;
	#define gzp_Additional_fAssignType_PTR gzDtThis->m.aSubTab = _oOther->m.aSubTab; gzDtThis->m.nSubSize = _oOther->m.nSubSize; gzDtThis->m.nSubLimit = _oOther->m.nSubLimit;

	#undef gzp_WRITE_OPERATION_
	#define gzp_WRITE_OPERATION_(_nNewSize) if(m.aData->nInst != 1){ fDetach(_nNewSize);} //Todo break with external fonction

	
	gzp_DataType(){
	
			m.aData = 0;
			m.aSubTab =	0;
			m.nSubSize =	0;
			m.nSubLimit =	0;
			
	 //   static gzDataRC _gzNullStr_dat = GzToDataRC_const(gzConcat(gzS8 ,""));  
		//static gzStr8 _gzNullStr(&_gzNullStr_dat); 
		gzp_DataType _gzNullStr(gzp_NullStr);
		*this = _gzNullStr;
	}
		
	
	inline void Delete(gzDataRC* _oRC) const {
		/*  Not applicable for datacow

		if(_oRC->nType == gzDataType_Both_HEAP_AND_SUBFREE){ //Cond before func? Remove all sub instances & sub free
			for(gzUInt i = 0; i < _oRC->nSize; i++){
				//(Base* ) aTab[i]->Delete();
			}
		}*/

	//	printf("\Delete:");fPrint();
		//printf("\nFree:");fPrint();
		//GZ_fFree((void*)this); //Combined array
	}





//Same as Arrray
	inline void Free(gzDataRC* _oRC) const { //Don't free if we have weak_ptr  alive

/*
		if(_oRC->nSize > 1 && _oRC->aTab[0] == 'a'){
			printf("\nFree---xxxxxxxxxxxxxxxxx-:");_oRC->fPrint();
			printf("\nFree---xxxxxxxxxxxxxxxxx-:");_oRC->fPrint();
		}*/


		if( gzDataType_IS_Array_MUSTFREE(_oRC) ){ 
			///printf("\nFree---xxxxxxxxxxxxxxxxx-: %d", _oRC->nSpaceBef);_oRC->fPrint();
			GZ_fFree(_oRC->aTab - _oRC->nSpaceBef); 	GZ_nArrayTotalFree++; //Combined array
		}
		
		if( gzDataType_IS_DataRC_MUSTFREE(_oRC) ){ //If Not read only
			#ifdef GZ_tDebug
				_oRC->aTab = 0;
				_oRC->nType = -1;
				_oRC->nInst = -1;
			#endif
			GZ_fFree(_oRC); 	GZ_nArrayTotalFree++; //Combined array
	

		}
	}
//Same as Arrray
	inline void fRemoveInstance(gzDataRC* _oRC) const{

		_oRC->fRemoveInstance();
		//printf("\nSubed: %d  ", _oRC->nInst);fPrint();
		if( _oRC->nInst == 0 ){//nType > 2 Heap data -> must be freed
			//Delete(_oRC);
			//if(_oRC->nWeakInst == 0){ //DataCow Never have weak_ptr
				Free(_oRC);
			//}
		}
	}



	inline gzUInt8* fArrayAlloc( gzUInt _nSize) const {
		 GZ_nArrayTotalAlloc++;
		return (gzUInt8*)GZ_fCalloc(_nSize, sizeof(gzUInt8));
	}

	//Rule #1 Always On Unique Instance
	//Rule #2 Sub Array = DataRC
	inline void fArrayRealloc( gzUInt _nSize) const {  //Only new array for now
		gzUInt8* _aOldTab = m.aData->aTab;
		//gzUInt _nOldSize = gzp_DataSize;

		m.aData->aTab = fArrayAlloc(_nSize); //Reset aTab
		memcpy( m.aData->aTab, m.aSubTab, m.nSubSize );
		m.aData->nSize = m.nSubSize;
		m.aData->nLimit = _nSize;


		gzDtThis->m.aSubTab = m.aData->aTab;
		gzDtThis->m.nSubSize = _nSize;
		gzDtThis->m.nSubLimit = _nSize;

	//	if(!_bOldReadonly){ //Old nLimit-> read only   /*// Never read Only?????
			GZ_fFree(_aOldTab);	GZ_nArrayTotalFree++;
	//	}
	}

	//void fMalloc( gzUInt _nSize);
	//void fFree();

	//#Rule 1 Always On Unique Instance
	//#Rule 2 Always On Write operation
	inline void fResizeMem( gzUInt _nToSize) const { //Always readonly -> create new array
			/*
		if(_nNewSize < m.aData->nLimit){ //No need to realloc, just need to move data

		}	*/



		int _nToLimitSize = _nToSize * GZ_Array_Expand_Factor;
		//fMalloc(_nToLimitSize);

		/*
		// Never read Only?????
		if(m.aData->nType == 0 ){ //read only var  || new array -> Malloc
			m.aData->nType = 1; //Always PureData?
			gzp_DataArray = fArrayMalloc(_nToLimitSize);

		}else{ //Realloc, free?
		*/
		//Array Allow write
			fArrayRealloc(_nToLimitSize);
		//}

		//printf("\nResize2 : %d",_nToLimitSize );
		gzDtThis->gzp_DataLimit = _nToLimitSize; //Double factor
	}


	inline void fAssignArray(gzDataRC* _aData ) const{
		gzDtThis->m.aData = _aData;
		gzDtThis->m.aData->nInst = 1;//Useless?
		gzDtThis->m.aSubTab = m.aData->aTab;
		gzDtThis->m.nSubLimit =  m.aData->nLimit;
		gzDtThis->m.nSubSize  = m.aData->nSize;
	//	printf("\n %p: Set: %d  ",m.aData->aTab, m.aData->nInst);
	}

	inline static gzDataRC* fEmptyArray(gzUInt _nNewSize ) {
	  return GZ::fDataAlloc( _nNewSize, _nNewSize * GZ_Array_Expand_Factor );
	}

	inline gzDataRC* fNewArray(gzUInt _nNewSize ) const{
	  return  GZ::fDataCopyAlloc( m.aSubTab, gzp_DataSize , _nNewSize, _nNewSize* GZ_Array_Expand_Factor );
	}

	
	 inline void fDetachReadOnly(gzUInt _nNewSize ) const {
		//printf("\n--DETACH %p ", m.aData);
		m.aData->fRemoveInstance(); //Will never be freed
        gzDataRC* _aData = fNewArray(_nNewSize);
        fAssignArray(_aData);
    }
    
	
	//Rule #1 always nInst > 1
	inline void fDetach(gzUInt _nNewSize ) const {
		m.aData->fRemoveInstance(); //fRemoveInstance(m.aData); //Will never be freed
		gzDataRC* _aData = fNewArray(_nNewSize);
		fAssignArray(_aData);

	}

	//#Rule 1 Always On Write operation
	inline void fSetArrayAndSize( gzUInt _nNewSize) const {
		//fResizeMem(_nNewSize ); //Always set a new array for COW

		if(m.aData->nInst == 1 && gzDataType_IS_DataRC_MODIFIABLE( m.aData) ){  //Not  if read only
			//Only one Instance, it was writable
		printf("\nRezize meme");
			//if(m.aSubTab + _nNewSize >  m.aData->aTab +  m.aData->nLimit ){ //Over the real limit
			if(_nNewSize > m.nSubLimit ){
				fResizeMem(_nNewSize);
				gzDtThis->m.nSubLimit =  m.aData->nLimit;
			}
			gzDtThis->m.nSubSize = _nNewSize;
		//	printf("\nONE");
		}else{   // READONLY
			//printf("\nfDetachReadOnly %d",m.aData->nInst );
			//fPrint();
			//printf("\nfDetachReadOnly %s",m.aData->aTab );
			//Make new instance and detach
			fDetachReadOnly(_nNewSize);
		//	printf("\nDETACH");
		}
		/////Now array is WRITABLE ///////
	}


/*
	 ///// WRITING OPERATION
	inline gzUInt8* operator[](gzUIntX _nIndex) {
		gzp_WRITE_OPERATION_(m.nSubSize)
		gzp_SearchIndex
		return &gzp_DataArray[_nIndex ];
	}

	 //READING
	inline gzUInt8* operator()(gzUIntX _nIndex) {
		gzp_SearchIndex
		return &gzp_DataArray[_nIndex ];
	}
	*/


	#include "Lib_GZ/Base/Container/Array/DataArrayCommun.h"




