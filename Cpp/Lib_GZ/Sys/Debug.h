#if !( defined tHDef_Lib_GZ_Sys_Debug || defined  tHDef_IN_Lib_GZ_Class)
#pragma once
#define tHDef_Lib_GZ_Sys_Debug
namespace Lib_GZ{namespace Sys{class cDebug;}}

#include "Lib_GZ/Lib_GZ.h"
#include "Lib_GZ/GZ.h"
#include "Lib_GZ/Thread.h"
#include "Lib_GZ/Class.h"
namespace Lib_GZ{namespace Sys{namespace Debug{

//Structure Definition

}}}

//Optimised Class include -> direct class or header of header (Constants)
namespace Lib_GZ{namespace Sys{class cDebug;}}
namespace Lib_GZ{namespace Sys{class cDebug;}}
namespace Lib_GZ{class cClass;}
namespace Lib_GZ{class cThreadMsg;}

namespace Lib_GZ{namespace Sys{namespace Debug{


	//Structure Implementation

	//Unit creation
	//Unit destruction
	//Unit array write

}
class tApi_Lib_GZ pDebug {

	public:
	//Pure Function

};

class tApi_Lib_GZ cDebug : public Lib_GZ::cClass {

	public:


		//Var
		inline cDebug(Lib_GZ::cClass* _parent) : Lib_GZ::cClass(_parent){};
		virtual void Ini_cDebug();

		virtual gzAny MemCopy();
		virtual ~cDebug();

		//Static singleton function
		virtual void fTrace(gzPStr _sValue);
		virtual void fPass(gzPStr _sValue);
		virtual void fWarning(gzPStr _sValue);
		virtual void fError(gzPStr _sValue);
		virtual void fFatal(gzPStr _sValue);

	private:

		//Var
		virtual void fConsole(gzPStr _sValue);

};
class tApi_Lib_GZ csDebug : public Lib_GZ::csClass  {

	public:
		//Object Creation Wrapper
		inline virtual gzSp<cDebug> New(Lib_GZ::cClass* _parent){
			gzSp<cDebug>_oTemp = gzSp<cDebug>(new cDebug(_parent));
			_oTemp->Ini_cDebug();
			return _oTemp;
		}

		//Public static

		inline csDebug(Lib_GZ::cThread* _thread): Lib_GZ::csClass(_thread) {};
		inline ~csDebug(){};
};
GZ_mStaticClass(Debug)
namespace Debug{
}}}
#endif