//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "Lib_GZ/Lib.h"
#include "Lib_GZ/Lib_GZ.h"

		

namespace Lib_GZ{
	struct uLib;
	namespace Lib{
	
	   uLib* rLastLib = 0;  //zero-initialization -> before dynamic -> ini order ok
       gzUInt nClass = 0; //SpecialVar
	   
	   
	   gzInt32 nThreadCount = 0; //TODO atomic
	}
}



namespace Lib_GZ {
	namespace Global {
		gzInt nNumWindows = 0;
	}

	namespace Lib {


		GzExport void* Lib_GZ_fRegisterLib(void* _rLib){
			Lib_GZ::uLib* rTemp =  Lib_GZ::Lib::rLastLib;
			Lib_GZ::Lib::rLastLib = (Lib_GZ::uLib*)_rLib;
			return rTemp;
		}
		gzPtrFuncRPAny fRegisterLib = &Lib_GZ_fRegisterLib;

		
		//GzExport void* Lib_GZ_fAllClass(void*);
		//void fAllClass(uOverplace* _rLastClass){ 
		//GzExport gzBool Lib_GZ_fAllClass(uOverplace* _rLastClass){ 
		GzExport gzBool Lib_GZ_fAllClass(void* p_rLastClass){ 
			uOverplace* _rLastClass = (uOverplace*)p_rLastClass;
			
			static int _nId = 0;
			GZ_printf("fALLCLASS: %p ", _rLastClass );
				
			while (_rLastClass != 0){
				_rLastClass->nId = _nId;
			
				( gzU8("\n --Class :") + _rLastClass->sName + gzU8(" id:") +  gzStrUI( _rLastClass->nId)).fPrint();	
				fDoOverPlace(_rLastClass);
				
				_nId++;
				_rLastClass = _rLastClass->rPrec;
			}
			
			return true;
		}
		gzPtrFuncRBoolPAny fAllClass = &Lib_GZ_fAllClass;
		
		
		

		void fLoadAllLib(){
			GZ_printf("\nLoadAll_Libs!!");
		
			uLib* _rLib = IniLib_Lib_GZ();//Default lib
				
			GZ_printf("\n--IniLib :"  );   _rLib->sName->fPrint();  
			 GZ_printf("\n"  ); 
			if(_rLib != NULL){
			
				//fAllClass(*_rLib->_rLastClass);
				Lib_GZ_fAllClass(*_rLib->_rLastClass);
				fIniAllClass(*_rLib->_rLastClass);
			
			}
			return; 
			//GZ_printf("\n -----_rLasLib : %d \n", (int)rLastLib);
		}


		////////////////////////////////////////////////
		void fLoadLib(Lib_GZ::uLib* _rLib){ 
			if(_rLib != NULL){
				//fAllClass(*_rLib->_rLastClass);
				Lib_GZ_fAllClass(*_rLib->_rLastClass);
			}
			
			fIniClassLib(_rLib);//TODO IS better place?
		}

	

		void fDoOverPlace(uOverplace* _rClass){
				uOverplace* _subClass = _rClass;
				while(_subClass->cfExtAdr != 0){
					GZ_printf("\n     --Do Overplace");
					uOverplace* _subExtClass = ((uOverplace*)_subClass->cfExtAdr());
					_subExtClass->cfOver = _rClass->cfOri;
					_subClass = _subExtClass;
				}
		}
		////////////////////////////////////////////////////

		void fIniAllClass(uOverplace* _rLastClass){ 


			GZ_printf("fIniALLStaticCLASS: %p ", _rLastClass );
				
			while (_rLastClass != 0){
				( gzU8("\n --IniClass :") + _rLastClass->sName + gzU8(" id:") +  gzStrUI( _rLastClass->nId)).fPrint();	
				//fDoOverPlace(_rLastClass);
				_rLastClass->cfIniClass();
				
				
				_rLastClass = _rLastClass->rPrec;
			}
		}
		void fIniClassLib(Lib_GZ::uLib* _rLib){ 
			if(_rLib != NULL){
				fIniAllClass(*_rLib->_rLastClass);
			} 
		}
		////////////////////////////////////////////////////////////


	}
}
