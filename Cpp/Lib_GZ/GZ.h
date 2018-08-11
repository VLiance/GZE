

#ifndef tHDef_GZ
#define tHDef_GZ

	#include "Lib_GZ/Class.h"
	
	#include "SmartPtr/gzSp.h"
	#include "SmartPtr/gzWp.h"

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



	#include "Lib_GZ/Base/Containers.h" 
	#include "GzOverplace.h"

	#include "Macro.h"
	#include "Lib_GZ/Lib_GZ.h"
	
	
	
#include "Lib_GZ/Base/GzBase.h"
#include "Lib_GZ/Thread.h"
#include "Class.h"
#include "StThread.h"
		

#include "Lib_GZ/ThreadExt.h"


#include "Lib_GZ/Lib.h"
	/*
	//#ifndef tGZ_Use_Pch
		#include "Lib_GZ/Lib_GZ.h"
		#include "Lib_GZ/Lib.h"

		#include "Lib_GZ/DataArray.h"


		#include "GzBase.h"

		#include "Lib_GZ/DArray.h"
		#include "Lib_GZ/DArray2.h"
		#include "Lib_GZ/QArray.h"
		#include "Lib_GZ/Gate.h"

		#include "Lib_GZ/ThreadExt.h"


	//#endif
	*/
	
	
	

	
	
	
#endif