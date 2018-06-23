//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Lib_GZ/Delegate.h"

//#include "Lib_GZ/SmartPtr/SharedPtr.h"
#include "Lib_GZ/Base/GzTypes.h"

namespace Lib_GZ{class cClass;}

template <class T> class gzSp;

#if !( defined tHDef_GZ_gzSp)
#define tHDef_GZ_gzSp




//template<class T, class U> gzSp<T> gzSCastSelf( gzSp<U> const & r )
template<class T, class U> gzSp<T> gzSCastSelf( gzSp<U> const & r )
{
	
	/*
    (void) static_cast< T* >( static_cast< U* >( 0 ) );

    typedef typename gzSp<T>::element_type E;


    E * p = static_cast< E* >( r.get() );
    return gzSp<T>( r, p );
	*/
	
		return gzSp<T>( r.get() ); //Add Count ??!!!
		
}





template<class T> gzSp<T> gzSCastSelf( gzAny _ptr) {

    if(_ptr == 0){return  gzSp<T>();}


		return gzSp<T>(_ptr ); //Add Count ??!!!
			 
	/* TODO !!!!!!!!
    if( _ptr->weak_this_.px != 0){
        gzSp<T> r( ((gzWp<T>)_ptr->weak_this_ ));

        return gzSp<T>( r, r.get() );

    }else{ //Objet was created in stack so we create a SharedPtrFrom This
		
		//return gzSp<T>(); //Copy?
      // return  gzSp<T>(new T(*((T*)_ptr))); //Copy, heavy?
	   return  gzSp<T>( static_cast<T*>( _ptr->MemCopy()) ); //Copy v2 //GzDynamic_cast here
    }
*/
}







//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"


template <class T>
class gzSp {
    public:
   // T obj;
    T* obj;
   // inline gzSp() {};
    inline gzSp(Lib_GZ::cClass* _objPtr): obj((T*)_objPtr)  {};

	
	   inline gzSp():obj(0)  {};

    inline gzSp(T _obj):obj(_obj){};

 //   inline gzSp( gzSp<T> _oOther):obj(*_oOther.get()){};

 //  inline gzSp(gzSp<T> _oOther):obj(*_oOther.get()){}; //Copy

 
   inline gzSp& operator = (gzSp<T> _oOther){
      // GZ_fSpAssert(_oOther.get() == 0);
   //    if(_oOther.get() != 0){
            obj = _oOther.get(); //Copy
    //   }else{
            //obj = T( (Lib_GZ::cClass*)(obj->parent.get()) ); //Reset if null
     //  }
        return *this;
    }

	
	
	 long use_count() const // nothrow
    {
        return 0; //TODO TODO !!!!!!!!!!!
    }

/*
    inline T* operator->() const
    { return const_cast<T*>(&obj);}
*/
    inline T* operator->() const
    { return const_cast<T*>(obj);}


    inline  T* get() const{
        return obj;
     }
/*
    inline  T* get(){
        return &obj;
     }*/

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




/*
template<class T, class U> gzSp<T> gzSCast( gzWp<U> const & r ) //GZ_NoExcept
{
    (void) static_cast< T* >( static_cast< U* >( 0 ) );

    typedef typename gzSp<T>::element_type E;

    E * p = static_cast< E* >( r.get() );

    return gzSp<T>(  r.lock(), p );
}

*/


template<class T> gzSp<T> gzSCast( gzAny _ptr ) //GZ_NoExcept
{
   // (void) static_cast< T* >( static_cast< U* >( 0 ) );

 //   typedef typename gzSp<T>::T E;


    T* p = static_cast< T* >( _ptr );
    //return gzSp<T>( _pOri, p );
    return gzSp<T>( p );
}


template<class T, class U> gzSp<T> gzSCast( gzSp<U> const & _pOri ) //GZ_NoExcept
{
   // (void) static_cast< T* >( static_cast< U* >( 0 ) );

 //   typedef typename gzSp<T>::T E;


    T* p = static_cast< T* >( _pOri.get() );
    //return gzSp<T>( _pOri, p );
    return gzSp<T>( p );
}






#endif
