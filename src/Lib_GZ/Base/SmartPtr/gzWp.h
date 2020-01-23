//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace Lib_GZ{namespace Base{class cClass;}}

template <class T> class gzWp;


#if !( defined tHDef_GZ_gzWp)
#define tHDef_GZ_gzWp



#include "Lib_GZ/Base/SmartPtr/SharedCount.h"


//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"


template <class T>
class gzWp {
    public:
   T* obj;
   
   
	///////REQUIRED ////////
 	inline gzWp(const gzWp<T> &_oOther){
		obj = _oOther.get();
		addInst();
	}
	

	inline gzWp& operator = ( const gzWp<T> _oOther){
	
		_oOther.addInst();
		subInst();
		obj = _oOther.get();
		

		/*
		if(obj != 0) {subInst();};
		obj = _oOther.get();
		addInst();*/
		return *this;
	}
	/////////////////////////////////
	
	inline gzWp(gzSharedCount* _objPtr):obj((T*)_objPtr)  {
		addInst();
	};
	inline gzWp():obj(0)  {};
	
   // inline gzWp(T _obj):obj(_obj){addInst();};
	/////////////////////////////////
	
	inline  void addInst() const {

	//	((Lib_GZ::Base::cClass*)obj)->AddInst();
	}
	inline  void subInst() const {
	//	((Lib_GZ::Base::cClass*)obj)->SubInst();
	}

	inline  void remove() const {
		subInst();
	}


 //  nInstCount
  
   // inline gzWp() {};
   
   // inline gzWp( gzWp<T> _oOther):val(*_oOther.get()){};

//  inline gzWp(gzWp<T> _oOther):val(*_oOther.get()){}; //Copy

/*
   inline gzWp& operator = (gzSp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
   //    if(_oOther.get() != 0){
            obj = _oOther.get(); //Copy
    //   }else{
            //obj = T( (Lib_GZ::Base::cClass*)(obj->parent.get()) ); //Reset if null
     //  }
        return *this;
    }*/

/*
   inline gzWp& operator = (gzWp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
       if(_oOther.get() != 0){
            val = *_oOther.get(); //Copy
       }else{
            val = T( (Lib_GZ::Base::cClass*)(val.parent.get()) ); //Reset if null
       }
        return *this;
    }*/

	//Automatic convert to pointer
	//Example: Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
	//To: 	  Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain);
	template <class R>
	inline operator  R*()const{
	    return obj;
	}
	
	
	
    inline T* operator->() const
    { return const_cast<T*>(obj);}



    inline  T* get() const {
        return obj;
     }

    gzWp<T> SpFromThis(){
		
        //printf("\n\n\nOKI");
    }

     /*
	 inline void spFromThis(){
        return &val;
     }
     */


	 
	 
	 
	 
    inline ~gzWp(){
		subInst();
	};
};

	 
 template<class T, class U> gzSharedCount*  gzSCast( gzWp<U> const & _pOri ){ //GZ_NoExcept

	return _pOri;
}
		 


#endif
