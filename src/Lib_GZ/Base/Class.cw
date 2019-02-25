//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	
	//import GZ.ThreadMsg;
	
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

			cClass* parent;//temps //TODO gzWp
			
			union {
				Lib_GZ::Base::Thread::cThread* GzThread;
				Lib_GZ::Base::Thread::cThread* thread;
			};
					
			inline cClass():GzThread(0),parent(0){}; //Sure?
						
			inline virtual void ThreadLoop(){};
			inline virtual void ThreadEnd(){};
		</cpp_class_h>
			
			
			
			
		<cpp_initializer>
			if(_parent != 0){
				  //  parent = _parent->SpFromThis();
					parent = _parent;
					GzThread = _parent->thread;
					  printf("\nClassSetThread");
			  }else{
			   printf("\nClassNull");
					//Only new thread can have parent to zero (cThread) TODO aAssert
					//	--> thread = this;--> IN thread.cpp
			   }
			 
		</cpp_initializer>
	
		
		public function Class() : Void {
		
		}
		
	}
}
