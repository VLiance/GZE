package  { 
	

	import GZ.Debug.Debug;

	<cpp>
	#include <android/log.h>
	#define GZ_Trace( priority , format, ...)  __android_log_print(priority, "GZ", format, ##__VA_ARGS__)
	</cpp>
	
	
	public class OpDebug overplace Debug  {

		
		public function OpDebug():Void{
			Debug();
		}
			
		override function fTrace(_sValue:String):Void {
			<cpp>
			    GZ_Trace(ANDROID_LOG_VERBOSE,"T:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}	
			
		override function fWarning(_sValue:String):Void{
			<cpp>
			      GZ_Trace(ANDROID_LOG_WARN,"W:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override function fError(_sValue:String):Void{
			<cpp>
			     GZ_Trace(ANDROID_LOG_ERROR,"E:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override function fPass(_sValue:String):Void{
			<cpp>
			     GZ_Trace(ANDROID_LOG_INFO, "P:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
		override function fFatal(_sValue:String):Void{
			<cpp>
			     GZ_Trace(ANDROID_LOG_FATAL, "F:%s\n", (char*)_sValue.fToCStr().get());
			</cpp>
		}
}