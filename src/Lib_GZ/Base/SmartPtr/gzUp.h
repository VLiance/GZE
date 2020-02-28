//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Lib_GZ/Delegate.h"

#include "Lib_GZ/Base/GzTypes.h"

namespace Lib_GZ{namespace Base{class cClass;}}

template <class T> class gzUp;

#if !( defined tHDef_GZ_gzUp)
#define tHDef_GZ_gzUp



template<class T, class U> gzUp<T> gzSCastSelf( gzUp<U> const & r )
{
	return gzUp<T>( r.get() ); //Add Count ??!!!
}


template<class T> gzUp<T> gzSCastSelf( void* _ptr) {

    if(_ptr == 0){
		return  gzUp<T>();
	}
	return gzUp<T>((T*)_ptr ); //Add Count ??!!!
	
}




template <class T>
class gzUp {
    public:
    T* obj;

	///////REQUIRED for MOVE////////
 	inline gzUp(const gzUp<T> &_oOther){

		obj = _oOther.get(); 
		//_oOther.obj = 0; //Move
		const_cast<gzUp<T>*>(&_oOther)->obj = 0; //Move
			GZ_printf("\n--------- Move!!");
	}
	

	inline gzUp& operator = ( const gzUp<T> _oOther){
		obj = _oOther.get(); 
		//_oOther.obj = 0; //Move
		const_cast<gzUp<T>*>(&_oOther)->obj = 0; //Move
		//		GZ_printf("\n--------- Associate!!");
		return *this;
	}
	/////////////////////////////////
	
	///Can have both ? 
	template <class R> //-- Not work for moving
	inline gzUp& operator = ( gzUp<R> _oOther){
		obj = _oOther.get(); 
		_oOther.obj = 0; //Move
		//const_cast<gzUp<R>*>(_oOther)->obj = 0; //Move
				GZ_printf("\n--------- Associate2!!");
		return *this;
	}
	
	
	
	
	inline gzUp():obj(0)  {};
	

	inline gzUp(T* _objPtr): obj(_objPtr)  {
		GZ_printf("\n  **obj %p \n",obj );
	};

	
	
/*
	   inline gzUp(void* _objPtr): obj((T*)_objPtr)  {
		GZ_printf("\n  **obj %p \n",obj );
	};
	
    inline gzUp(T _obj):obj(&_obj){
	
		GZ_printf("\n  &bj %p \n",obj );
	};
*/


	 
	/*
	template <class R>
	inline gzUp& operator = (const gzUp<R> &_oOther){
		obj = _oOther.get(); 
		// const_cast<type*>(this)_oOther.obj = 0; //Move
						GZ_printf("\n--------- Associate!!");
		const_cast<gzUp<R>*>(_oOther)->obj = 0; //Move
		return *this;
	}
*/
	//Automatic convert to pointer
	//Example: Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
	//To: 	  Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain);
	
	/*
	template <class R>
	inline operator  R*()const{
	    return obj;
	}*/
	


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


    gzUp<T> UpFromThis()
    {
       // GZ_printf("\n\n\nOKI");
    }
/*
	inline gzUp( gzUp<T> &_oOther){

		obj = _oOther.get(); 
		//_oOther.obj = 0; //Move
		_oOther->obj = 0; //Move
			GZ_printf("\n--------- MoveA!!");
	}*/
	

	
	
	
	

    inline ~gzUp(){
		if(obj != 0){
			delete obj; //Not work on return
			///	GZ_printf("\n--------- Delete!!");
		}else{
			//GZ_printf("\n No delete");
		}
		
	};
};

/*
template<class T> gzUp<T> gzSCast( void* _ptr ) //GZ_NoExcept
{
    T* p = static_cast< T* >( _ptr );
    //return gzUp<T>( _pOri, p );
    return gzUp<T>( p );
}
*/

template<class T, class U> gzUp<T> gzSCast( gzUp<U> const & _pOri ) //GZ_NoExcept
{
    T* p = static_cast< T* >( _pOri.get() );
	
	const_cast<gzUp<U>*>(&_pOri)->obj = 0; //Move

    return gzUp<T>( p );
}




#endif
