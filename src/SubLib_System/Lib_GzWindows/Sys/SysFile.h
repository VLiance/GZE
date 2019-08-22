//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef DEF_GZ_File
#define DEF_GZ_File
//#include "GZ/GZ.h"

//Import
//#include "GZ/Debug.h"

namespace GZ{

    namespace SysFile{
        int fCreateDirectory(gzPStr _sFolder);
      //  gzStr fGetExePath();
        gzBool fIsFileExist(gzPStr _sFile);
        gzBool fLauch(gzPStr _sFile, gzPStr _sParam);

    }

    class cSysFile {

        public:
/*
            static int _fCreateDirectory(gzPStr _sFolder);

            static gzStr _fGetExePath2();
*/
        private:



    };
}
#endif
