
#Wrapper

package  {


	/**
	 * @author Maeiky
	 */

	public result Result  {

		public var bValid : Bool;
							
									
		public function Result():Void {
			

		}


	}
}



/*


#if !( defined tHDef_Lib_GZ_Base_Result_Result)
#pragma once
#define tHDef_Lib_GZ_Base_Result_Result
namespace Lib_GZ{namespace Base{namespace Result{class cResult;}}}

#include "Lib_GZ/Lib_GZ.h"
#include "Lib_GZ/Base/Thread/Thread.h"

//Optimised Class include -> direct class or header of header (Constants)
namespace Lib_GZ{namespace Base{namespace Result{class cResult;}}}
namespace Lib_GZ{namespace Base{namespace Thread{class cThreadMsg;}}}
namespace Lib_GZ{class cGZ;}
namespace Lib_GZ{namespace Debug{class cDebug;}}
namespace Lib_GZ{namespace Base{class cClass;}}

#include "Lib_GZ/GZ_inc.h"
namespace Lib_GZ{namespace Base{namespace Result{namespace Result{

//Structure Definition

}}}}
namespace Lib_GZ{namespace Base{namespace Result{namespace Result{


	//Structure Implementation

	//Unit creation
	//Unit destruction
	//Unit array write

}
class tApi_Lib_GZ pResult {

	public:
	//Pure Function

};

class tApi_Lib_GZ cResult : public gzResults {

	public:


		//Var
		gzBool bValid;
		inline cResult():gzResult(false)
		,bValid(0)
		{
		//Special var ini
		};
		void  Constructor();

		inline cResult(const cResult& _o, gzBool _bDCpy = false) : , bValid(_o.bValid){
		printf("\nCopyResult");
		};
		virtual gzClass Copy(gzBool _bDeepCopy = false){return new cResult(*this, _bDeepCopy);};
		virtual ~cResult();

		//Static singleton function

	private:

		//Var

};
namespace Result{
}}}}
#endif
*/