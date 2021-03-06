﻿//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

//#include "Lib_GZ/Lib_GZ.h"
//#include "Lib_GZ/Sys/Debug.h"
#include "Debugging.h"

#ifdef GZ_tHaveCallStack
 gzPtr gzaCallStack[GZ_tCallStackSize];
 gzUInt gznCallStackIndex;
#endif

#ifdef D_Debug
gzUInt GZ_nArrayTotalFree = 0;
gzUInt GZ_nArrayTotalAlloc = 0;
#endif

//#include <stdlib.h> //  exit(EXIT_FAILURE);
	
namespace Lib_GZ{

	void DbgCrash(){
		//while(1){};
	  GZ_printf("\nGZ FAILURE!\n"); //GDB must set a breakpoint here!
	//  while(1){};//TODO
	//  exit(EXIT_FAILURE); //TODO
	  
	}


    void fConsole(const char* _sValue){
        GZ_printf("c:");
        //_sValue.fPrint();
		GZ_printf("%s",_sValue );
        GZ_printf("\n");
    }

	
	
/*
    void fAssertError(gzUInt _nLine){
		(gzU8("\nE: place breakpoint here to get the call stack") ).fPrint() ;
		GZ_Crash();
    }
*/
    void fAssertError(const char* _sMessage, const char* _sFile, const char* _sFunc, gzUInt _nLine){
		(gzU8("\nE:Assert[") +  gzStrC(_sFile) +  gzU8(":") +  gzStrC(_sFunc) + gzU8(":") + gzStrUI(_nLine) + gzU8("]: ") + 	gzU8(_sMessage) + gzU8(" (place breakpoint here to get the call stack -> Lib_GZ/Debugging.cpp)") ).fPrint() ;
		GZ_Crash();
    }
}



