//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef DEF_GZ_FileGetter
#define DEF_GZ_FileGetter
#include "GZ/GZ.h"


    #define UNICODE
    #define _UNICODE
    //#define __MSVCRT__ //wfopen
    #define _CRT_SECURE_NO_DEPRECATE //Remove Warning
    #define _WIN32_WINNT 0x0501
    #define _WIN32_IE 0x0501
    #include <windows.h>
  //  #include <Windowsx.h>
    #include <stdio.h>
    #include <time.h>
    #include <tchar.h>	// Include Unicode support functions
    #include <wchar.h>	//wfopen

//Import
#include "GZ/Debug.h"

namespace GZ{

class cSysFileGetter : public GZ::cDelegate  {

	WIN32_FIND_DATAW found;
    HANDLE hfind;
    char folderstar[255];
    int chk;

	public:
       cSysFileGetter();
       void Ini_cSysFileGetter( gzRstUStr _sFolder);
       // GZ_SysFileGetter(gzPStr _sFolder);
        gzStr fGetNextFile();
        bool fIsDirectory();

	private:

};
namespace SysFileGetter{
    //Object Creation Wrapper
    inline gzSp<GZ::cSysFileGetter> New(gzRstUStr _sFolder){
        gzSp<GZ::cSysFileGetter>_oTemp = gzSp<GZ::cSysFileGetter>(new GZ::cSysFileGetter());
        _oTemp->Ini_cSysFileGetter(_sFolder);
        return _oTemp;
    }
}
}
#endif
