//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	
	//import GZ.ThreadMsg;
	
	
	<cpp_h>	
		#include "Lib_GZ/Base/SmartPtr/SharedCount.h"
	</cpp_h>
		
	
	public extension Class   {

		public static var nClassId : Int;
		
	
	
		<cpp_namespace_h>	
			//namespace Lib_GZ{namespace Base{namespace Thread{class cThread;}}}
			}namespace Thread{class cThread;}namespace Class{
			/////MasterThread//
			extern   Lib_GZ::Base::Thread::cThread* GzThread;
		</cpp_namespace_h>
		
		
		<cpp_class_h>
			inline cClass* SpFromThis(){return this;}; //TODO
			/*
			inline void AddInst() const {const_cast<cClass*>(this)->nInstCount++;}; 
			inline void SubInst() const {
				const_cast<cClass*>(this)->nInstCount--;
				
				GZ_printf("\nnInstCount: %d", nInstCount);
				if(nInstCount == 0){
					GZ_printf("\nDelete ");
					delete this;
				}
			};
			*/
			
			//cClass* parent;//temps //TODO gzWp
			gzWp<cClass> parent;//temps //TODO gzWp
			gzInt nInstCount;
			
			union {
				Lib_GZ::Base::Thread::cThread* GzThread;
				Lib_GZ::Base::Thread::cThread* thread;
			};
					
			inline cClass():GzThread(0),parent(0){}; //Sure?
					
		//	inline virtual void IniClass(){};
		/*
			inline virtual void ThreadLoop(){};
			inline virtual void ThreadEnd(){
				GZ_printf("\n----ThreadEND");
			};
			*/
			
			
		</cpp_class_h>
			
			
		<cpp_preinitializer_list>
			:SharedCount(), nInstCount(0)
		</cpp_preinitializer_list>
			
		<cpp_initializer>
			if(_parent != 0){
				//GZ_printf("\nGetParentThread");
				  //  parent = _parent->SpFromThis();
					parent = _parent;
					GzThread = _parent->thread;
				//	GZ_printf("\nSetParentThread");
					//  GZ_printf("\nClassSetThread");
			  }else{
					GZ_printf("\nThreadClass(No Parent)");
					//Only new thread can have parent to zero (cThread) TODO aAssert
					//	--> thread = this;--> IN thread.cpp
			   }
			 
		</cpp_initializer>
	
		public function Class() : Void {
		}
		
		
		public function ThreadLoop() : Void {
		}
		
		public function ThreadEnd() : Void {
		 <cpp>
		 GZ_printf("\n----ThreadEND");
		 </cpp>
		}
		
		
		//override function TestDestructor() : Void { //TODO
		 function destroy() : Void {
		}

	    destructor { //To be overrided
		}
		
	}
}
