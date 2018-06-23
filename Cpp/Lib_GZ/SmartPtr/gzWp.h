//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace Lib_GZ{class cClass;}

template <class T> class gzWp;

#if !( defined tHDef_GZ_gzWp)
#define tHDef_GZ_gzWp

//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"


template <class T>
class gzWp {
    public:
   T* obj;
   // inline gzWp() {};
    inline gzWp(Lib_GZ::cClass* _objPtr):obj(_objPtr)  {};

	   inline gzWp():obj(0)  {};

    inline gzWp(T _obj):obj(_obj){};

   // inline gzWp( gzWp<T> _oOther):val(*_oOther.get()){};

//  inline gzWp(gzWp<T> _oOther):val(*_oOther.get()){}; //Copy


   inline gzWp& operator = (gzSp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
   //    if(_oOther.get() != 0){
            obj = _oOther.get(); //Copy
    //   }else{
            //obj = T( (Lib_GZ::cClass*)(obj->parent.get()) ); //Reset if null
     //  }
        return *this;
    }

/*
   inline gzWp& operator = (gzWp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
       if(_oOther.get() != 0){
            val = *_oOther.get(); //Copy
       }else{
            val = T( (Lib_GZ::cClass*)(val.parent.get()) ); //Reset if null
       }
        return *this;
    }*/


    inline T* operator->() const
    { return const_cast<T*>(obj);}



    inline  T* get(){
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

    inline ~gzWp(){};
};


#endif
