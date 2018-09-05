#include "Lib_GZ/Sys/ThreadObj.h"

#include "Lib_GZ/Thread.h"
#include "Lib_GZ/ThreadExt.h"
//#include "Lib_GZ/Gfx/Interface.h"
#include "Lib_GZ/Sys/Debug.h"
#include "Lib_GZ/Class.h"
#include "Lib_GZ/ThreadMsg.h"


namespace Lib_GZ{namespace Sys{namespace ThreadObj{
////// Current Lib Access  ////
//// Current Static Access ////
#undef _
#define _ ThreadObj
void Ini_Class(){
}
#ifdef GZ_tHaveCallStack
gzFuncStack zFuncName[] = {{0,"ThreadObj"},{0,"fSetPriority"},{0,"fThreadCallBack"},{0,"fStart"},{0,"fJoin"},{0,"fCancel"},{0,"fClose"}};
#endif
///////////////////////////////

}

GZ_mCppClass(ThreadObj)

	void cThreadObj::Ini_cThreadObj(Lib_GZ::cThreadExt* _oThreadEx, ThreadObj::Dlg_fThreadCallBack_r_void_p_gzPtr::Dlg _dCallBack){ gz_(0)
		oThreadExt = gzSCastSelf<Lib_GZ::cThreadExt>(_oThreadEx);
		dCallBack = _dCallBack.get();
	}

	void cThreadObj::fSetPriority(gzUInt _nPriority){ gz_(1)
		GZ_mIsImplemented("GZ::ThreadObj::fSetPriority")
	}

	void cThreadObj::fThreadCallBack(Lib_GZ::cThreadExt* _oThreadEx){ gz_(2)
		GZ_mIsImplemented("GZ::ThreadObj::fThreadCallBack")
	}

	void cThreadObj::fStart(){ gz_(3)
	//	Lib_GZ::Sys::Debug::GetInst(thread)->fWarning(gzU8("fStart not implemented in ThreadObj"));
	}

	void cThreadObj::fJoin(){ gz_(4)
		GZ_mIsImplemented("GZ::ThreadObj::fJoin")
	}

	void cThreadObj::fCancel(){ gz_(5)
		GZ_mIsImplemented("GZ::ThreadObj::fCancel")
	}

	void cThreadObj::fClose(){ gz_(6)
		GZ_mIsImplemented("GZ::ThreadObj::fClose")
	}

	cThreadObj::~cThreadObj(){
	}


}}