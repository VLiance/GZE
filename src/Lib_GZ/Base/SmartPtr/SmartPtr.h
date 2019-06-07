
#ifndef tHDef_SmartPtr
#define tHDef_SmartPtr

	//#include "Lib_GZ/Embed.h"
	#include "Lib_GZ/Base/gzPod.h"
	//#include "Lib_GZ/Base/SmartPtr/SharedPtr.h"
	//#include "Lib_GZ/Base/SmartPtr/WeakPtr.h"
	//#include "Lib_GZ/Base/SmartPtr/EnableSharedFromThis.h"
	#include "Lib_GZ/Base/SmartPtr/gzSp.h"
	#include "Lib_GZ/Base/SmartPtr/gzWp.h"
	#include "Lib_GZ/Base/SmartPtr/gzUp.h"




	namespace Lib_GZ{
		template <typename T>
		inline void fRemove(const T &t) {
		}
		
		template <typename T>
		inline void fRemove( gzSp<T>* t) { //From Array
			t->remove();
		}
		
		template <typename T>
		inline void fRemove(const gzSp<T> &t) {//From QArray
			t.remove();
			/*
			if(t.bMustFree){
				t.dDelete.fCall((void*)t.Val);
				GZ_fFree(t.Val);
			}*/
		}
		/*
		template <typename T>
		inline void fRemove(const gzPods<T> &t) {
			if(t.bMustFree){
				t.dDelete.fCall((void*)t.Val);
				GZ_fFree(t.Val);
			}
		}*/
	}

#endif