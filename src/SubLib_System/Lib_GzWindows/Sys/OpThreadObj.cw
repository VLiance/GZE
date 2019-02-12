package  { 

	import GZ.Base.Thread.Thread;
	import GZ.Base.Thread.ThreadExt;
	import GZ.Gfx.Interface;
	import GZ.Sys.ThreadObj;
	
			<cpp_h>
			#include "Lib_GzWindows/MainHeader.h"
			</cpp_h>
			
	public class OpThreadObj overplace ThreadObj  {
	
		<cpp>
			//#include "Lib_GZ_Platform/Windows/MainHeader.h"
			//namespace SysThreadObj {
				#ifndef GZ_tMonothread
				//class cThreadObj;
				
				
				HANDLE hThread;
				//DWORD WINAPI fThreadProc(void *_pParam );
				//Create a thread and loop inside until finish
				DWORD WINAPI fThreadProc(void *_pParam ) {
					Lib_GZ::Sys::cThreadObj* self = ( Lib_GZ::Sys::cThreadObj*)_pParam;
					printf("\n---- Started : %d",  Lib_GZ::Global::nNumWindows);
					self->dCallBack.fCall(self->oThreadExt.get());

					Lib_GZ::Global::nNumWindows--;
					self->bStarted = false;
					printf("\n---- end : %d",  Lib_GZ::Global::nNumWindows);
					return 0; //Temp
				}

				#endif
			//}
		</cpp>
		
	

		public function OpThreadObj(_oThreadEx : ThreadExt, _dCallBack : Delegate<fThreadCallBack>):Void{
			<cpp>
			//printf("\n************qqsssqqqqqqqqqqqqqqqqq\n");
			</cpp>
			ThreadObj(_oThreadEx, _dCallBack);
		}
		override public function fSetPriority(_nPriority : UInt):Void{
		
		}
		
		
		
		override public function fThreadCallBack(_oThreadEx : ThreadExt):Void{
		
		}
		
		override public function fStart():Void{
		
			<cpp>
			
			 #ifndef GZ_tMonothread
			    OpThreadObj::hThread = CreateThread(NULL, 0, &OpThreadObj::fThreadProc, this, 0,  NULL);
			  if(OpThreadObj::hThread) {
					bStarted = true;
					Lib_GZ::Global::nNumWindows++; //Must be atomic
				  //  printf("\n---- NumWindows++ -Create : %d",  Global::nNumWindows);
			  }else{
			  	</cpp>
				   Debug.fError("Error on Thread creation" );
				<cpp>
			  }
			  #endif

			</cpp>
			Debug.fWarning("fStart isssss implemented in ThreadObj");
		}
		override public function fJoin():Void{
			<cpp>
				#ifndef GZ_tMonothread
					printf("fCancel\n");
					 #ifndef GZ_tMonothread
					//if (TerminateThread(hThread, 0) == 0){
					//    Debug::fError(gzStrL("Error on Thread cancel"));
					// }
					#endif
					bStarted = false;
				#endif
			</cpp>
		}
		override public function fCancel():Void{
			<cpp>
				#ifndef GZ_tMonothread
				//if (TerminateThread(hThread, 0) == 0){
				//    Debug::fError(gzStrL("Error on Thread cancel"));
				// }
				#endif
			</cpp>
		}
		
		override public function fClose():Void{
			<cpp>
				#ifndef GZ_tMonothread
					printf("fClose\n");
					printf("\n---- Delete Instance : %d",  Lib_GZ::Global::nNumWindows);
					/*
					if(oThread){
						oThread->bRun = false; //Must be atomic TODO
					}*/
					WaitForSingleObject( OpThreadObj::hThread, INFINITE);//Wait for thread to finish
					CloseHandle( OpThreadObj::hThread);
				#endif
			</cpp>
		}
		
	}
}
