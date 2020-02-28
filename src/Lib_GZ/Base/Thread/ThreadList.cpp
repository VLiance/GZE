//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


//#include "Lib_GZ/SysThread.h"
#include "Lib_GZ/Base/Thread/Thread.h"
#include "Lib_GZ/Lib.h"
//Class include
#include "ThreadExt.h"

////// Current Lib Access  ////
namespace Lib_GZ{namespace Base{ namespace Thread{ namespace ThreadList{

  /// gzQElement<gzSp<Base::Thread::cThreadExt>> qeTask = aList.GqeFirst(); //TODO special ini
	//gzAtom(  gzQElement<gzWp<Base::Thread::cThreadExt>>, qeTask );
  // gzAtom(  gzQArray<gzWp<Base::Thread::cThreadExt>>, aList);
   
   // gzQElement<gzSp<cThreadExt>> qeTask;
	
  //  gzArray<gzSp<Base::Thread::cThreadExt>> aList; //TODO Atomic queue?
	
  //  gzElement<gzSp<cThreadExt>> qeTask;
/*
    void Ini_Class(){
   //     qaList = gzQArray<gzSp<cThreadExt>> ();
   //     gzQElement<gzSp<cThreadExt>> qeTask = qaList.GqeFirst();

        GZ_printf("\n\n\n INaaaaaII_Class! \n\n");
    }*/


    void fAdd(Base::Thread::cThreadExt* _opThread){
		
	GZ_printf("\nTry addd2 \n");
	
	
	gzArray<gzSp<cThreadExt>> aList2;
	aList2.fPush(_opThread);
	GZ_printf("\nEnd addd2 ");
			
	
		GZ_printf("\nTry addd ");
		aList().fPush(_opThread);
			GZ_printf("\n addded ");
		//	aList()[0]->oThread->fLoop();
		/*
		GZ_printf("\n !!!!!!!!!! fAdd!!!!!!!!!");
		if(_opThread == 0){
		GZ_printf("\n !!!!!!!!!! _opThread == 0 !!!!!!!!!");
		}
		if(aList().GnSize() == 0){
			GZ_printf("\n !!!!!!!!!! _opThread == 0 !!!!!!!!!");
		}*/
		
		
		/*
	        GZ_printf("\n fAdd");
        Lib_GZ::Lib::nThreadCount++;
		
			if( _opThread== 0){
				GZ_printf("\nAAAAA!!!!Error %d", aList().GnTotal());
			}
       //qaList.fPush( gzSCast<cThreadExt>( _opThread->SpFromThis()) );
       aList().fPush( _opThread );
        _opThread->qeInList = aList().GqeLast();
		
		    qeTask() = aList().GqeFirst();
			if( qeTask().ref()->oThread == 0){
				GZ_printf("\nBBBB!!!!!Error %d", aList().GnTotal());
			}
			
			*/
			
			
    }

    void fRemove(Base::Thread::cThreadExt* _opThread){
	       GZ_printf("\n fRemove");
        Lib_GZ::Lib::nThreadCount--;
    }


   void fNextTask(){
    // GZ_printf("\n fNextTask");
	 
       if(aList().GnSize() > 0){
	   
			//aList()[0]->oThread->fLoop();
			aList()[0]->oThread->fLoop();
			
			
	   /*
         //   GZ_printf("DoTask %d \n" , Lib_GZ::Lib::nThreadCount);
            qeTask() = aList().GqeFirst();
		//	 GZ_printf("\n fLoop");
			if( qeTask().ref()->oThread == 0){
				GZ_printf("\nError %d", aList().GnTotal());
			}
            qeTask().ref()->oThread->fLoop();
		//	 GZ_printf("\n End");
            qeTask() = qeTask().GqeNext();
			*/
       }
   }

}


}}
/*
void cThreadExt::Ini_cThreadList(){
}
cThreadList::~cThreadList(){
}
*/


}
