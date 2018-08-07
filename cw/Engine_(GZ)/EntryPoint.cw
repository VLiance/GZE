//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Thread;
<cpp>
	#include <GZE.h>
	#include <Main>
	
		extern Lib_GZ::cEntryPoint* GZ_CreateEntryPointClass();
		
		gzSp<Lib_GZ::cLib> oGzLib;
		
		gzInt Main( gzText8 _sArg, gzUIntX _nId, gzInt _nCmd){
			printf("\n Platform: "   gzStringize(DwPlatform)   );
			oGzLib = Lib_GZ::Lib::New( _nId, gzStrC( _sArg), _nCmd);
			
			
			Lib_GZ::cEntryPoint*  _oMain =  GZ_CreateEntryPointClass();
			
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
	}
}
