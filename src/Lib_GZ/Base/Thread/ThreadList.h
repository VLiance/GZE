//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

namespace Lib_GZ{class cThreadList;}
#if !( defined tHDef_GZ_ThreadList)

#define tHDef_GZ_ThreadList
#include "Lib_GZ/GZ_inc.h"
//#include "Lib_GZ/SysThread.h"
namespace Lib_GZ{namespace Base{namespace Thread{class cThreadList;}}}


namespace Lib_GZ{namespace Base{namespace Thread{
namespace ThreadList{
	
    gzAtom( gzArray<gzSp<cThreadExt>>, aList);
    //gzAtom( gzQArray<gzWp<cThreadExt>>, aList);
    //gzAtom( gzQElement<gzWp<cThreadExt>>, qeTask);
    void fAdd(cThreadExt* _opThread);
    void fRemove(cThreadExt* _opThread);
    void Ini_Class();
    void fNextTask();
}

/*
class cThreadList {
	public:
		inline cThreadList(){};
		virtual ~cThreadList();
	private:
};*/
/*
namespace ThreadExt{
    //Object Creation Wrapper
    inline gzSp<Lib_GZ::Base::Thread::cThreadExt> New(Lib_GZ::Dlg_r_void_p_gzPtr::DlgP _dCallBack){
        gzSp<Lib_GZ::Base::Thread::cThreadExt>_oTemp = gzSp<Lib_GZ::Base::Thread::cThreadExt>(new Lib_GZ::Base::Thread::cThreadExt());
        _oTemp->Ini_cThreadExt(_dCallBack);
        return _oTemp;
    }
}
*/
}}}
#endif
