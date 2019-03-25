//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#ifndef DEF_GZ_WrapFont
#define DEF_GZ_WrapFont

#include "Lib_GZ/GZ.h"
#include "Lib_GZ/File/RcFont.h"
#include "Lib_GZ/Lib/SFF/stb_truetype.h"
#include "Lib_GZ/File/Font/CharData.h"

namespace Lib_GZ{namespace Wrap{
    namespace pFont{
        gzInt fOpen(File::cRcFont* _oRc);
        gzInt fDelete(File::cRcFont* _oRc);
       void fGetCharData(File::Font::cCharData* _oChar);
	   	int fGetKernAdvance(File::cRcFont* _oRc, gzInt ch1, gzInt ch2);
}}}

/*
//#include "GZ/Lib/SFF/stb_truetype.h"

namespace GZ{
    class cRcFont;
    class cRcImg;

    namespace Font{
        gzInt fOpen(cRcFont* _oRc);
        gzInt fDelete(cRcFont* _oRc);
    }


class cFont {

    public:



    private:


};
}
*/
#endif

