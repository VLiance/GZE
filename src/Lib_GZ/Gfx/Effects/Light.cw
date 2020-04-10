//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Sys.Interface.Context;
	import GZ.Gfx.Vector.Box;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;
	
	/**
	 * @author Maeiky
	 */	
	public class Light extends Clip {

	
		public var oBoxColor : Box;
		public var oBoxSpecular : Box;
		public var oBox3 : Box;
		public var nSize : Int = 4;
		public var nLineWidth : Int = 1;
		
		public var nIndex : UInt;
		
		public function Light( _nX: Float, _nY:Float, _nZ:Float):Void {
			Clip(parent, _nX , _nY);
			vPos.nZ = _nZ;
			vColor.nAlpha = 0.5;
			
			oBoxColor = new Box( 0,0,  nSize,nSize,   nLineWidth);
			oBoxColor.vColor.nBlue = 0.8;
			oBoxColor.vColor.nGreen = 1.0;
			oBoxColor.vColor.nRed = 1.0;
			oBoxColor.vColor.nAlpha = 0.50;
			//oBoxColor.vColor.nAlpha = 2.75;
			
			oBoxSpecular = new Box( 0,0,  nSize,nSize,   nLineWidth);
			oBoxSpecular.vColor.nBlue = 0.0;
			oBoxSpecular.vColor.nGreen = 1.0;
			//oBoxSpecular.vColor.nGreen = 0.0;
			oBoxSpecular.vColor.nRed = 1.0;
			
			oBoxSpecular.vRot.nPitch = 3.1416 / 3.0
			oBoxSpecular.vRot.nRoll = 3.1416 / 3.0
			
			oBox3 = new Box( 0,0,  nSize,nSize,   nLineWidth);
			oBox3.vColor.nRed = 1.0;
			
			oBox3.vRot.nYaw = 3.1416 / 3.0
			oBox3.vRot.nRoll = 3.1416 / 3.0
			
			nIndex  = GzShCommun_Light.fAddLight();
		}
		
		//Overited
		override public function fUpdateParentToChild():Void {
			//Context.fGetMousePosition(); //Maybe si upder entre temps or not
			vRot.nRoll = vRot.nRoll + 0.1;
			vRot.nPitch = vRot.nPitch + 0.1;
			
			GzShCommun_Light.fUpdateLight(nIndex, this);
		}
		
		
	
	
	}
}