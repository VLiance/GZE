//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

/////////////////////////////////////////////////
#include "Lib_GZ/Base/gzString.h"


//#define gzStaticU8(_sName, _aData)  static gzStr8(  gzData8(_aData)  ) _sName;
gzStaticU8(gzNullStr,"");

gzStr8 gzStr16::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF16_2_UTF8();
	return _oNew;
}	
gzStr8 gzStr32::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF32_2_UTF8();
	return _oNew;
}		
gzStr8 _gzeStr16::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF16_2_UTF8();
	return _oNew;
}	
gzStr8 _gzeStr32::fToUTF8() const{
	gzStr8 _oNew((gzStr8*)this);
	_oNew.f_UTF32_2_UTF8();
	return _oNew;
}	
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
gzStr16 _gzeStr8::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF8_2_UTF16();
	return _oNew;
}	
 gzStr16 _gzeStr32::fToUTF16() const{
	gzStr16 _oNew((gzStr16*)this);
	_oNew.f_UTF32_2_UTF16();
	return _oNew;
}	
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
}	
gzStr32 _gzeStr8::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF8_2_UTF32();
		return _oNew;
}	
gzStr32 _gzeStr16::fToUTF32() const {
		gzStr32 _oNew((gzStr32*)this);
		_oNew.f_UTF16_2_UTF32();
		return _oNew;
}	
//////////////////////////////////////////

	
gzStr8 gzStrUI(gzUInt64 _nEntier){
	
	gzUInt _nSize = 0;
    gzUInt8* _aArray;
    if(_nEntier != 0){

        gzUInt8 intBuff[20];// 18446744073709551615 (0xffffffffffffffff)  --> 20char

        while (_nEntier > 0){
            intBuff[_nSize] = _nEntier % 10 + 0x30; //Get dizaine
            _nEntier /= 10;
            _nSize ++;
        }
		
		gzStr8 _sNewStr( ::GZ::fDataAlloc(_nSize, _nSize));
			
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
		_aArray  = _sNewStr.m.aData->aTab;
		
        //_aArray[0] = 0;
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
        return gzU8("");
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
        return gzU8("");
    }

	gzStr8 _sNewStr( ::GZ::fDataAlloc(_nCount, _nCount));
	  gzUInt8* _aNew  = _sNewStr.m.aData->aTab;
		
    memcpy( _aNew, _Array, _nCount  * sizeof(gzUInt8));
  
   return _sNewStr;
}




