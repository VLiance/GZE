//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

/*

	gzString<T> (gzString<gzUTF8>* _oOther){
	//	printf("Assing8 %d ",sizeof(T));
	  fFirstAssign(_oOther->m.aData);
	  gzp_Additional_fAssignType2
	}
	
	gzString<T> (gzString<gzUTF16>* _oOther){
	//	printf("Assing8 %d ",sizeof(T));
	  fFirstAssign(_oOther->m.aData);
	  gzp_Additional_fAssignType2
	}
	gzString<T> (gzString<gzUTF32>* _oOther){
	//	printf("Assing8 %d ",sizeof(T));
	  fFirstAssign(_oOther->m.aData);
	  gzp_Additional_fAssignType2
	}
	

	
	
	#define Please_Convert_UTF8_to_UTF16_Before(c)((void)sizeof(char[1-2*!!(c)]))
	#define Please_Convert_UTF8_to_UTF32_Before(c)((void)sizeof(char[1-2*!!(c)]))
	gzString<T> (const gzString<gzUTF8>& _oOther){
	//	printf("Assing8 %d ",sizeof(T));
	  fFirstAssign(_oOther.m.aData);
	  gzp_Additional_fAssignType
	  
	  Please_Convert_UTF8_to_UTF16_Before(gzp_IsUTF16);
	  Please_Convert_UTF8_to_UTF32_Before(gzp_IsUTF32);
	}
	
	#define Please_Convert_UTF16_to_UTF8_Before(c)((void)sizeof(char[1-2*!!(c)]))
	#define Please_Convert_UTF16_to_UTF32_Before(c)((void)sizeof(char[1-2*!!(c)]))
	gzString<T> (const gzString<gzUTF16>& _oOther){

	//printf("Assing16 %d ",sizeof(T));
	  fFirstAssign(_oOther.m.aData);
	  gzp_Additional_fAssignType
	  
	  Please_Convert_UTF16_to_UTF8_Before(gzp_IsUTF8);
	  Please_Convert_UTF16_to_UTF32_Before(gzp_IsUTF32);
	}
	
	#define Please_Convert_UTF32_to_UTF8_Before(c)((void)sizeof(char[1-2*!!(c)]))
	#define Please_Convert_UTF32_to_UTF16_Before(c)((void)sizeof(char[1-2*!!(c)]))
	gzString<T> (const gzString<gzUTF32>& _oOther){

		fFirstAssign(_oOther.m.aData);
		gzp_Additional_fAssignType
		
	  Please_Convert_UTF32_to_UTF8_Before(gzp_IsUTF8);
	  Please_Convert_UTF32_to_UTF16_Before(gzp_IsUTF16);

	}
*/
