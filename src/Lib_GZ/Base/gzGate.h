//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#if !( defined tHDef_GZ_Gate)
#define tHDef_GZ_Gate

//#include "Lib_GZ/GzTypes.h"
//#include "Lib_GZ/Base/SmartPtr/SharedPtr.h"
//#include "Lib_GZ/Base/Macro.h"

//#include "Lib_GZ/ThreadMsg.h"

namespace Lib_GZ{

	/*
	class cGateCounter{
		public:

		gzInt nCount;

		inline cGateCounter():nCount(0) {};
		inline ~cGateCounter();
	};
	*/



	class cAtomicQueue;

	namespace Base{namespace Thread{class cThreadMsg;class cThread;}}
	

	class cHoldGate{
		public:

		Lib_GZ::cAtomicQueue* oQueue;
		gzUInt nNbIns;


		Lib_GZ::Base::Thread::cThreadMsg*  fReceive(Lib_GZ::Base::cClass* _oReceivingClass);
		int fSend(Lib_GZ::Base::Thread::cThreadMsg* _oMsg);

		cHoldGate();
		~cHoldGate();

	};

	namespace Gate{

		void fAdd(Lib_GZ::cHoldGate* _oHold);
		void fSub(Lib_GZ::cHoldGate* _oHold);
	}
}






#ifdef GZ_tWindows
	///Heavy///
	//#include "Lib_GZ/GZ.h"
	//#include "Lib_GZ/concurrentqueue.h"
#endif

template <class S, class T>
class gzGate {
public :

	Lib_GZ::cHoldGate* oHold;

	inline gzGate(){oHold = new Lib_GZ::cHoldGate();}
	inline void Ini(){
	    if(oHold == 0){ //TODO Assert
            oHold = new Lib_GZ::cHoldGate();
	    }
	}

	inline ~gzGate(){
		Lib_GZ::Gate::fSub(oHold);
	}


	inline gzSp<T> Receive(S* _oReceivingClass){ return gzSp<T>((T*)oHold->fReceive(_oReceivingClass)); }

		
	inline gzBool Execute(S* _oReceivingClass){ 
		T* _oMsg = oHold->fReceive(_oReceivingClass); 
		if(_oMsg){	
			_oMsg->fRun();
			return true;
		}else{
			return false;
		}
	}
	inline gzUInt ExecuteAll(S* _oReceivingClass){
		gzUInt i = 0;
		while(Execute(_oReceivingClass)){
			i++;
		}
		return i;
	}
	
	
	inline  int Send(Lib_GZ::Base::Thread::cThreadMsg* _oMsg){return oHold->fSend(_oMsg);};

	gzGate(const gzGate& _oOther);
	gzGate& operator=(const gzGate& _oOther) const;

};


template <class S,class T>
	gzGate<S,T>::gzGate(const gzGate& _oOther){
	oHold = _oOther.oHold;
   Lib_GZ::Gate::fAdd(oHold);
}

template <class S,class T>
gzGate<S,T>& gzGate<S,T>::operator=(const gzGate<S,T>& _oOther) const{

	Lib_GZ::cHoldGate* _oTemp = oHold;

   const_cast<gzGate<S,T>*>(this)->oHold = _oOther.oHold;
   Lib_GZ::Gate::fAdd(oHold);


    if(_oTemp != 0){
        Lib_GZ::Gate::fSub(_oTemp); //Delete old instance
    }

   return *const_cast<gzGate<S,T>*>(this);
}










#endif
