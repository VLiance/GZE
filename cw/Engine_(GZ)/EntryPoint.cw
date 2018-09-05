//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Thread;
	//import GZ.ThreadMsg;
	
<cpp>
	#include <GZE.h>
	#include <Main>
	
		extern Lib_GZ::cEntryPoint* GZ_CreateEntryPointClass();
		
		//gzSp<Lib_GZ::cLib> oGzLib;
		gzSp<Lib_GZ::cEntryPoint> oMain;
		
		gzInt Main( gzText8 _sArg, gzUIntX _nId, gzInt _nCmd){
			printf("\n Platform: "   gzStringize(DwPlatform)   );
		//	oGzLib = Lib_GZ::Lib::New( _nId, gzStrC( _sArg), _nCmd);
			
			
			//	oTest = gzSCast<Lib_Demo::cTest>(Lib_Demo::Test::Get(thread)->New(this));
			//Lib_GZ::cEntryPoint*  _oMain =  gzSp<Lib_Demo::cTest>( GZ_CreateEntryPointClass());
			oMain =  gzSp<Lib_GZ::cEntryPoint>( GZ_CreateEntryPointClass() );
			
			
		//Create default singleton	
		//Lib_GZ::Sys::Debug::Get(oMain->thread)->zInst = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get());
		Lib_GZ::Sys::Debug::SetInst(oMain->thread) = Lib_GZ::Sys::Debug::Get(oMain->thread)->New(oMain.get()).get();
	
	//	Lib_GZ::Sys::Debug::Get(oMain->thread)->NewSingleton();
		//Lib_GZ::Sys::Debug::CreateSingleton(oMain->thread);

	//	printf("\n Lib_GZ::Sys::Debug::GetInst(oMain->thread): %d", Lib_GZ::Sys::Debug::GetInst(oMain->thread).get() );
		
			oMain->fMain();
			
			


			
		//_oMain
			
		//	printf("\n");
		
//oTest = gzSCast<Lib_Demo::cTest>(Lib_Demo::Test::Get(thread)->New(this));


		//	return 0; // 1 Still Alive, 0 Stop, < 0 Errors
			return 1; // 1 Still Alive, 0 Stop, < 0 Errors
		}

		gzInt Update(gzFloat _nDelta){
		
			static gzInt _nCount = 0;
			//printf("Update: %d" endl_cr, _nCount);
			//fprintf(stderr,"\nUpdate: %d\n" endl_cr, _nCount);
			_nCount++;
			
			return 1; // 1 Still Alive, 0 Stop, < 0 Errors
		}
		gzInt Close(gzInt _nExitCode){
			printf("Good bye: %d \n", _nExitCode);
			return  _nExitCode; //Success
		}
</cpp>

	
	public extension EntryPoint extends Thread {
		public function EntryPoint():Void {
		}
		
		
		public function fMain():Void {}
		
		
		
	}
}
