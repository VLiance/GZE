//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "SysFileGetter.h"

using namespace GZ;

cSysFileGetter::cSysFileGetter(){
}

//GZ_SysFileGetter::GZ_SysFileGetter(gzPStr _sFolder){
void cSysFileGetter::Ini_cSysFileGetter(gzRstUStr _sFolder){
   // gzUStrAutoRestore _sTemp(_sFolder);
    _sFolder.fEnd();

    _sFolder.fPrev();

    if(_sFolder.GnCurrChar() == '/'){
       // _sFolder += gzStrL("*.*");
        _sFolder = _sFolder + gzStrL("*.*");
    }else{
        _sFolder = _sFolder + gzStrL("/*.*");
       // _sFolder = _sFolder + gzStrL("/*.*");
    }


  //  _sFolder = _sFolder + gzStrL("/*.*");
       //_sFolder = _sFolder + gzStrL("/*.*");


  // _sFolder += gzStrL("AAasdsaas");

/*
	if (GZ_cStr_Int(GZ_uStr_fCharAt(_sFolder, _sFolder->size - 1)) == GZ_fText16(L"/")){
		_sFolder = GZ_cStr(_sFolder, GZ_fText16(L"*.*"));
	}else{
		_sFolder = GZ_cStr(_sFolder, GZ_fText16(L"/*.*"));
	}
*/

   // Debug::fTrace3(_sFolder);

    gzUTF16 _sInFolder(_sFolder);
    hfind = FindFirstFileW((LPCWSTR)(gzUInt16*)_sInFolder,&found);

	//skip .
	FindNextFileW(hfind,&found);
}

gzStr cSysFileGetter::fGetNextFile(){

	//skips .. when called for the first time
	chk=FindNextFileW(hfind,&found);
	if (chk){

        gzUInt16 *aFile = (gzUInt16*)found.cFileName;
        return gzStr(aFile);
/*
        TSTR *b = (TSTR*)malloc(wcslen(found.cFileName)*sizeof(TSTR));
        memcpy(b, aFile , wcslen(found.cFileName)*sizeof(TSTR));
		return GZ_fStr((TSTRC*)b, wcslen(found.cFileName) );*/
	}



	return gzStr(gzStrL(""));
}


bool cSysFileGetter::fIsDirectory(){
    if(found.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY){
        return true;
    }else{
        return false;
    }
}

