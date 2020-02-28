//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Lib_GZ/Delegate.h"

//#include "Lib_GZ/Base/SmartPtr/SharedPtr.h"
#include "Lib_GZ/Base/GzTypes.h"


namespace Lib_GZ{namespace Base{class cClass;}}

template <class T> class gzGp;

#if !( defined tHDef_GZ_gzGp)
#define tHDef_GZ_gzGp

#include "Lib_GZ/Base/SmartPtr/SharedCount.h"





//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"


///////////////////////////////////////////////////////////////////////////////////////////////////////////
////// Same as gzSp but without constructor/destructor to be used without STATIC INITIALISER mess /////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
template <class T>
class gzGp {
    public:
   // T obj;
    T* obj;
   // inline gzGp() {};
   
   
 
  // gzGp() = delete; //No STATIC INITIALISER 
   
   /*
  ///////REQUIRED ////////
 	inline gzGp(const gzGp<T> &_oOther){
		obj = _oOther.get();
		addInst();
	}
	
	inline gzGp(gzSharedCount* _objPtr):obj((T*)_objPtr)  {
		addInst();
	};
	*/
	
	inline gzGp& operator = ( const gzSp<T>& _oOther){
		//if(obj != 0) {subInst();};
		subInst();
		obj = _oOther.get();
		addInst();
		return *this;
	}
	template <class R>
	inline gzGp& operator = (const gzSp<R>& _oOther){
	
		subInst();
			obj = _oOther.get(); //Copy
		addInst();
		return *this;
	}

   // inline gzGp(T _obj):obj(_obj){addInst();};
	/////////////////////////////////
	
	inline  void addInst() const {
	 // ((cClass*)(const_cast<gzGp<T>*>(this))->obj)->AddInst();
		if(obj != 0){ //TODO  Removed if using dummy obj
			((gzSharedCount*)obj)->AddInst();
		}
	}
	inline  void subInst() const {
		if(obj != 0){ //TODO Removed if using dummy obj
			((gzSharedCount*)obj)->SubInst();
		}
	}

	inline  void remove() const {
	//	subInst();
		//delete this;
		this->~gzGp();
	}
   
   
  

	//Automatic convert to pointer
	//Example: Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
	//To: 	  Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain);
	template <class R>
	inline operator  R*()const{
	    return obj;
	}

	
	 long use_count() const // nothrow
    {
	//return 0;
		//TODO Test if zero?
		if(obj == 0){return 0;}
        return obj->nSharedCount; 
    }



    inline T* operator->() const
    { return const_cast<T*>(obj);}

	inline bool operator==(gzPtr _nVal) { //Test if is == 0 (null) by example
		return obj == (T*)_nVal;
	}
	inline bool operator!=(gzPtr _nVal) { //Test if is == 0 (null) by example
		return obj != (T*)_nVal;
	}
	
    inline  T* get() const{
        return obj;
     }
/*
    gzGp<T> SpFromThis()
    {
       // GZ_printf("\n\n\nOKI");
    }*/


};







#endif
