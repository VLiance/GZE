//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "SysFile.h"

    #define UNICODE
    #define _UNICODE
    //#define __MSVCRT__ //wfopen
    #define _CRT_SECURE_NO_DEPRECATE //Remove Warning
    #define _WIN32_WINNT 0x0501
    #define _WIN32_IE 0x0501
    #include <windows.h>
 //   #include <Windowsx.h>
    #include <stdio.h>
    #include <time.h>
    #include <tchar.h>	// Include Unicode support functions
    #include <wchar.h>	//wfopen

namespace GZ{
namespace SysFile{


int fCreateDirectory(gzPStr _sFolder){

    gzUTF16 _sFolderU16(_sFolder);
   // WCHAR* _WinName =


   //m_NewWCharFromXStr(_wcFolder, _sFolder);
    //TODO Max 256 char execept if  "\\?\"  prefix but must change slash to baskslash

   if( CreateDirectoryW((WCHAR*)(gzUInt16*)_sFolderU16, 0)){
    return 1;
   }else{
    return 0;
   }
//return 0;
}
#define MAX_PATH 260
/*
gzStr fGetExePath(){
    wchar_t result[ MAX_PATH ];

    GetModuleFileNameW( NULL, result, MAX_PATH ); //MinReq:  WinXp
    //Get length
    gzInt _nLength = 0;
    for(gzInt i  = 0; i < MAX_PATH; i++){
        if(result[i] == 0){
            break;
        }
        _nLength++;
    }
    ///////
    gzStr _sPath((gzUInt16*)result);
    _sPath.fReplaceAll(gzStrL("\\"), gzStrL("/"));
    _sPath.fBegin();
    return _sPath;  //Call GZ_fUnSet(_sVal);
}*/


gzBool fIsFileExist(gzPStr _sFile){
    gzUTF16 _sUtf16File(_sFile);
    DWORD attr = GetFileAttributes((LPCWSTR)(gzUInt16*)_sUtf16File);
    if(attr == INVALID_FILE_ATTRIBUTES || (attr & FILE_ATTRIBUTE_DIRECTORY)){
        return false;   //  not a file
    }else{
        return true;
    }
}


gzBool fLauch(gzPStr _sFile, gzPStr _sParam){
    gzUTF16 _sParam16(_sParam) ;
    gzUTF16 _sFile16(_sFile) ;

    SHELLEXECUTEINFO commande;
    ZeroMemory (&commande, sizeof (SHELLEXECUTEINFO));
    commande.cbSize = sizeof (SHELLEXECUTEINFO);

    commande.lpVerb = L"open";
    commande.lpFile = (LPWSTR)_sFile16.get();
    //commande.lpParameters = L"aaaa";
    commande.lpParameters = (LPWSTR)_sParam16.get();
    //commande.nShow = SW_MINIMIZE;
    commande.nShow = SW_SHOW;
    commande.fMask = SEE_MASK_NOCLOSEPROCESS;
    ShellExecuteEx(&commande);
   // WaitForSingleObject(commande.hProcess, INFINITE);
    return true;
}





}
}
