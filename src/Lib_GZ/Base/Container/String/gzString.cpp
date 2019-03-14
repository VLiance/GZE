//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

/////////////////////////////////////////////////
#include "gzString.h"
#include "Lib_GZ/Base/Math/Math.h"


//#define gzStaticU8(_sName, _aData)  static gzStr8(  gzData8(_aData)  ) _sName;
//gzStaticU8(gzNullStr,"");
//gzData8( "aaa" );

//static gzStr8(  gzData8( "aaa" )  ) gzNullStr;

	// static gzStr8( gzDataRC{(gzUInt8*)( "aaa"),(gzUIntX)(sizeof( "aaa")-1), (gzUIntX)(sizeof( "aaa")-1)  ,0,0,0,0}  ) gzNullStr;

//gzConstData(gzUInt8*, gzNullStr_Data "aa");

//const char* gzNullStr_Data[] = {"aaa"};
//gzDataRC  gzNullStr_RC = GzToDataRC_const(gzNullStr_Data);

//gzDataRC  gzNullStr_RC = GzToDataRC_const("aaa");
//gzStr8 gzNullStr(&gzNullStr_RC) ;
//gzData_U8(gzNullStr, "");



//#define gzNullStr_dat = ((gzDataRC){(gzUInt8*)(""),(gzUIntX)sizeof(""),     (gzUIntX)sizeof(""),0,0,0,0})
//gzStr8 gzNullStr(&gzNullStr_dat);
//#define gzData_U8(_sName, _aData)   gzDataRC _sName##_dat = GzToDataRC_const(gzConcat(gzS8 ,_aData));  gzStr8 _sName(&_sName##_dat);


gzStr8 gzStr16::fToUTF8() const{

	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF16_2_UTF8();
	return _oNew;
}	
gzStr8 gzStr32::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF32_2_UTF8();
	return _oNew;
}	/*	
gzStr8 _gzeStr16::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF16_2_UTF8();
	return _oNew;
}	
gzStr8 _gzeStr32::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF32_2_UTF8();
	return _oNew;
}	*/
////////////////////////////////////////////////
gzStr16 gzStr8::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF8_2_UTF16();
	return _oNew;
}	

 gzStr16 gzStr32::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF32_2_UTF16();
	return _oNew;
}	
/*
gzStr16 _gzeStr8::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF8_2_UTF16();
	return _oNew;
}	
 gzStr16 _gzeStr32::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF32_2_UTF16();
	return _oNew;
}	*/
/////////////////////////////////////////////
gzStr32 gzStr8::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF8_2_UTF32();
		return _oNew;
}	
gzStr32 gzStr16::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF16_2_UTF32();
		return _oNew;
}	/*
gzStr32 _gzeStr8::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF8_2_UTF32();
		return _oNew;
}	
gzStr32 _gzeStr16::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF16_2_UTF32();
		return _oNew;
}	*/
//////////////////////////////////////////

	
gzStr8 gzStrUI(gzUInt64 _nVal){
	
	gzUInt _nSize = 0;
    gzUInt8* _aArray;
    if(_nVal != 0){

        gzUInt8 intBuff[20];// 18446744073709551615 (0xffffffffffffffff)  --> 20char

        while (_nVal > 0){
            intBuff[_nSize] = _nVal % 10 + 0x30; //Get dizaine
            _nVal /= 10;
            _nSize ++;
        }
	
		gzStr8 _sNewStr( ::GZ::fDataAlloc(_nSize, _nSize));
		//_sNewStr.m.aData->nInst = 1;
		
      //  _aArray  = GZ_fSafeMalloc( (_nSize + 2) ,gzUInt8);
        _aArray  = _sNewStr.m.aData->aTab;

        //Reverse order
        int i = 0;
        int j = _nSize;
        while ( i < _nSize){
            j --;
            _aArray[i] = intBuff[j];
            i++;
        }


		return _sNewStr;
    }else{
        //Value is 0 then  set "0" string
      //  _aArray = GZ_fSafeMalloc( 3 , gzUInt8);
		gzStr8 _sNewStr( ::GZ::fDataAlloc(1, 1));
	//	_sNewStr.m.aData->nInst = 1;
		
		_aArray  = _sNewStr.m.aData->aTab;
		
        //_aArray[0] = 0;
        _aArray[0] = 0x30;
      //  _aArray[2] = 0;
        _nSize = 1;
		return _sNewStr;
    }
  //  return gzStr(_aArray, _nSize, false);
}
gzStr8 gzStrI(gzInt64 _nVal) {

    gzUInt _nSize = 0;
    gzUInt8* _aArray;

    if(_nVal != 0){

        gzInt i;

        //Check if negative
        if(_nVal > 0){
            i = 0;
            _nSize = 0;
        }else{
            i = 1;
            _nSize = 1;
            _nVal *= -1;
        }

        //TSTR intBuff[10]; // uint range	0 to 4,294,967,295  --> 10char
        gzUInt8 intBuff[11]; // uint range	–2 147 483 648 to 2 147 483 647  --> 11char

        while (_nVal != 0){
            intBuff[_nSize] = _nVal % 10 + 0x30; //Get dizaine
            _nVal /= 10;
            _nSize ++;
        }

        //_aArray = GZ_fSafeMalloc( (_nSize + 2) , gzUInt8);
		gzStr8 _sNewStr( ::GZ::fDataAlloc(_nSize, _nSize));
		_aArray  = _sNewStr.m.aData->aTab;
		
      //  _aArray[0] = 0;
      //  gzUInt8* _aNumbers = &_aArray[1];
        gzUInt8* _aNumbers = &_aArray[0];

        //Negative
        if(i == 1){
            _aNumbers[0] = 0x2D; // -
        }

        //Reverse order
        gzInt j = _nSize;
        while ( i < _nSize){
            j --;
            _aNumbers[i] = intBuff[j];
            i++;
        }

		return _sNewStr;
    }else{
        //Value is 0 then  set "0" string
       //  _aArray = GZ_fSafeMalloc( 3 , gzUInt8);
		gzStr8 _sNewStr( ::GZ::fDataAlloc(1, 1));
		_aArray  = _sNewStr.m.aData->aTab;
		

      //  _aArray[0] = 0;
       // _aArray[1] = 0x30;
        _aArray[0] = 0x30;
      //  _aArray[2] = 0;
        _nSize = 1;
		return _sNewStr;
    }

  //  return gzStr(_aArray, _nSize, false);
}

//Todo Test
gzStr8 gzStrC(const char* _Array){
    if(_Array == 0){
        return gzU8("");//gzNullStr?
    }
    gzUInt _nCount = 0;

	do{
		_nCount++;
	}while(_Array[_nCount] != 0);


	gzStr8 _sNewStr( ::GZ::fDataAlloc(_nCount, _nCount));
	  gzUInt8* _aNew  = _sNewStr.m.aData->aTab;
		
    memcpy( _aNew, _Array, _nCount  * sizeof(gzUInt8));
  
   return _sNewStr;
}
//Todo Test
gzStr8 gzStrC(const char* _Array, gzUInt _nCount){
    if(_Array == 0){
        return gzU8("");//gzNullStr?
    }

	gzStr8 _sNewStr( ::GZ::fDataAlloc(_nCount, _nCount));
	  gzUInt8* _aNew  = _sNewStr.m.aData->aTab;
		
    memcpy( _aNew, _Array, _nCount  * sizeof(gzUInt8));
  
   return _sNewStr;
}




gzStr8 gzStrF(gzFloat64 _nFloat, gzUInt8 _nbCharAfter){


	char buffer [24];//24 double / Single 16 --> Forced precision --> TODO
	int n=sprintf(buffer, "%0.2f", _nFloat);
	return 	gzU8_Sized(buffer, n);
	
//////////////////////////////////////
////////// Not precise : (TODO) -->
//////////////////////////////////////
    if(_nbCharAfter > 8){
        _nbCharAfter = 8;
    }
    gzUInt _nVal;
	 gzStr _sSign;
	if(_nFloat >=  0){
		_nVal = _nFloat;
	}else{
		_sSign = gzU8("-");
		_nVal = _nFloat * -1;
	}

   // _nbCharAfter++; //Dot

    gzStr _sFloatInt = gzStrUI(_nVal);
   // gzUInt _nSize = _sFloat.fSize();
   // gzUInt _nNewSize = _nSize  + _nbCharAfter;
	
	
	
	gzFloat64 _nTest = (1.0 + _nFloat - gzFloat64(_nVal)) * ::Lib_GZ::Base::Math::pMath::fPow(gzFloat64(10.0), (_nbCharAfter));
	gzUInt64 _nAfterDot = Lib_GZ::Base::Math::pMath::fFloatToInt(_nTest ); //Limit to 8 _nbCharAfter TODO
    gzStr8 _sAfterDot = gzStrUI(_nAfterDot);
	
	//_sAfterDot.fShinkBefore(1);
	 return _sSign + _sFloatInt + gzU8(".") + _sAfterDot.fSubStr(1, _nbCharAfter+1);
	  
	  
	  
	  
	  
	  
	  
    //New array with enough space
   // gzUInt8* _aNewArray = GZ_fSafeMalloc( (_nNewSize + 2 ), gzUInt8);

   /*
	gzStr8 _sNewStr( ::GZ::fDataAlloc(_nNewSize, _nNewSize));
	_aArray  = _sNewStr.m.aData->aTab;
	
		
 //   _aNewArray[0] = 0;
  //  gzUInt8* _aArray = &_aNewArray[1];

    memcpy( _aArray,  _sFloat.sStr->array, _nSize * sizeof(gzUInt8));

    _aArray[_nSize] = L'.';

    gzFloat64 _nTest = (1.0 + _nFloat - gzFloat64(_nVal)) * Lib_GZ::Base::Math::pMath::fPow(gzFloat64(10.0), (_nbCharAfter));
	gzUInt64 _nAfterDot = Lib_GZ::Base::Math::pMath::fFloatToInt(_nTest ); //Limit to 8 _nbCharAfter TODO
    gzStr _sAfterDot = gzStrUI(_nAfterDot);

    memcpy(_aArray + _nSize + 1, _sAfterDot.sStr->array+2, (_sAfterDot.GnSize() -1)* sizeof(gzUInt8));
    GZ_fSafeFree(_sFloat.sStr->array);

    _aArray[_nNewSize] = 0; //0 is the end of string
    _sFloat.sStr->array = _aNewArray;
    _sFloat.sStr->end = _aNewArray + _nNewSize + 1;
    _sFloat.pCurrPos = (gzUInt8*)_sFloat.sStr->array;
*/
  
}

gzStr8 gzStrB(gzBool _bVal){
	if(_bVal){
		return gzConstStr_true;
	}else{
		return gzConstStr_false;
	}
}

