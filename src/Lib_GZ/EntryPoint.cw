//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Thread.Thread;
	
	import GZ.Base.Thread.ThreadMsg;
	import GZ.Sys.MainThreadPlatformMsg;
	
	
	
<cpp>
	#include <GZE.h>
	#include <Main.cpp>

	
		extern Lib_GZ::cEntryPoint* GZ_CreateEntryPointClass();
		
		
		
		
		//gzSp<Lib_GZ::cLib> oGzLib;
		gzGp<Lib_GZ::cEntryPoint> oMain;
		//gzSp<Lib_GZ::Sys::cMainThreadPlatformMsg> oMainMsg;
		
		gzInt Main( gzText8 _sArg, gzUIntX _nId, gzInt _nCmd){
			//printf("\n Platform: "   gzStringize(DwPlatform)   );
			printf("\n Platform: "   gzStringize(DsPlatform)  " \n"  );
		//	oGzLib = Lib_GZ::Lib::New( _nId, gzStrC( _sArg), _nCmd);
			
			
			//	oTest = gzSCast<Lib_Demo::cTest>(Lib_Demo::Test::Get(thread)->New(this));
			//Lib_GZ::cEntryPoint*  _oMain =  gzSp<Lib_Demo::cTest>( GZ_CreateEntryPointClass());
			
			
	
			oMain =  gzSp<Lib_GZ::cEntryPoint>( GZ_CreateEntryPointClass() );
		//	oMain->Ini_cEntryPoint(); //TODO Better way?
			oMain->cEntryPoint::Constructor(); //Set threading object
			

		//Create default singleton	
		//Lib_GZ::Sys::Debug::Get(oMain->thread)->zInst = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
		Lib_GZ::Debug::Debug::SetInst(oMain->thread) = Lib_GZ::Debug::Debug::Get(oMain->thread)->New(oMain);
	
	//	Lib_GZ::Sys::Debug::Get(oMain->thread)->NewSingleton();
		//Lib_GZ::Sys::Debug::CreateSingleton(oMain->thread);

	//	printf("\n Lib_GZ::Sys::Debug::GetInst(oMain->thread): %d", Lib_GZ::Sys::Debug::GetInst(oMain->thread).get() );
	
		Lib_GZ::Sys::MainThreadPlatformMsg::SetInst(oMain->thread) = Lib_GZ::Sys::MainThreadPlatformMsg::Get(oMain->thread)->New(oMain);
		
		
		
			//oMain->fMain();
	
		

			
		//_oMain
			
		//	printf("\n");
		
//oTest = gzSCast<Lib_Demo::cTest>(Lib_Demo::Test::Get(thread)->New(this));


		//	return 0; // 1 Still Alive, 0 Stop, < 0 Errors
			return oMain->Constructor(); // 1 Still Alive, 0 Stop, < 0 Errors
		}

		#include "Lib_GZ/Base/Thread/ThreadList.h"
		gzInt Update(gzFloat _nDelta){
		
			static gzInt _nCount = 0;
			Lib_GZ::Sys::MainThreadPlatformMsg::GetInst(oMain->thread)->fManageMessage();
		
		
			#ifdef GZ_D_Monothread
				static gzBool _bAllTaskIsFinished = true;
				if(_bAllTaskIsFinished){
					_bAllTaskIsFinished = false;
					Lib_GZ::Base::Thread::ThreadList::fNextTask();
					_bAllTaskIsFinished = true;
				}
				
			#endif
			
			
		//	Lib_GZ::Sys::MainThreadPlatformMsg::GetInst(oMain->thread);
			
		
			//printf("Update: %d" endl_cr, _nCount);
			//fprintf(stderr,"\nUpdate: %d\n" endl_cr, _nCount);
			_nCount++;
			
			if(_nCount > 10){
			//return 0; // 1 Still Alive, 0 Stop, < 0 Errors
			}
			return 1; // 1 Still Alive, 0 Stop, < 0 Errors
		}
		gzInt Close(gzInt _nExitCode){
		
			Lib_GZ::Base::Thread::Thread::bAppIsAlive = false;
			
			//Wait for all thread
			#ifndef GZ_D_Monothread
			
				while(Lib_GZ::Base::Thread::Thread::nThreadCount != 0){
					Sleep(1);
					//Lib_GZ::Sys::System::GetInst(oMain->thread)->fSleep(1); //Cannot acess thread when waiting to close it
				}
				
				 
			#endif
		
			printf("\n Good bye: %d \n", _nExitCode);
			//Lib_GZ::Sys::System::GetInst(oMain->thread)->fSleep(1);
			return  _nExitCode; //Success
		}
</cpp>

	
	public extension EntryPoint extends Thread {
//	public class EntryPoint extends Thread {
		riding public function EntryPoint():Int {
			Thread();
		}
		
		
		public function fMain():Void {}
		
		
		
	}
}
