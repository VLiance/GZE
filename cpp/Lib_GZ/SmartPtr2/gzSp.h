//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Lib_GZ/Delegate.h"


namespace Lib_GZ{class cClass;}

template <class T> class gzSp;

#if !( defined tHDef_GZ_gzSp)
#define tHDef_GZ_gzSp

//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"


template <class T>
class gzSp {
    public:
    T obj;
   // inline gzSp() {};
    inline gzSp(Lib_GZ::cClass* _parent):obj(_parent)  {};

    inline gzSp(T _obj):obj(_obj){};

   // inline gzSp( gzSp<T> _oOther):obj(*_oOther.get()){};

 //  inline gzSp(gzSp<T> _oOther):obj(*_oOther.get()){}; //Copy

   inline gzSp& operator = (gzSp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
       if(_oOther.get() != 0){
            obj = *_oOther.get(); //Copy
       }else{
            obj = T( (Lib_GZ::cClass*)(obj.parent.get()) ); //Reset if null
       }
        return *this;
    }


    inline T* operator->() const
    { return const_cast<T*>(&obj);}



    inline  T* get(){
        return &obj;
     }

    gzSp<T> SpFromThis()
    {
       // printf("\n\n\nOKI");
    }

     /*
	 inline void spFromThis(){
        return &obj;
     }
     */

    inline ~gzSp(){};
};


#endif
