//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



#if !( defined tHDef_Lib_GZ_gzVal)
#define tHDef_Lib_GZ_gzVal

#include "Lib_GZ/Base/GzTypes.h"
#include "Lib_GZ/Base/GzBaseFunc.h"
#include "Lib_GZ/Base/GzMem.h"
//#include "Lib_GZ/Base/Container/String/gzString.h"


#ifdef D_Platform_Web_Emsc
	#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"

		#define GzNullVal emscripten::val::global("Null")

	
		class gzVal : public emscripten::val {
			public:
	
				inline gzVal(): emscripten::val(0){};
				inline gzVal( emscripten::val  _oVal) : emscripten::val(_oVal){};
				inline gzVal(gzVal&  _oVal) : emscripten::val(_oVal.get()){};
				
				//GzNullVal
				//gzVal(const char* v) : emscripten::val(v){};
				gzVal(const char* v) : emscripten::val(v){};
				
				//gzVal(gzStr8 _str) : emscripten::val( (const char* )_str.array() ){};
				
				//explicit gzVal(T* value)  : emscripten::val(value?0:value){		
				
				template<typename T>
				gzVal(T* value)  : emscripten::val(GzNullVal){
					if(value != 0){
						*this = emscripten::val(value);//Possible? JS accept ptr?
					}
				};
				
				
				
				
				template<typename T>
				explicit gzVal(T&& value)  : emscripten::val(value){};
				 
				 
				 
				
				
				
				const emscripten::val& get() {	
					return (const emscripten::val&)*this;
				}
				
				
				/*
				 gzVal& operator=(gzVal&& v) {
					 ///////
					return *this;
				}*/
				
				/*
				inline  operator gzInt()const {
					return this->as<int>();
				}*/
				

				gzVal& operator=(const gzVal& _v) {
					static_cast< emscripten::val&>(*this) = ( emscripten::val&)(_v);
					return *this ;
				}
			
				template<typename ReturnValue, typename... Args>
				ReturnValue call(const char* name, Args&&... args) const {
					return	emscripten::val::call<ReturnValue>(name, gzVal(args).get()... );
				}
			
				template< typename... Args>
				gzVal fCall(const char* name, Args&&... args) const {
					return	emscripten::val::call<val>(name, gzVal(args).get()... );
				}
			
			
			
			
				template<typename K>
				void set(const K& key, const gzVal& _v) {	
					emscripten::val::set(key, (const emscripten::val&)(_v) );
				}
				
			    template<typename K, typename V>
				void set(const K& key, const V& value) {
					emscripten::val::set(key, value);
				}
				

			private:

		};
		/*
		class gzPtrVal(){
			public: 
			gzVal val;
			gzPtrVal(const gzVal& _oVal){
				val = _oVal;
			}
		} */
	
#else
	//typedef gzUIntX gzVal;
	typedef gzUInt gzVal; //OGL on Android64 use Int32
	#define GzNullVal 0;
#endif



#endif
