//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "ThreadExt.h"
#include "Lib_GZ/Sys/ThreadObj.h"
#include "Lib_GZ/Base/Thread/Thread.h"
#include "Lib_GZ/Base/Thread/ThreadList.h"
//#include "Lib_GZ/Sys/System.h"
//#include "Lib_GZ/Sys/Debug.h"
//Class include


//Resumé
//Macro: (GZ_mNewThreadCpp(Lib_Demo, MainInterface, Lib_GZ::Sys, ThreadItf));

//	oThreadExt = gzSCast<Lib_GZ::Base::Thread::cThreadExt>(Lib_Demo::MainInterface::NewThread(this));
// Macro:  
//_dCallBack = &_sLib::_sClass::Thread_Start;
// return Lib_GZ::Base::Thread::ThreadExt::New(_parent, _dCallBack)
// New ThreadExt:
// _oTemp->Constructor(_dCallBack);
// 		ThreadList::fAdd(this);
//      New ThreadObj --> OpThreadObj (Windows Thread)
//			oThreadObj->fStart()
//				OpThreadObj::hThread = CreateThread(&OpThreadObj::fThreadProc)
//				bStarted = true;
//					fThreadProc:
//						New Real Thread:  Lib_GZ::Sys::cThreadObj* self->dCallBack.fCall(self->oThreadExt.get()); //Loop here
//----------------------New Real Thread------------------------------------------------------------------------
// dCallBack: Thread_Start:
// _oInitialiser = ThreadItf::Get(oThreadExt->thread)->New(0); //Create csThreadItf in current thread and new Instance associate in new thread, legit?
// fLinkThreadExt: 	_oInitialiser(cThreadExt*) --> pThreadExt = _pThreadExt; pThreadExt->oThread = this;
// _oTemp = new _sLib::cMainInterface(_oInitialiser.get())
// _oTemp->Constructor((_namespace::c##_class*)_oInitialiser.get());
// _oInitialiser->fStart(_oTemp.get());
//		fStart:
//			 oObj  = gzSCastSelf<Lib_GZ::Base::cClass>(_oTemp);
//			fLoop:
//				while(bAppIsAlive && bRun){oObj->ThreadLoop();}
// _oInitialiser->ThreadEnd();\

////// Current Lib Access  ////
namespace Lib_GZ{namespace Base{namespace Thread{

    void cThreadExt::Constructor(Lib_GZ::Dlg_r_void_p_gzPtr::DlgP _dCallBack){
	//printf("\nIni_cThreadExt");
				printf("\n ---- Create THREAD EXT \n");

        ThreadList::fAdd(this);
	
       // pSysThread = new cSysThread(_dCallBack, 0);
       oThreadObj = Sys::ThreadObj::Get(thread)->New(this, this, _dCallBack.get()); 
	    printf("Ini_cThreadExtaaaaa crete\n");
       fStart();
 
	  
    }


	/*
	void cThreadExt::fThreadCallBack(Lib_GZ::cInterface* _opItf){

	}*/

	void cThreadExt::fStart(){
      printf("\nfStarte\n");
	
        #ifndef GZ_D_Monothread
		
				printf("\n Pas mono \n");
        	if(!oThreadObj->bStarted){
				printf("\n\n \n Start GThread !\n");
				oThreadObj->fStart();
					
            }
        #else
	printf("\n !GZ_D_Monothread! \n");
           oThreadObj->bStarted = true;
            oThreadObj->dCallBack.fCall(this);
		
        #endif // GZ_D_Monothread

	}

	void cThreadExt::fJoin(){/*
		if(!oThreadObj->bStarted){
			oThreadObj->fJoin();
		}*/
	}

	void cThreadExt::fCancel(){
		//oThreadObj->bStarted = false;
	}

	void cThreadExt::fClose(){

	}
	
	/*
	virtual void cThreadExt::ViewAddInst() const {
		printf("\n ---- Add THREAD EXT \n");
	}
	
	virtual void cThreadExt::ViewSubInst() const {
		printf("\n ---- Sub THREAD EXT \n");
	}
	*/

    cThreadExt::~cThreadExt(){
		printf("\n ---- Delete THREAD EXT \n");
/*
        //Sleep(50);
        if( oThreadObj->bStarted){
             while(oThread == 0){ //Wait for complete creation (Linking)
                Sys::System::Get(thread)->fSleep(1);
             }
            oThread->bRun = false;
            oThreadObj->fClose();
        }*/
       // delete pSysThread;
    }

}
}}