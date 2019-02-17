//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 

	public class FileBin  {
			
		public var aFile32 : CArray<Int32, 1>;	
		public var nSize : Int; 
		public var nSize32 : Int; 
		
			
		public function FileBin():Void;
		public function fOpen(_sFile : String, _bRead : Bool, _bWrite : Bool, _bAdd : Bool) : Void;
		public function fWriteString(_sText : String): Void;
		public function fWriteChar(_nChar : Int):Void;
		public function fReadFullFile() : Void;
		  
		public function fWriteInt(_nValue : Int): Void;
		public function fWriteArrayInt(_aArray : CArray<Int32, 1>, _nStart : Int, _nEnd : Int): Void;
		public function fClose(): Void;
	}
}

