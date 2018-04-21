﻿namespace Lib_GZ{
class cDelegate;}

#ifndef tHDef_GZ_Delegate
#define tHDef_GZ_Delegate


#include "Lib_GZ/Base/GzTypes.h"


//#include "Lib_GZ/SmartPtr/EnableSharedFromThis.h"
namespace Lib_GZ{


class cThread;
//class cDelegate  : public  GZptr::enable_shared_from_this<cDelegate> {
class cDelegate  {

	public:

        inline virtual void ThreadLoop(){};
        inline virtual void ThreadEnd(){};
		
		inline virtual gzAny MemCopy(){return 0;};
		inline virtual gzAny DeepCopy(){return 0;};


};

class cClass : public cDelegate {

	public:
   //     gzWp<cDelegate> parent;
        cDelegate* parent;//temps
		
        cThread* thread;
        //inline virtual void ThreadLoop(){};
        //inline virtual void ThreadEnd(){};
        inline cClass(cClass* _parent):thread(0) {
           if(_parent != 0){
              //  parent = _parent->SpFromThis();
                parent = _parent;
                thread = _parent->thread;
          }else{
                //Only new thread can have parent to zero (cThread) TODO aAssert
           }
        }
		
		
		//Copy
		inline cClass(const cClass& _o):thread(_o.thread), parent(_o.parent) {
		}
		
		//DeepCopy
		inline cClass(const cClass& _o, gzBool _b):thread(0), parent() {
			
		}
		
		
};


}

namespace GZptr{
//template<class T> gzSp<T> gzSCastSelf( gzAny _ptr) GZ_NoExcept{
/*
    if(_ptr == 0){return  gzSp<T>();}

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


//}



#endif
