//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


#ifdef D_Platform_Web_Emsc
#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
#include "Lib_GZ/Base/Container/gzVal.h"
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

//#define GZ_fMalloc(_nNb, _nSize) malloc((_nNb) * (_nSize))

 void fEMSC_Free(void* _ptr){

free(_ptr); return;


	_ptr = &(((gzVal**)_ptr)[-1]) ;
	delete ((gzVal**)_ptr)[0];
	
	EM_ASM_ARGS({
		Module._free($0); //gzMallocPtr.byteOffset
	}, _ptr );	

	

	//gzVal* _oVal =  ((gzVal*)_ptr - sizeof(gzVal*));
	//free((char*)_ptr - sizeof(void*));//Move back JsMem ptr
 }

 void* fEMSC_Calloc(int _nSize){
	void* _ptr = fEMSC_Malloc(_nSize);
	memset(_ptr, 0, _nSize);
	return _ptr;
} 
	
 void* fEMSC_Malloc(int _nSize){
 
 
 return malloc(_nSize);
		
		_nSize += sizeof(void*); //For JsMem
 
		//TODO !!!!!!!!!!!!!
		
		 EM_ASM_ARGS({
				
				dEmscMalloc = cwrap('GzfEmscMalloc', 'number', ['number']);
		  
				var numBytes = $0; 

				//var malloc = Module._malloc(numBytes);
				 malloc = Module._malloc(numBytes);
				gzMallocPtr = new Uint8ClampedArray(Module.HEAPU8.buffer, malloc, numBytes); 
				
				if(numBytes > 800*500* 4 && numBytes < 800*800* 4 ){
					gzMallocPtrTest = new Uint8ClampedArray(gzMallocPtr,0,50); 
					
				}else{
				gzMallocPtrTest = 0;
				}
				//gzMallocPtr = new Uint8Array(Module.HEAPU8.buffer, malloc, numBytes); 
				 // gzMallocPtr.set(new Uint8Array(typedArray.buffer));
				// call the c function which should modify the vals
				dEmscMalloc(gzMallocPtr.byteOffset);
				//dEmscMalloc(gzMallocPtr.byteOffset, gzMallocPtr.buffer);
				//gzArrayHeap = new Int8Array(gzMallocPtr.buffer, gzMallocPtr.byteOffset + $1, numBytes);
				
				
				
		//}, _nSize  );	
		//}, _nSize * 4 );	
		}, _nSize  );	
		
		//TODO
		//JsMem = val::global("gzMallocPtr"); //TODO
		//TODO
//	#define GZ_fSetJSmem(_obj) _obj->JsMem =  (gzVal*)new gzVal(val::global("gzMallocPtr")); //TODO delete //Get last calloc ptr
		
		
		
	   gzVal* _ptrJSMem = (gzVal*)new gzVal(val::global("gzMallocPtr")); //TODO delete //Get last calloc ptr
	   

//return gzEmscPtrMalloc; //Work
		
		((gzVal**)gzEmscPtrMalloc)[0] = _ptrJSMem;

		return &(((gzVal**)gzEmscPtrMalloc)[1]);

	
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


