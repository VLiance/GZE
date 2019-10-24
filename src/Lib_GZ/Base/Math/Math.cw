//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

#Wrapper

package  { 

	public class Math  {
		
				
		 public const var nPrec : Int;
		 
		 public const var nPI : Float64;
		 public const var nR90 : Float;
		 public const var nSP : Int;
		//define var nPrec : Int;
		public const var nHPrec : Int;
		public const var nPixSP : Int;
		public const var nPixSP8 : Int;
		public const var nPixSPDiff : Int;
		public const var nPixPrec : Int;
		public const var nPixHPrec : Int;
		public const var nDivPrec : Int;
		
		public const var nMidVal : UInt;
		
		public const var nMaxInt : Int;
		public const var nMinInt : Int;
		 
		 /*
		static public function fFrac(_nVal:Float):Float;	
		static public function fIFrac(_nVal:Int):Int;	
		static public function fITronc(_nVal:Int):Int;	
		static public function fIPixFrac(_nVal:Int):Int;	*/
		//static changeRem GZ_ToPix function fIToPix(_nVal:Int):Int;	
			
		pure public function fAbs(_nVal:Float):Float;
		pure public function fIAbs(_nVal:Int):Int;
			
		//static public function fMin(_nVal1:Int, _nVal2:Int):Int;
		//static public function fMax(_nVal1:Int, _nVal2:Int):Int;
		
		pure public function fSin(_nRad:Float):Float;
		pure public function fCos(_nRad:Float):Float;
		pure public function fTan(_nRad:Float):Float;
		pure public function fATan(_nRad:Float):Float;
		pure public function fATan2(_nY:Float,_nX:Float):Float;
		
		pure public function fSqrt(_nVal:Float):Float;
		pure public function fPow(_nVal:Float, _nPower:Float):Float;
		pure public function fPow2(_nVal:Float, _nPower:Float):Float;
		pure public function fFloatToInt(_nVal:Float):Int;
		
		
		
		pure changeRem GZ_M_fFrac function fFrac(_nVal:Float):Float;	
		pure changeRem GZ_M_fIFrac function fIFrac(_nVal:Int):Int;	
		pure changeRem GZ_M_fITronc function fITronc(_nVal:Int):Int;	
		pure changeRem GZ_M_fIPixFrac function fIPixFrac(_nVal:Int):Int;	
		//static changeRem GZ_ToPix function fIToPix(_nVal:Int):Int;	
			
		//static changeRem GZ_M_fAbs function fAbs(_nVal:Float):Float;
		//static changeRem GZ_M_fAbs function fIAbs(_nVal:Int):Int;
			
		pure changeRem GZ_M_fMin function fMin(_nVal1:Int, _nVal2:Int):Int;
		pure changeRem GZ_M_fMax function fMax(_nVal1:Int, _nVal2:Int):Int;
		/*
		static changeRem GZ_M_fSin function fSin(_nRad:Float):Float;
		static changeRem GZ_M_fCos function fCos(_nRad:Float):Float;
		static changeRem GZ_M_fTan function fTan(_nRad:Float):Float;
		static changeRem GZ_M_fATan2 function fATan2(_nY:Float,_nX:Float):Float;
		*/
		pure changeRem GZ_M_fSqrt function fSqrt(_nVal:Float):Float;
		pure changeRem GZ_M_fPow  function fPow(_nVal:Float, _nPower:Float):Float;
		pure changeRem GZ_M_fPow2  function fPow2(_nVal:Float, _nPower:Float):Float;
		pure changeRem GZ_M_fToRadian  function fToRadian(_nDegree:Float):Float;
		pure changeRem GZ_M_fToDegree  function fToDegree(_nRad:Float):Float;
		//static changeRem GZ_M_fFloatToInt function fFloatToInt(_nVal:Float):Int;
		

		/*
		define var nPI : Float;
		define var nR90 : Float;
		define var nSP : Int;
		//define var nPrec : Int;
		define var nHPrec : Int;
		define var nPixSP : Int;
		define var nPixSP8 : Int;
		define var nPixSPDiff : Int;
		define var nPixPrec : Int;
		define var nPixHPrec : Int;
		define var nDivPrec : Int;
		
		define var nMidVal : UInt;
		
		define var nMaxInt : Int;
		define var nMinInt : Int;
		*/
	}
}

