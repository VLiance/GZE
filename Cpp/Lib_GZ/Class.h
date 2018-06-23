#if !( defined tHDef_Lib_GZ_Class)
#pragma once
#define tHDef_Lib_GZ_Class
#define tHDef_IN_Lib_GZ_Class
namespace Lib_GZ{class cClass;}

//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.
//#include "Delegate.h"
//#include "Lib_GZ/Lib_GZ.h"
//	#include "SmartPtr/gzSp.h"
//	#include "SmartPtr/gzWp.h"

//#include "Lib_GZ/Thread.h"
//#include "Lib_GZ/GZ.h"
// ------  Cpp section  ------ //
//#include "Lib_GZ/Lib_GZ.h"
//#include "Lib_GZ/GzBase.h"
// --------------------------- //
//namespace Lib_GZ{class cStThread;}
namespace Lib_GZ{class cThread;}


/////MasterThread//
extern   Lib_GZ::cThread* GzThread;
////////////////////



namespace Lib_GZ{namespace Class{

//Structure Definition

}}

//Optimised Class include -> direct class or header of header (Constants)
namespace Lib_GZ{class cThreadMsg;}
namespace Lib_GZ{class cClass;}
namespace Lib_GZ{namespace Sys{class cDebug;}}
namespace Lib_GZ{class cClass;}
namespace Lib_GZ{class cThreadMsg;}

namespace Lib_GZ{namespace Class{


	//Structure Implementation

	//Unit creation
	//Unit destruction
	//Unit array write

	// ------  Cpp section  ------ //
	cClass* MemCopy(cClass* _oClass);
	// --------------------------- //

}
class tApi_Lib_GZ pClass {

	public:
	//Pure Function

};

class tApi_Lib_GZ cClass  {

	public:
		
        inline virtual void ThreadLoop(){};
        inline virtual void ThreadEnd(){};
		
		
		inline virtual gzAny MemCopy(){return 0;};
		inline virtual gzAny DeepCopy(){return 0;};
		
		
	    cClass* parent;//temps
		
		union {
			cThread* GzThread;
			cThread* thread;
		};
		
		  inline cClass():GzThread(0),parent(0){}; //Sure?

		  
		  

	  
        inline cClass(cClass* _parent):GzThread(0) {
           if(_parent != 0){
              //  parent = _parent->SpFromThis();
                parent = _parent;
                GzThread = _parent->thread;
          }else{
                //Only new thread can have parent to zero (cThread) TODO aAssert
           }
        }
		/*
		inline cClass(cClass* _parent, gzBool _bDeepCopy):GzThread(0) { //Useless?
		   if(_parent != 0){
              //  parent = _parent->SpFromThis();
                parent = _parent;
                GzThread = _parent->thread;
          }else{
                //Only new thread can have parent to zero (cThread) TODO aAssert
           }
	   }*/
		
	
		//Var
	//	cClass(Lib_GZ::cClass* _parent);
		inline virtual void Ini_cClass(){};

	//	inline cClass(const cClass &_o)  : Lib_GZ::cClass(_o){};
		//inline cClass(const cClass &_o, gzBool _b)  : Lib_GZ::cClass(_o, _b){};
		virtual ~cClass();
		
		/*
		//Copy
		inline cClass(const cClass& _o):thread(_o.thread), parent(_o.parent) {
		}
		
		//DeepCopy
		inline cClass(const cClass& _o, gzBool _b):thread(0), parent() {
			
		*/

	private:

		//Var

};
/*
class tApi_Lib_GZ csClass   { //cStThread

	public:
	
		//Object Creation Wrapper
		inline virtual gzSp<cClass> New(Lib_GZ::cClass* _parent){
			gzSp<cClass>_oTemp = gzSp<cClass>(new cClass(_parent));
			//_oTemp->Ini_cClass();
			return _oTemp;
		}
		//Public static
		gzInt nClassId;
	

		//Static function

	//	inline csClass(Lib_GZ::cClass* _parent): Lib_GZ::cStThread(_parent){};
		inline csClass(Lib_GZ::cClass* _parent){};
		inline ~csClass(){};
};
GZ_mStaticClass(Class)*/
namespace Class{
}}
#undef tHDef_IN_Lib_GZ_Class
#endif