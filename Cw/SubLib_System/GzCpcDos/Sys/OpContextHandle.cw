package  { 
	
		
	import GZ.Sys.System;
	import GZ.Sys.Message.ContextLink;
	import GzCpcDos.Sys.OpContext;
	import GZ.Sys.ContextHandle;
	
	<cpp_h>
		#include "Lib_GZ/SysUtils/CpcDosHeader.h"
	</cpp_h>
	
	<cpp_h>
		extern gzSp<CpcdosOSx_CPintiCore> oCpcdos; 
	</cpp_h>
		
	<cpp>
	gzSp<CpcdosOSx_CPintiCore> oCpcdos; 
	</cpp>
	
		
	public class OpContextHandle overplace ContextHandle {
		
		
		public var nIdContextGZE : Int;
			
	
		
		public function OpContextHandle(_oLink : ContextLink): Void {
			ContextHandle(_oLink);
		}
		
		override public function fCreateContextHandle(): Bool {
			Debug.fTrace1("Please Insert CreateContextHandle code here");
			<cpp>

			
			// On creer le contexte pour Cpcdos en renvoyant la taille X, Y et le pointeur vers le tableau de pixels 1D
			int Size_X = 800;
			int Size_Y = 600;
			nIdContextGZE = oCpcdos->Create_Context(Size_X, Size_Y);
			</cpp>
			Debug.fTrace1("ContextId: " + nIdContextGZE);
				
		}
		override public function fIniPixelDrawZone(): CArray<Int32>{
			Debug.fTrace1("Please Insert IniPixelDrawZone code here");
			
			<cpp>
			// Retourner le pointeur du contexte depuis Cpcdos
			return (gzInt32*) oCpcdos->Init_Get_Context_PTR(nIdContextGZE);
			</cpp>
		}
		override public function fBlit():UIntX {
			<cpp>
			// Blitter a l'affichage
			oCpcdos->Blitting(nIdContextGZE); 
			</cpp>
			
		}
				
	}
}