//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



#if !( defined tHDef_Lib_GZ_gzEase)
#define tHDef_Lib_GZ_gzEase

//#include "Lib_GZ/Base/GzTypes.h"
//#include "Lib_GZ/Base/GzBaseFunc.h"
////#include "Lib_GZ/Base/GzMem.h"

		
	template <class T>
	class gzEase { public:
	  //  Canvas& canvas;
		T nVal;
		T nTo;
	//	gzFloat nFracVal;
		//gzFloat nLimit;
		//gzFloat nSpeed;

		gzEase():nVal(0),nTo(0)  {
		}
		gzEase(T _val):nVal(_val),nTo(_val)  {
			//  printf("\nIni/Set %f", _val);
		}
		
		inline T& operator= (const T &_val) {
			//	printf("\nSet %d", _val);
				nVal = _val;
				nTo = _val;
			//	nFracVal = (gzFloat)_val;
				
				return nVal;
		}
	
		inline operator T () const {
			//printf("\nGet %d", nVal);
			return nVal;
		}
		/*
		inline void fSetSpeed(gzFloat _nSpeed ){
			if(_nSpeed >  -1.0 && _nSpeed < 1.0 ){
				_nSpeed = 1.0;
			}
			nSpeed = _nSpeed;
		}*/
		/*
		inline void fSetLimit(gzFloat _nLimit ){
			// nLimit = pMath::fAbs(_nLimit);
			 nLimit =_nLimit;
		}*/
		
		inline void fTo(T _nDest){
			nTo = _nDest;
		}
		
		inline void fStep(gzFloat _nSpeed = 10, gzFloat _nLimit = 999999999){ //Todo, limit to float max
			/*
			if(_nSpeed >  -1.0 && _nSpeed < 1.0 ){
				_nSpeed = 1.0;
			}*/
			
			if(_nSpeed > 1){
				gzFloat _nEase = (nTo - nVal)/_nSpeed;
				if(_nEase > _nLimit){
					_nEase = _nLimit;
				}
				if(_nEase < -_nLimit){
					_nEase = -_nLimit;
				}
				nVal += _nEase;
				
			}else if(_nSpeed < -1){
			
				gzFloat _nEase = (nTo*(-0.03) - nVal)/_nSpeed;
				if(_nEase > _nLimit){
					_nEase = _nLimit;
				}
				if(_nEase < -_nLimit){
					_nEase = -_nLimit;
				}
				nVal += _nEase;
				if( nVal  > nTo){//Limit
					nVal = nTo;
				}
			}

		//nVal = nFracVal;
		}

		
		
		
		
		
		
		
		
		
		
		
		
		

		/* // useless
	   T operator+ (const T &_val) {
			return nVal + _val;
		}*/
	};
	
	
	
	/*
		class gzEase  {
		
			private:
				gzFloat nVal;
				
				
			public:
				
				
				gzEase(gzFloat _other)  {
					printf("\nconstset");
					nVal = _other;
				}
				
				gzFloat& get() {
					printf("\nget1");
					return nVal;
				}
				
				const gzFloat& get() const {
					printf("\nget2");
					return nVal;
				}
			
			
				inline gzEase operator+(const gzFloat  _other)  {
					nVal += _other; 
					return *this;
				}
				
	
				
				gzFloat&  operator=(gzFloat& _other)  {
					printf("\nset");
					nVal = _other;
				}
				
				
				//set()
				

		};*/
		
	




#endif
