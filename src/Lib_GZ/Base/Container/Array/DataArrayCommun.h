//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef	gzp_OWNER

#include "Lib_GZ/Base/Math/MathBit.h"




	inline static gzDataRC* fEmptyArray(gzUInt _nNewSize ) {
	  return GZ::fDataAlloc( _nNewSize, _nNewSize * GZ_Array_Expand_Factor );
	}
	inline static gzDataRC* fEmptyArray(gzUInt _nSize, gzUInt _nMaxSize  ) {
	  return GZ::fDataAlloc( _nSize, _nMaxSize );
	}
	
	///////////////////////////////////////
	////////////////////////////////////////
	inline void fFirstAssign(const gzDataRC* _pOther) const {
		gzDtThis->gzp_Data = (gzDataRC*)_pOther;
	//	printf("\nADD instantce to "); _pOther->fPrint();
		const_cast<gzDataRC*>(_pOther)->fAddInstance();
		gzp_Additional_fAssign;

	}
	inline void fAssign(gzDataRC* _pOther) const {

		gzDataRC* _pTemp = gzp_Data; //Protect from self assign/destroy
		gzDtThis->gzp_Data = _pOther;
		_pOther->fAddInstance();
		if(_pTemp != 0){
			fRemoveInstance(_pTemp);
		}
		gzp_Additional_fAssign;
	}



			/*
	gzBool operator==(const gzp_DataType& _oOther) const{
		if(gzp_RelSize == _oOther.gzp_RelSizeO){
			gzUIntX _nLast = gzp_RelSize;
			while(_nLast > 0){
				_nLast--;
				if( (*this)(_nLast) != _oOther(_nLast)){
					return false;
				}
			}
			return true;
		}Add:
		return false;
	}
*/


	






	gzp_DataType(gzDataRC* _oOther){
	  fFirstAssign(_oOther);
	  	   //  		printf("\n --%p: New*: %d  ",this, gzp_Data->nInst);fPrint();
	}

	gzp_DataType(gzp_DataType* _oOther){
	  fFirstAssign(_oOther->gzp_Data);
	   gzp_Additional_fAssignType_PTR
	     	//	printf("\n --%p: NewDataType*: %d  ",this,gzp_Data->nInst);fPrint();
	}

	/*
	gzp_DataType(gzp_DataType*_pOther){
	  fFirstAssign(_pOther);
	}*/


	gzp_DataType(const gzDataRC& _oOther){

	  fFirstAssign(&_oOther);
	  		//printf("\n --%p: New&: %d  ",this, gzp_Data->nInst);fPrint();
	}
	
	
	

	gzp_DataType(const gzp_DataType& _oOther, gzBool _bForceDetach){ //For multithread Operation? Or make nInst atomic?
		  fFirstAssign(_oOther.gzp_Data);
		//fDetach(gzp_DataSize);
		gzp_WRITE_OPERATION_(gzp_DataSize) //Detach --> TODO direct detach
		gzp_Additional_fAssignType
	
	}
	gzp_DataType(const gzp_DataType& _oOther){ 
	  fFirstAssign(_oOther.gzp_Data);
	  gzp_Additional_fAssignType
	  	  		//printf("\n --%p: NewDataType&: %d  ",this, gzp_Data->nInst);fPrint();
	}


	gzp_DataType& operator=(const gzp_DataType& _oOther) const {
		
	
		fAssign(_oOther.gzp_Data);
		gzp_Additional_fAssignType
	   return *gzDtThis;
	}
	
	gzp_DataType operator+=(const gzp_DataType& _oOther) const {
		f_Add(_oOther);
	   return *gzDtThis;
	}


	inline gzp_DataType operator+(const gzp_DataType& _aOther) const{
			//	printf("\n++++++");
		return fAdd(_aOther);
	}






	////////////////////////////////////////
	////////////////////////////////////////

	inline void fIsFit(  gzUIntX _nNewSize) const {
		//gzp_Additional_fAssign2 //Because we will do modification Str must reset saved index, to be accurate with different index size
		/*
		if(_nNewSize < gzp_DataSize){//Utils for array?
			_nNewSize = gzp_DataSize;
		}
		fSetArrayAndSize(_nNewSize);
		*/
		fSetArrayAndSize(GZ_fMax(_nNewSize,gzp_DataSize));
	}
	


	inline void fCopyData(  gzUInt8* _aCopySrc, gzUIntX _nCopySize, gzInt _nDestIndex) const{
		// Copy Data from other array
		 memcpy( &gzp_DataArray[_nDestIndex], _aCopySrc, _nCopySize * sizeof(gzUInt8));
	}


	inline void fCopy(  gzUInt8* _aCopySrc, gzUIntX _nCopySize, gzInt _nDestIndex) const{
		gzp_TestLock
		fIsFit(_nDestIndex + _nCopySize);
		fCopyData(_aCopySrc, _nCopySize, _nDestIndex);
	}
	



	inline void fMove(gzUIntX _nFromIndex, gzUIntX _nCopySize, gzUIntX _nDestIndex){

		fIsFit(_nDestIndex + _nCopySize);
		memmove( &gzp_DataArray[_nDestIndex], &gzp_DataArray[_nFromIndex], _nCopySize);
	}




	inline void f_Insert(const gzp_DataType& _aOther, gzIntX _nBeginIndex, gzIntX _nCopySize, gzInt _nToIndex){
		fMove(_nToIndex, gzp_DataSize - _nToIndex, _nToIndex + _nCopySize);
		fCopyData(_aOther.gzp_DataArray + _nBeginIndex,  _nCopySize,  _nToIndex);
	}

	inline gzp_DataType fInsert(const gzp_DataType& _aOther, gzIntX _nBeginIndex, gzIntX _nCopySize, gzInt _nToIndex ){
		gzp_RIni(f_Insert(_aOther, _nBeginIndex, _nCopySize, _nToIndex ));
	}


	


	//////////////// ADD /////////////////
	inline void f_Add(const gzp_DataType& _aOther ) const{
		fCopy(_aOther.gzp_DataArray, _aOther.gzp_DataSize,  gzp_DataSize);
	}


	inline gzp_DataType fAdd(const gzp_DataType& _aOther ) const {
		gzp_RIni(f_Add(_aOther ));
	}

	//////////////// //////////////// //////////////// //////////////

	inline void f_PreAdd(const gzp_DataType& _aOther ){
		fCopy(_aOther.gzp_DataArray, _aOther.gzp_DataSize,  0);
	}

	inline gzp_DataType fPreAdd(const gzp_DataType& _aOther ){
		gzp_RIni(f_PreAdd(_aOther ));
	}




	inline void fShinkBefore(gzUIntX _nIndex ){
		//GZ_Assert_Array(gzp_DataSize >=  _nIndex); //Todo only set var?
		if(_nIndex > gzp_DataSize){
			_nIndex = gzp_DataSize;
		}
		
		gzp_DataArray += _nIndex;
		gzp_DataSize -= _nIndex;
		gzp_DataLimit -= _nIndex;
		gzp_DataTypeOnly(gzp_Data->nSpaceBef += _nIndex);
	}

	


	inline void fShinkAfter(gzUIntX _nIndex ){
		//GZ_Assert_Array(gzp_DataSize >=  _nIndex);//Todo only set var?
		if(_nIndex < gzp_DataSize){
			gzp_DataSize = _nIndex;
		}
	}

	//#Rule1 be sure that end index was > of begin index
	inline void f_SubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1){
		GZ_Assert_Array(gzp_DataSize >= _nBeginIndex + _nCount );
		
		fShinkBefore(_nBeginIndex);
	
		fShinkAfter( _nCount);
		
	}
	inline gzp_DataType fSubStrCount(gzUIntX _nBeginIndex, gzUIntX _nCount = 1 ){
		gzp_RIni(f_SubStrCount(_nBeginIndex, _nCount));
	}


	//#Rule1 be sure that end index was > of begin index
	inline void f_SubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex ){
	
		GZ_Assert_Array(_nBeginIndex <= _nEndIndex );//Todo set to empty?
		if(_nEndIndex > gzp_DataSize ){
			_nEndIndex = gzp_DataSize;
		}
		//gzUInt _nEndIndex = _nBeginIndex + _nCount;

		fShinkBefore(_nBeginIndex);
		fShinkAfter(_nEndIndex - _nBeginIndex);
	}
	inline gzp_DataType fSubStr(gzUIntX _nBeginIndex, gzUIntX _nEndIndex = ((gzUIntX)-1) ) const {
		gzp_RIni(f_SubStr(_nBeginIndex, _nEndIndex));
	}

	
	
	 gzUInt8* array() const {
	 	return gzp_DataArray;
	}
	
	 ///// WRITING OPERATION
	inline gzp_ReturnType* operator[](gzUIntX _nIndex)const {
		gzp_WRITE_OPERATION_(m.nSubSize);
		return (gzp_ReturnType*)&gzp_DataArray[gzp_SearchIndex(_nIndex) ];
	}

	 //READING
	inline gzp_ReturnType operator()(gzUIntX _nIndex) const {
		return gzp_DataArray[gzp_SearchIndex(_nIndex)];
	}
	

	#endif



	#ifndef gzp_PARAM
		~gzp_DataType(){
			//printf("\nDESTROY %p", gzp_DataArray);
			fRemoveInstance(gzp_Data);
		}
	#else
	
		~gzp_DataType(){
		//	printf("\nUnandle delete"); 
		}
	#endif


	 void fPrintData() const {
	 	printf("%.*s", gzp_DataSize, gzp_DataArray);
	}
	
/*
	/////////////////////////////////////////////////////////////////////////////////////
	 gzResult_Search fDataFind(const gzp_DataType& _pFind, gzUIntX _nFromIndex = 0, gzUInt8 _nStride = 1 ) const {
		_nFromIndex = _nFromIndex * _nStride;
		
	 	//printf("%.*s", gzp_DataSize, gzp_DataArray);
		if(_pFind.gzp_DataSize == 0){return gzResult_Search(false, ( gzp_DataSize)/_nStride, (_nFromIndex)/_nStride,0);}
		gzUIntX _nTo =  gzp_DataSize -  (_pFind.gzp_DataSize - 1);
		for(gzUIntX i = _nFromIndex; i < _nTo; i++){
			if(gzp_DataArray[i] == _pFind.gzp_DataArray[0]){
				if( fSubFind(&gzp_DataArray[i], &_pFind.gzp_DataArray[0],  _pFind.gzp_DataSize )){
					return gzResult_Search(true, (i)/_nStride, ( _nFromIndex)/_nStride,  (i + _pFind.gzp_DataSize)/_nStride );
				}
			}
		}
		return gzResult_Search(false, (gzp_DataSize)/_nStride, (_nFromIndex)/_nStride,0);
	}*/
	
	
	
	
	
	
	

