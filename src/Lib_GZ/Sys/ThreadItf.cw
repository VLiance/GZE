package  { 

	import GZ.Sys.Interface.Context;
	import GZ.Base.Thread.Thread;
	import GZ.Sys.ThreadObj;
	import GZ.File.File;
	import GZ.Sys.System;
	import GZ.File.Font;
	import GZ.Input.Key;
	import GZ.Base.Property.Property;
	
	import GzOpenGL.OpenGL;
	import GZ.Gpu.GpuObj.GpuObject;

	public class ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
		<cpp>
			printf("\nnew ThreadItf Debug");
		</cpp>	
			//Create default debug singleton for this new thread
			Debug = new Debug();
			Property = new Property(""); //TODO pure func? Passing thread info?
			System = new System();
			File = new File("Sys|CurrentModule");
			Font = new Font();
			Key = new Key();
			Debug.fInfo("-- New ThreadItf --");
			
			OpenGL = new OpenGL();
			//GpuObject = new GpuObject();
			<cpp>
			printf("\n-- thread -- ");
			printf("\n-- thread# -- %p ", thread);
			printf("\n-- New ThreadItf -- %p , id: %d \n", thread, thread->nId);
			printf("\n-- End ThreadItf -- ");
			</cpp>
		}

		
		
	}
}
