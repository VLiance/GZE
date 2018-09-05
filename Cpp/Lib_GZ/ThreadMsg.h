#if !( defined tHDef_Lib_GZ_ThreadMsg || defined  tHDef_IN_Lib_GZ_Class)
#pragma once
#define tHDef_Lib_GZ_ThreadMsg
#define tHDef_IN_Lib_GZ_ThreadMsg
namespace Lib_GZ{class cThreadMsg;}

#include "Lib_GZ/Lib_GZ.h"
#include "Lib_GZ/GZ.h"
#include "Lib_GZ/Thread.h"
#include "Lib_GZ/Class.h"
namespace Lib_GZ{namespace ThreadMsg{

//Structure Definition

}}

//Optimised Class include -> direct class or header of header (Constants)
namespace Lib_GZ{class cThreadMsg;}
namespace Lib_GZ{namespace Sys{class cDebug;}}
namespace Lib_GZ{class cClass;}
namespace Lib_GZ{class cThreadMsg;}

namespace Lib_GZ{namespace ThreadMsg{


	//Structure Implementation

	//Unit creation
	//Unit destruction
	//Unit array write

}
class tApi_Lib_GZ pThreadMsg {

	public:
	//Pure Function

};

class tApi_Lib_GZ cThreadMsg : public Lib_GZ::cClass {

	public:


		//Var
		inline cThreadMsg(Lib_GZ::cClass* _parent) : Lib_GZ::cClass(_parent){};
		virtual void Ini_cThreadMsg();
		virtual void fRun();

		virtual ~cThreadMsg();

		//Static singleton function

	private:

		//Var

};
class tApi_Lib_GZ csThreadMsg : public Lib_GZ::csClass  {

	public:
		//Object Creation Wrapper
		inline virtual gzSp<cThreadMsg> New(Lib_GZ::cClass* _parent){
			gzSp<cThreadMsg>_oTemp = gzSp<cThreadMsg>(new cThreadMsg(_parent));
			_oTemp->Ini_cThreadMsg();
			return _oTemp;
		}

		//Public static

		inline csThreadMsg(Lib_GZ::cThread* _thread): Lib_GZ::csClass(_thread) {};
		inline ~csThreadMsg(){};
};
GZ_mStaticClass(ThreadMsg)
namespace ThreadMsg{
}}
#undef tHDef_IN_Lib_GZ_ThreadMsg
#endif