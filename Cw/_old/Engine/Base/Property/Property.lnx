//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	 // @author Maeiky
	 
	import GZ.Base.Property.PropertyString;
	 
	public class Property  {

		public var sName : String;
		
		public enum eType: Int {
			String;
			Int;
			Float;
		}
		public var hType : eType;

		public function Property(_sName : String, _hType:eType = eType.String):Void  {
			sName = _sName;
		}
		
		public static function fNewProperty(_sName : String, _sValue:String,_hType:eType = eType.String):Property  {
			
			return new PropertyString(_sName, _sValue);
			//return null;
	}
}
