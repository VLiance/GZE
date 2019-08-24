//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#ifdef D_Platform_Web_Emsc
#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
/*
	typedef struct
	{
	   int len, limit;
	   unsigned int signature;
	   gzJsMem* JsMem;
	} stb__arr;
*/
	
	
//void* gzEmscPtrBuffer;
		

extern "C" {
	static void* gzEmscPtrMalloc;

	EMSCRIPTEN_KEEPALIVE
	__attribute__((noinline)) float GzfEmscMalloc(float* vals){
		
		gzEmscPtrMalloc = vals;
	//	gzEmscPtrBuffer = buffer;
		//printf("\n *** call my_emscripten_func");
		return 0;
	}

}


	
static void * fEMSC_Malloc(int size){
	
		
		 EM_ASM_ARGS({
				
				dEmscMalloc = cwrap('GzfEmscMalloc', 'number', ['number']);
		  
				var numBytes = $0; 

				var malloc = Module._malloc(numBytes);
				gzMallocPtr = new Uint8Array(Module.HEAPU8.buffer, malloc, numBytes);
				
				// call the c function which should modify the vals
				dEmscMalloc(gzMallocPtr.byteOffset, gzMallocPtr.buffer);
				//gzArrayHeap = new Int8Array(gzMallocPtr.buffer, gzMallocPtr.byteOffset + $1, numBytes);
				
		}, _nSize * 4 );	
		
		//TODO
		//JsMem = val::global("gzMallocPtr"); //TODO
		//TODO
		
		return gzEmscPtrMalloc;

	
	/*
	//#ifdef GZ_tWeb_Emsc
		printf("\n\n \n\n ***** sizeof() : %d \n\n ",  sizeof(stb__arr) );
	
		 EM_ASM_ARGS({
				
				my_emscripten_func = cwrap('my_emscripten_func', 'number', ['number', 'number']);
		  
				var numBytes = $0; 

				var malloc = Module._malloc(numBytes);
				gzMallocPtr = new Uint8Array(Module.HEAPU8.buffer, malloc, numBytes);
				
				// call the c function which should modify the vals
				my_emscripten_func(gzMallocPtr.byteOffset, gzMallocPtr.buffer);

				//gzArrayHeap = new Int8Array(gzMallocPtr.buffer, gzMallocPtr.byteOffset + $1, numBytes);
				gzArrayHeap = new Int8Array(gzMallocPtr.buffer, gzMallocPtr.byteOffset + $1, numBytes);
				
				
		}, size * 2, sizeof(stb__arr) );	
		
		printf("\n0 " );

		stb__arr* _ptrMAlloc = (stb__arr*)gzEmscPtrMalloc;
		_ptrMAlloc->JsMem = GzCurrJsMem;
		
		GzCurrJsMem->MallocPtr = val::global("gzMallocPtr");
		GzCurrJsMem->Array = val::global("gzArrayHeap");
		
	//	_ptrMAlloc->JsMem  = (  gzJsMem*)56;
		
		
		return gzEmscPtrMalloc;
		
	#else
		return malloc(size);
   	#endif
	*/
	//printf("\n\n\n SDASDAS********************************************WQ**SAD*sa*d *sa*\n\n");
	//return malloc(size);
}
	
	
#endif


