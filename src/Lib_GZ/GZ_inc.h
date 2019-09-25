

//////TEMP DEBUG MODE
//#define D_Debug




#ifndef tHDef_GZ
#define tHDef_GZ

	#include "Lib_GZ/Base/Class.h"
	
	#include "Lib_GZ/Base/SmartPtr/gzSp.h"
	#include "Lib_GZ/Base/SmartPtr/gzWp.h"

	#ifndef GZE_IMPORT
		#define GZE_IMPORT  __declspec(dllimport)
	#endif

	
	#include "Base/GzTypes.h"

	
#ifndef tHDef_GZ_Minimal_Lib
#define tHDef_GZ_Minimal_Lib
	//// Minimal required libs ////
	
	#ifndef GZ_STD_limits
	#define GZ_STD_limits
		#include <limits.h> //printf
	#endif

	

	#ifndef GZ_STD_Lib
	#define GZ_STD_Lib
		#include <stdlib.h> //printf
	#endif
	
	#ifndef GZ_STD_string
	#define GZ_STD_string

		#include <string.h>
	#endif
		#ifndef GZ_STD_IO
	#define GZ_STD_IO
		#include <stdio.h> //printf
	#endif
	

	///////////////////////////////
#endif

#include "Lib_GZ/Debug/Debugging.h"

	#include "Lib_GZ/Base/Container/Containers.h" 
	#include "Lib_GZ/Base/GzOverplace.h"

	#include "Lib_GZ/Base/Macro.h"
	#include "Lib_GZ/Lib_GZ.h"
	

#include "Lib_GZ/Base/GzBase.h"
#include "Lib_GZ/Base/Thread/Thread.h"
#include "Lib_GZ/Base/Class.h"
#include "Lib_GZ/Base/Thread/StThread.h"
		

#include "Lib_GZ/Base/Thread/ThreadExt.h"


#include "Lib_GZ/Lib.h"
#include "Lib_GZ/Base/Thread/ThreadMsg.h"
	
#include "Lib_GZ/Base/Easing/gzEase.h"
	
#endif