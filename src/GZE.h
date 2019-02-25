//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#ifndef GZ_tLib_GZ
	#define GZ_tLib_GZ
	#include "Lib_GZ/GZ_inc.h" 
#endif

#include "Lib_GZ/Lib.h"

#ifdef tPlatform_CpcDos
	#include "Lib_GZ/SysUtils/CpcDosHeader.h"
#endif

extern "C" {
	extern gzInt nMainIsAlive; //Default 1 (Alive)
	extern gzInt nMainUpdateMs; //Default 16 (~60 fps if available)
}

