package  { 

	import GZ.Gpu.GpuInfo;
	import GzOpenGL.OpenGL;
	
	
	<cpp_h>
		#include "Lib_GzOpenGL_Windows/glWin.h"
	</cpp_h>
	
		
	
	public class OpGpuInfo overplace GpuInfo  {
		
		
		override public function fIniFunctions():Bool{
			
			<cpp>
			Lib_GZ_OpenGL::SysGpuFunc::fGetGpuFunctions(); //Only if not already done
			</cpp>
	
			return true;
		}
		
		
		
		override public function fGetVersion():Bool{
			
			var _nMaj : Int = 0;
			var _nMin : Int = 0;

			OpenGL.fGetIntegerv(MAJOR_VERSION, _nMaj);
			OpenGL.fGetIntegerv(MINOR_VERSION, _nMin);

			GpuInfo.nVersionMinor = _nMin;
			GpuInfo.nVersionMajor = _nMaj;
			
			<cpp>
			#define GZ_OpenGL_MinimalVersionMajor 3
			#define GZ_OpenGL_MinimalVersionMinor 3
			if( _nMaj <  GZ_OpenGL_MinimalVersionMajor){
				return false;
			}
			if( _nMaj ==  GZ_OpenGL_MinimalVersionMajor && _nMin <  GZ_OpenGL_MinimalVersionMinor){
			  return false;
			}
			</cpp>
			
			Debug.fTrace("GetVersion : nVersionMinor" + GpuInfo.nVersionMinor );
			Debug.fTrace("GetVersion : nVersionMajor" + GpuInfo.nVersionMajor );
			return true;

			
		}
		
		
		
		
		
		
	}
}