//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.




#if !( defined tHDef_GZ_SharedCount)
#define tHDef_GZ_SharedCount

#include "Lib_GZ/Base/GzTypes.h"

namespace Lib_GZ{namespace Base{class cClass;}}

namespace Lib_GZ{namespace Base{namespace SmartPtr{




//class SharedCount : gzAny {
class SharedCount : gzAny {

	protected:
	
		void (*FPtr_destroy__)(cClass*);
   
    public:
	
 	gzInt nSharedCount;
 	gzInt nWeakCount;
	

   inline void destroy() const {FPtr_destroy__((cClass*)this);};
   
   

 //  void (*FPtr_destructor__)(cClass*);
   
   
   // inline SharedCount() : gzAny(), nSharedCount(0), nWeakCount(0){
    inline SharedCount() : gzAny(), nSharedCount(0), nWeakCount(0){
		FPtr_destroy__ = 0;
   }
   
   
	inline void AddInst() const {
	
		//if(nSharedCount > 300){
		//	GZ_printf("\nnSharedCount: %d", nSharedCount);
		//}
		const_cast<SharedCount*>(this)->nSharedCount++;
		//ViewAddInst();
	}; 
	inline void SubInst() const {
		const_cast<SharedCount*>(this)->nSharedCount--;
		//ViewSubInst(); //Warning bug with emc
				
		//if(nSharedCount > 300){
	//		GZ_printf("\nnDelSharedCount: %d", nSharedCount);
		//}
		
		if(nSharedCount <= 0){
		  destroy();
		}
	};
	
	/*
	//Only on debug
	 virtual void ViewAddInst() const {
	}
	 virtual void ViewSubInst() const {
	}
    inline virtual ~SharedCount(){
	};*/
	
	
};

}}
}

typedef Lib_GZ::Base::SmartPtr::SharedCount gzSharedCount;

#endif
