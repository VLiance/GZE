//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 

	import GZ.Gfx.Dispacher;
	import GZ.Sys.Window;
	import GZ.Gfx.Object;  
	import GZ.Gfx.Buffer;  
	import GZ.Gfx.Interface;  
	import GZ.Gfx.Attribute;  
	import GZ.Base.Math.Math;
	import GZ.Gpu.GpuObj.GpuObject;

	
	/**
	 * @author Maeiky
	 */	
	public extension Root extends Dispacher {
		
		public wvar oParent : Object;
	//	public var oWindow : Window;

	
		public enum eType : Int {
			None;
			Tile;
			Img;
		}
		
		public var hType : eType;
		
		
		
		private var nEventValue : Int;
		public var bFirstSetLimit : Bool;
		public var bLimitLock : Bool = false;
		public var bDeleteReady : Bool = true;
		public var bToDelete : Bool = false;
		
		//Maybe better in object///
		public var bContainer : Bool = false;
		
		
		public var nParBrRed :Int =  0;
		public var nParBrBlue :Int = 0;
		public var nParBrGreen :Int = 0;
		public var nParAlpha :Int = 0;
		
		public var nParRevRed :Int =  0;
		public var nParRevBlue :Int = 0;
		public var nParRevGreen :Int = 0;

	
		public var nParRotation : Float = 0;
		public var nParYaw : Float = 0;
		public var nParPitch : Float = 0;
		
		public wvar oItf  : Interface;
		public wvar oDstBuff  : Buffer;
		

		
		public function Root(_oParent:Root):Void {
	//		oWindow = 0;
	//		oItf = 0;
			Dispacher();
			fChangeParent(_oParent);
		}
		
		public function fChangeParent(_oParent:Root, _bUpdateManually : Bool = false):Void {
			if(_oParent != null){
				oParent = _oParent;
			}
			if(_oParent != null){  //TODO MUST BE A SCREEN  //TODO check if it itself
				oItf = _oParent.oItf;
				oDstBuff = _oParent.oDstBuff;
				
				if (_bUpdateManually == 0) {
					_oParent.fAddChild(this);
				}
			}
			
		}
		
	
		public function fUpdateChild():Void {
			fDispatchUpdate();
		}
	
		
		/////////////////////////////////////////////////
		/////////////////////////////////////////////////
		
		public function fUpdateRoot():Void {

			fUpdateParentToChild(); // Him
			fApplyPos();
			fApplyColor();
			fApplyTransform();
			fUpdateChild(); //Other Child 
			
			/*
			fUpdateChildToParent(); //Call other child ! Useless ?, if active?
			fApplyPos();
			fApplyColor();
			fApplyTransform();
			*/
		}
		
		/////////////////////////////////////////////////
		public function fRender( ):Void {
			
		}
		
		//Overited
		public function fApplyPos():Void {
		}
		
		//Overited
		public function tDelete():Void {
			if (bDeleteReady) {
			}else {
				bToDelete = true;
			}
		}
		
		//Overited
		public function fFinalUpdate():Void {
		}
		
		//Overited
		public function fApplyTransform():Void {
		}
		
		
		//Overited
		public function fUpdateChildToParent():Void {
		}
		
		//Overited
		public function fUpdateParentToChild():Void {
		}
		

		//Overited
		public function fApplyColor():Void {	
		}
		
		
		public function fContextResume():Void {
		}
		
		
		
	}
	
			
		
	}
}