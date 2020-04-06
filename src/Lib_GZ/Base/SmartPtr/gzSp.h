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

template <class T> class gzSp;

#if !( defined tHDef_GZ_gzSp)
#define tHDef_GZ_gzSp

#include "Lib_GZ/Base/SmartPtr/SharedCount.h"

/*
//template<class T, class U> gzSp<T> gzSCastSelf( gzSp<U> const & r )
template<class T, class U> gzSp<T> gzSCastSelf( gzSp<U> const & r )
{
	
   // (void) static_cast< T* >( static_cast< U* >( 0 ) );
   // typedef typename gzSp<T>::element_type E;
   // E * p = static_cast< E* >( r.get() );
  // return gzSp<T>( r, p );
		return gzSp<T>( r.get() ); //Add Count ??!!!
		
}
*/



/*
template<class T> gzSp<T> gzSCastSelf( gzSharedCount* _ptr) {
//template<class T> gzSp<T> gzSCastSelf( void* _ptr) {

    if(_ptr == 0){
		//GZ_printf("\nNull gzSCastSelf!");
		return  gzSp<T>();
	
	}


	return gzSp<T>((T*)_ptr ); //Add Count ??!!!
	
			 
	// TODO !!!!!!!!
   // if( _ptr->weak_this_.px != 0){
    //    gzSp<T> r( ((gzWp<T>)_ptr->weak_this_ ));
    //    return gzSp<T>( r, r.get() );
   // }else{ //Objet was created in stack so we create a SharedPtrFrom This
				////return gzSp<T>(); //Copy?
			//  // return  gzSp<T>(new T(*((T*)_ptr))); //Copy, heavy?
	//   return  gzSp<T>( static_cast<T*>( _ptr->MemCopy()) ); //Copy v2 //GzDynamic_cast here
   // }
}*/

template<class T> gzSharedCount* gzSCastSelf( gzSharedCount* _ptr) { //disable
	return _ptr;
}



//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/GzTypes.h"






template <class T>
class gzSp {
    public:
   // T obj;
    T* obj;
   // inline gzSp() {};
   
   
   
 
   
  ///////REQUIRED ////////
 	inline gzSp(const gzSp<T> &_oOther){
		obj = _oOther.get();
		addInst();
	}
	/*
	 inline gzSp(gzSp<T> &&_oOther){
		obj = _oOther.get();
	}*/
	

	inline gzSp& operator = ( const gzSp<T>& _oOther){
		//if(obj != 0) {subInst();};
		_oOther.addInst();
		subInst();
		obj = _oOther.get();
		
		return *this;
	}
	/*
	inline gzSp& operator = ( const gzSp<T>&& _oOther){
		//if(obj != 0) {subInst();};
		//subInst();
		obj = _oOther.get();
		//addInst();
		return *this;
	}*/
	////////*/////////////////////////
	
	
	
	template <class R>
	inline gzSp& operator = (const gzSp<R>& _oOther){
	
		_oOther.addInst();
		subInst();
			obj = _oOther.get(); //Copy
	
		return *this;
	}
	/*
	template <class R>
	inline gzSp& operator = (gzSp<R>&& _oOther){
	
			obj = _oOther.get(); //Copy
		return *this;
	}*/
	
	/*
	
	template <class R>
	inline gzSp& operator = (gzSp<R> _oOther){
	
		subInst();
		//GZ_printf("other %p",_oOther.get() );
	  // GZ_fSpAssert(_oOther.get() == 0);
	//    if(_oOther.get() != 0){
			obj = _oOther.get(); //Copy
	//   }else{
			//obj = T( (Lib_GZ::Base::cClass*)(obj->parent.get()) ); //Reset if null
	 //  }
		addInst();
	 
	 //		GZ_printf("obj %p",obj );
		return *this;
	}*/
	
	
	
	inline gzSp(gzSharedCount* _objPtr):obj((T*)_objPtr)  {
		addInst();
	};
	inline gzSp():obj(0)  {};
	
   // inline gzSp(T _obj):obj(_obj){addInst();};
	/////////////////////////////////
	
	inline  void addInst() const {
	 // ((cClass*)(const_cast<gzSp<T>*>(this))->obj)->AddInst();
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
		this->~gzSp();
	}
   
   
   
   
   /*
   // inline gzSp(Lib_GZ::Base::cClass* _objPtr): obj((T*)_objPtr)  {};
    inline gzSp(gzSharedCount* _objPtr): obj((T*)_objPtr)  {
		//GZ_printf("\n  **obj %p \n",obj );
		
	};
	inline gzSp():obj(0)  {};

    inline gzSp(T _obj):obj(&_obj){
		//GZ_printf("\n  &bj %p \n",obj );
	};
*/
 //   inline gzSp( gzSp<T> _oOther):obj(*_oOther.get()){};

 //  inline gzSp(gzSp<T> _oOther):obj(*_oOther.get()){}; //Copy

	

	//Automatic convert to pointer
	//Example: Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
	//To: 	  Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain);
	template <class R>
	inline operator  R*()const{
	    return obj;
	}
	
	/*
	inline operator  Lib_GZ::Base::cClass *()const{
	     return obj;
	}*/
	
	/* **Remplaced by inline gzSp& operator = (gzSp<R> _oOther){
	//Convert any Type to Lib_GZ::Base::cClass because all inherint of it
	//Example: candidate function not viable: no known conversion from 'gzSp<Lib_GZ::Sys::cDebug>' to 'gzSp<Lib_GZ::Base::cClass>' for 1st argument
	//Version #1
	//inline operator  gzSp<Lib_GZ::Base::cClass>()const{
	//      return obj;
	//}
	 //Version #2  ---- Convert all to pointer then it will use standard inheritance (endabling upcasting)
	template <class R>
	inline operator  gzSp<R>()const{
		return obj;
	}*/
	
	 
 //  friend gzSp& operator = (gzSp _oOther);
 /*{
		//GZ_printf("other %p",_oOther.get() );
      // GZ_fSpAssert(_oOther.get() == 0);
   //    if(_oOther.get() != 0){
            obj = _oOther.get(); //Copy
    //   }else{
            //obj = T( (Lib_GZ::Base::cClass*)(obj->parent.get()) ); //Reset if null
     //  }
	 //		GZ_printf("obj %p",obj );
        return *this;
		}*/
	

	
	 long use_count() const // nothrow
    {
	//return 0;
		//TODO Test if zero?
		if(obj == 0){return 0;}
        return obj->nSharedCount; 
    }

/*
    inline T* operator->() const
    { return const_cast<T*>(&obj);}
*/

	//TEST
   // inline bool operator==(int _other) const{ GZ_printf("Test op");return obj == _other;}


    inline T* operator->() const
    { 
		#ifdef D_Debug
		if(obj == 0){
			printf("\n\n ------------- Error! Deferencing a Null PTR ------------- \n\n");
		}
		#endif
		return const_cast<T*>(obj);
	
	}

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
    inline  T* get(){
        return &obj;
     }*/

    gzSp<T> SpFromThis()
    {
       // GZ_printf("\n\n\nOKI");
    }

     /*
	 inline void spFromThis(){
        return &obj;
     }
     */

    inline ~gzSp(){
		subInst();
	};
};
/*
//template <class T>
inline gzSp<int>& operator = (const gzSp<int>& _oOther, const gzSp<int>& _oOther2){
	//GZ_printf("other %p",_oOther.get() );
  // GZ_fSpAssert(_oOther.get() == 0);
//    if(_oOther.get() != 0){
		obj = _oOther.get(); //Copy
//   }else{
		//obj = T( (Lib_GZ::Base::cClass*)(obj->parent.get()) ); //Reset if null
 //  }
 //		GZ_printf("obj %p",obj );
	return *this;
}
*/

/*
template<typename U, typename W>
friend PodObject<U> operator = (PodObject<U> &lhs, PodObject<W> const &rhs) {
    lhs._value += rhs._value;
    return lhs;
} 
*/

/*
template<class T, class U> gzSp<T> gzSCast( gzWp<U> const & r ) //GZ_NoExcept
{
    (void) static_cast< T* >( static_cast< U* >( 0 ) );

    typedef typename gzSp<T>::element_type E;

    E * p = static_cast< E* >( r.get() );

    return gzSp<T>(  r.lock(), p );
}

*/


template<class T> gzSharedCount* gzSCast( gzSharedCount* _ptr ){ //Disable
	return _ptr;
}

/*
template<class T> gzSp<T> gzSCast( gzClass _ptr ) //GZ_NoExcept
//template<class T> gzSp<T> gzSCast( void* _ptr ) //GZ_NoExcept
{
   // (void) static_cast< T* >( static_cast< U* >( 0 ) );

 //   typedef typename gzSp<T>::T E;

    T* p = static_cast< T* >( _ptr );
    //return gzSp<T>( _pOri, p );
    return gzSp<T>( p );
}
*/

template<class T, class U> gzSharedCount*  gzSCast( gzSp<U> const & _pOri ){ //GZ_NoExcept
	return _pOri;
}
template<class T, class U> gzSharedCount*  gzSCast( U* _pOri ){ //GZ_NoExcept
	return _pOri;
}

/*
template<class T, class U> gzSp<T> gzSCast( gzSp<U> const & _pOri ) //GZ_NoExcept
{
   // (void) static_cast< T* >( static_cast< U* >( 0 ) );

 //   typedef typename gzSp<T>::T E;
    T* p = static_cast< T* >( _pOri.get() );
    //return gzSp<T>( _pOri, p );
    return gzSp<T>( p );
}

*/





#endif
