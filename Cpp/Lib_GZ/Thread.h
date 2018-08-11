//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace Lib_GZ{class cThread;}
#if !( defined tHDef_GZ_Thread )
#define tHDef_GZ_Thread


#include "Lib_GZ/GZ.h"

//#include "Lib_GZ/DArray.h"
//#include "Lib_GZ/Delegate.h"
#include "Lib_GZ/Class.h"



//#include "Lib_GZ/Sys/System.h"
#include "Lib_GZ/ThreadExt.h"
//#include "Lib_GZ/GFX/Dispacher.h"

namespace Lib_GZ{namespace Thread{

	//Structure Definition

}}

//Optimised Class include -> direct class or header of header (Constants)
namespace Lib_GZ{class cDispacher;}
namespace Lib_GZ{namespace Sys{class cDebug;}}

namespace Lib_GZ{
class cStThread;
class cThreadExt;

namespace Thread{
	
}




class cThread : public cClass {

	public:
		static gzUInt nCurrId; //Todo attomic
		
		gzUInt nId = 0;
		
		
     //  gzArray<gzSp<cStThread>> st;
	      gzArray<cStThread*> st;
		  
     //  gzArray<cStThread*> st;
	   
    //   gzArray<gzPtrFuncRPAny> func;

       gzSp<cClass> oObj;

       gzBool bRun;
	   gzUInt nSleepTime;
       cThreadExt* pThreadExt;
       void fStart(Lib_GZ::cClass* _poObj);


		/*
		//COPY
		inline cThread(const cClass& _o, gzBool _b):cClass(_o,_b)  {
			//TODO ?
		}
		*/

		
		inline cThread(Lib_GZ::cClass* _parent):cClass(_parent),bRun(true),nSleepTime(1){
            thread = this;
			nId = nCurrId;
			nCurrId++;
			printf("\n okay!\n");  
           // Lib_GZ::Sys::Debug::New(this,0,0,0,0); //DebugOnly
		};
		
		
		void fLinkThreadExt(cThreadExt* _pThreadExt);
		void fLoop();
		virtual ~cThread();

	private:

};




}

#endif
