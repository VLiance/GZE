#include "Lib_GZ/Sys/Debug.h"

#include "Lib_GZ/Class.h"
#include "Lib_GZ/ThreadMsg.h"


namespace Lib_GZ{namespace Sys{namespace Debug{
////// Current Lib Access  ////
//// Current Static Access ////
#undef _
#define _ Debug
void Ini_Class(){
}
#ifdef GZ_tHaveCallStack
gzFuncStack zFuncName[] = {{0,"fConsole"},{0,"fTrace"},{0,"fPass"},{0,"fWarning"},{0,"fError"},{0,"fFatal"},{0,"Debug"}};
#endif
///////////////////////////////

}

GZ_mCppClass(Debug)

void cDebug::fConsole(gzPStr _sValue){ gz_(0)
	//Tag cpp
	_sValue.fPrint();
	 printf("\n");
	// printf("c:%s\n", (char*)_sValue.fToChar());
	//  printf("%s\n",_sValue.fToChar());
}

void cDebug::fTrace(gzPStr _sValue){ gz_(1)
	fConsole(_sValue);
}

void cDebug::fPass(gzPStr _sValue){ gz_(2)
	fConsole(_sValue);
}

void cDebug::fWarning(gzPStr _sValue){ gz_(3)
	fConsole(_sValue);
}

void cDebug::fError(gzPStr _sValue){ gz_(4)
	fConsole(_sValue);
}

void cDebug::fFatal(gzPStr _sValue){ gz_(5)
	fConsole(_sValue);
}

	void cDebug::Ini_cDebug(){ gz_(6)
		Ini_cClass();
	}

	gzAny cDebug::MemCopy(){
	return (gzAny)new cDebug(*this);
	}
	cDebug::~cDebug(){
	}


}}