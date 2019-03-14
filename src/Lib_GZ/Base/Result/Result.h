//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_Lib_GZ_Base_Result_Result)
#pragma once
#define tHDef_Lib_GZ_Base_Result_Result

#include "Lib_GZ/Base/GzTypes.h"
namespace Lib_GZ{namespace Base{namespace Result{namespace Result{


	//Structure Implementation

	//Unit creation
	//Unit destruction
	//Unit array write

}

class tApi_Lib_GZ cResult : gzAny {

	public:


		//Var
		gzBool bValid;
		
		inline cResult():bValid(false){};
		inline cResult(gzBool _bValid):bValid(_bValid)
		{
		//Special var ini
		};
		//void  Constructor();
		inline operator gzBool(){
		  return bValid;
	   }
	   inline gzBool operator!=(const gzBool& _bOther){
			if(bValid != _bOther){return true;}return false;
	   }
	   inline gzBool operator!=(const gzInt& _bOther){
			if(bValid != (gzBool)_bOther){return true;}return false;
	   }
	   
	   inline gzBool operator==(const gzBool& _bOther){
			if(bValid == _bOther){return true;}return false;
	   }
	   inline gzBool operator==(const gzInt& _bOther){
			if(bValid == (gzBool)_bOther){return true;}return false;
	   }
   
		inline cResult(const cResult& _o, gzBool _bDCpy = false) :  bValid(_o.bValid){
		};
		//virtual gzAny Copy(gzBool _bDeepCopy = false){return cResult(*this, _bDeepCopy);};
		inline  ~cResult(){};

		//Static singleton function

	private:

		//Var

};

namespace Result{
}}}}

/*
struct cResult : gzAny{
	gzBool bValid;
	inline cResult(gzBool _bValid):bValid(_bValid){};
};*/

struct cResult_UInt :  Lib_GZ::Base::Result::cResult{
	gzUInt nVal;
	inline cResult_UInt():Lib_GZ::Base::Result::cResult(){};
	inline cResult_UInt(gzUInt _nVal):cResult(true), nVal(_nVal) {};
	inline operator gzInt(){
      return nVal;
   }
};




#endif
