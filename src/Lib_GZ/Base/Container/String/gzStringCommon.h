//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



#define ASS 1 
	
	#undef gzp_Additional_fAssign2
	#undef gzp_SearchIndex
	#undef gzp_RelSize 
	#undef gzp_RelSizeO 
	
	#undef gzp_Stride
	//#define gzp_Stride (sizeof(ASS) >> 1)
	#define gzp_Stride 0
	
	#define gzp_RelSize (gzp_DataSize >> gzp_Stride)
	#define gzp_RelSizeO gzp_DataSize >> gzp_Stride
	
//	#define gzp_SearchIndex _nIndex = _nIndex << m.aData->nStride;
	#define gzp_SearchIndex(Ex) (Ex << gzp_Stride)
	//#define gzp_SearchIndex ;
	//#define gzp_DataRelSize (gzp_DataSize >>  (sizeof(T) >> 1) )
	//#define gzp_DataRelSize (gzp_DataSize >>  (gzp_nByte >> 1) )
	
	#undef  gzp_DataRelSize
	#define gzp_DataRelSize(_nFullSize) ((_nFullSize) >>  (gzp_nByte >> 1) )
	
	//#undef  gzp_DataSizeFull
	//#define gzp_DataSizeFull(_nRelSize) ((_nRelSize) <<  (gzp_nByte >> 1) )
	#undef GzS 
	#define GzS (gzp_nByte)

//	#define gzp_Additional_fAssign2 gzDtThis->nPos = 0;gzDtThis->nIndex = 0;
	/*
	#define gzp_IsUTF8 (sizeof(ASS) == 1)
	#define gzp_IsUTF16 (sizeof(ASS) == 2)
	#define gzp_IsUTF32 (sizeof(ASS) == 4)
	*/
	
	#include "DataCowBase.h"
	#include "Lib_GZ/Base/Container/Array/ArrayContainerCommun.h"
	
	
	
	#define gzp_NewAssing(_Func, _nMaxPossibleSize, _nStride)\
				gzDataRC* _aNewData =   GZ::fDataAlloc( _nMaxPossibleSize, _nMaxPossibleSize);\
				gzUIntX _nNewSize = _Func;\
				fRemoveInstance(m.aData);   \
				fAssignArray(_aNewData); \
				gzDtThis->m.aData->nSize = _nNewSize;\
				gzDtThis->m.nSubSize = _nNewSize;
			//	m.aData->nStride = _nStride; \
			
			
			
			
			
			
			
	/////////// TO UTF8 //////////
	inline void f_UTF16_2_UTF8() const{ //Protected?
		gzp_NewAssing( fConvertUTF16toUTF8( (gzUInt16*)m.aSubTab, gzp_DataSize, _aNewData->aTab) ,  m.nSubSize * 2 , 0); 
	}
	inline void f_UTF32_2_UTF8() const{ //Protected?
		//printf("Shift:%d", (sizeof(T) >> 1)); 
		//printf("size:%d", gzp_DataSize); 
		gzp_NewAssing( fConvertUTF32toUTF8(  (gzUInt32*)m.aSubTab, gzp_DataSize , _aNewData->aTab),  m.nSubSize, 0); 
	}
	
    #ifndef  gzp_IsUTF8
	gzStr8 fToUTF8() const;	
	 #else
		inline gzStr8 fToUTF8() const{return *this;} //Just to be generic
		inline const unsigned char* get() const {return gzp_DataArray;}
	#endif
	////////////////////////////////////
	
	/////////// TO UTF16 //////////
	inline void f_UTF8_2_UTF16() const{ //Protected?
	
		gzp_NewAssing(fConvertUTF8toUTF16( (gzUInt8*)m.aSubTab, gzp_DataSize ,(gzUInt16*)_aNewData->aTab),  m.nSubSize * 4, 1); 
	}
	inline void f_UTF32_2_UTF16() const{ //Protected?
		gzp_NewAssing( fConvertUTF32toUTF16( (gzUInt32*)m.aSubTab, gzp_DataSize ,(gzUInt16*)_aNewData->aTab),  m.nSubSize, 1); 
	}

	 #ifndef  gzp_IsUTF16
	 gzStr16 fToUTF16() const;
	#else
		inline gzStr16 fToUTF16() const{return *this;} //Just to be generic
		inline const wchar_t* get() const {return (wchar_t*)gzp_DataArray;}
	#endif
	////////////////////////////////////
	
	/////////// TO UTF32 //////////
	inline void f_UTF8_2_UTF32() const{ //Protected?
		gzp_NewAssing(fConvertUTF8toUTF32( (gzUInt8*)m.aSubTab, gzp_DataSize ,(gzUInt32*)_aNewData->aTab),  m.nSubSize * 4, 1); 
	}
	inline void f_UTF16_2_UTF32() const{ //Protected?
		gzp_NewAssing( fConvertUTF16toUTF32( (gzUInt16*)m.aSubTab, gzp_DataSize ,(gzUInt32*)_aNewData->aTab),  m.nSubSize * 2, 2); 
	}
	
	#ifndef  gzp_IsUTF32
	gzStr32 fToUTF32() const;
	#else
		inline gzStr32 fToUTF32() const{return *this;} //Just to be generic
	#endif
	////////////////////////////////////

	 gzStr8 fToCStr() const;
	 gzStr16 fToWStr() const;
	/*
	inline gzStr8 fToCStr() const {
		return 	fToUTF8().fFinalize();
	}
	inline gzStr16 fToWStr() const {
		return 	fToUTF16().fFinalize();
	}*/
	
	
	
	
	//////////////////////////
	 void fPrint() const {
		#ifdef gzp_IsUTF8
			fPrintData();
		#endif

		#ifdef gzp_IsUTF16
			gzStr8 _oNew((gzStr8*)gzDtThis);
			_oNew.f_UTF16_2_UTF8();
			_oNew.fPrintData();
		#endif
		
		#ifdef gzp_IsUTF32
			gzStr8 _oNew((gzStr8*)gzDtThis);
			_oNew.f_UTF32_2_UTF8();
			_oNew.fPrintData();
		#endif
	}
	
	
	//unsigned char* fToChar(gzUInt &_nSize) const { //TODO copy to be safe?
	//}
	

	inline unsigned char* fGetArray() const {
		return gzp_DataArray;
	}

	inline unsigned char* fGetArray(gzUInt &_nSize) const { //TODO copy to be safe?
		_nSize = gzp_DataSize;
		return gzp_DataArray;
	}

	inline gzUInt8* fToChar(gzUInt8* _aBufferArray, gzUInt _nBufferSize) const { //TODO FixARRAY
		//GzAssert( _nBufferSize > gzp_DataSize + 4, "Buffer array too small"); //UTF32 4 byte 
		memcpy( _aBufferArray, gzp_DataArray, gzp_DataSize);
		((gzUInt32*)(_aBufferArray))[gzp_DataSize >> 2] = 0; //Zero 4 bytes after (UTF8 2 UTF32)

		return (gzUInt8*)_aBufferArray;
	}

	inline gzp_DataType fFinalize() const { //TODO FixARRAY
		return 	fAdd( gzZeroStrChar );
	}
	
	//Cast to standard string
	// #define GZ_WStr(_sString) ((WCHAR*)_sString.fToUTF16().fFinalize().fGetArray())
	// #define GZ_CStr(_sString) ((char*)_sString.fToUTF8().fFinalize().fGetArray())
	

	/*
	#define GZ_WStr(_sString) (_sString.fToUTF16().fFinalize())
	#define GZ_CStr(_sString) (_sString.fToUTF8().fFinalize())
	
	#define GZ_WStr_get(_sString) ((WCHAR*)_sString.fToUTF16().fFinalize().get()) //Use only as RValue
	#define GZ_CStr_get(_sString) ((char*)_sString.fToUTF8().fFinalize().get())   //Use only as RValue
	*/
	
	inline gzArray<gzp_DataType> fSplit(const gzp_DataType& _sSplit) const {
	   gzArray<gzp_DataType> _aNewArrray;
		gzResult_Search _rFind(false, 0,0,0);
		
	   while( (_rFind = fDataFind(_sSplit, _rFind.nValEnd)) ){
			_aNewArrray.fPush( fSubStr( _rFind.nFrom* GzS, _rFind.nVal* GzS) );
	   }
	  
	   _aNewArrray.fPush( fSubStr( _rFind.nFrom* GzS, _rFind.nVal* GzS) );
		return 	_aNewArrray;
	}
	
	gzp_Type fReplaceAll(const gzp_Type& _pFind, const gzp_Type& _pRemplace, gzUIntX _nFromIndex = 0) const {
			gzp_Type _sResult;
			gzArray<gzp_DataType> _aSplitArrray = fSplit(_pFind);
			
			gzUIntX i;
			for(i = 0; i < _aSplitArrray.GnSize()-1; i++ ){
				_sResult +=  _aSplitArrray[i] + _pRemplace;
			}
			_sResult +=  _aSplitArrray[i];
			return _sResult;
	 }
	 
	 
	 
	 
	 gzUInt fToUInt() const { //TODO Only gzStr8 => convert? 
		gzInt c = 0;
		gzInt sign = 0;
		gzInt x = 0;
		gzUInt8* p = &gzp_DataArray[0];


		for(c = *(p++); (c < 48 || c > 57); c = *(p++)) {
			if (c == 45) {
				sign = 1; c = *(p++); break;
			}
		}; // eat whitespaces and check sign

		for(; c > 47 && c < 58; c = *(p++)){
			x = (x << 1) + (x << 3) + c - 48;
		}

		return sign ? -x : x;
	}
		 
	 
	 
	/*
	 gzStr fReplace(const gzp_Type& _pFind, const gzp_Type& _pRemplace, gzUIntX _nFromIndex = 0, gzResult_Search& _rFind ) const {
			gzStr _sNewStr;
			//gzResult_Search _rFind(false, 0,0,0);
		   if( (_rFind = fDataFind(_sSplit, _nFromIndex, GzS)) ){
				_sNewStr += fSubStr( _rFind.nFrom* GzS, _rFind.nVal* GzS);
		   }
			_sNewStr +=  fSubStr( _rFind.nFrom* GzS, _rFind.nVal* GzS);
			 
			return _sNewStr;
	 }
 */


	/*
	..........................................
	inline gzUInt8* fTo_C_Str(gzUInt8* _aBufferArray, gzUInt _nBufferSize) const { //TODO FixARRAY
		return (gzUInt8*)gzp_DataArray;
	}
	*/
	
	
	
	/*gzUIntX nPos;
	gzUIntX nIndex;
	
	inline gzUInt8 fU8_next(gzUInt8* _sSrc) {
		return trailingBytesForUTF8[*_sSrc] + 1;
	}
	inline gzInt8 fU8_prev(gzUInt8* _sSrc) {
		int i = 0;
		(void)(isutf(_sSrc[--i]) || isutf(_sSrc[--i]) ||
			   isutf(_sSrc[--i]) || --i);
		return i;
	}

	inline void fNext(){
		nIndex++;
		nPos += fU8_next( &gzp_DataArray[nPos] );
	//	printf("val %d", );
	
	}
		
	inline void fPrev(){
		nIndex--;
		nPos += fU8_prev( &gzp_DataArray[nPos] );
			//	printf("aassss ");
	}
	*/
	
	
