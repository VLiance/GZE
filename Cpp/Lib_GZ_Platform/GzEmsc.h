//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.

#include "Lib_GZ/GZ.h"
#include "EmscHeader.h"

namespace GzEmsc{

	const char* aGLContextName[] = {"unsuported","disabled", "webgl2", "webgl", "experimental-webgl", "moz-webgl"};
	

	
	//gzStr8 aGpuVal[] = {gzU8("unsuported"), gzU8("disabled"), gzU8("2"), gzU8("1"), gzU8("experimental"), gzU8("experimental(moz)")};
	inline gzInt fDetectGPU(){ 
		gzInt _nGpuId = EM_ASM_INT_V({
			var names =                                   (['webgl2',  'webgl', 'experimental-webgl', 'moz-webgl']);
			if (!!window.WebGLRenderingContext) {
				var gl = false;
				var canvas = document.createElement("canvas");
				for(var i in names) {
				try {
				gl = canvas.getContext(names[i]);
				if (gl && typeof gl.getParameter == "function") {
				// Module.print('GL: ' + names[i]);
				// return names[i];
				//"WebGL is supported"
				return i;
				}
					} catch(e) {}
				}
				// WebGL is supported, but disabled
				return -1;
			}
			//WebGL not supported
			return -2;
		});
		
		return _nGpuId + 2;
	}
	
	inline gzBool fIsGpuSupported(gzInt _nGpuVal){ 
		if(_nGpuVal > 1){
			return true;
		}
		return false;
	}
	
	inline gzStr8 fGetVersion(){ 
	//	return gzStrC(((char*)((std::string)(gl.call<std::string>("getParameter", gl["VERSION"]))).c_str()));
	return gzU8("");
	}
	
	
	
	
	
	

}


