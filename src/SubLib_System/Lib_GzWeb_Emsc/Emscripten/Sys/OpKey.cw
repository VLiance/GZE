//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {


	import GZ.Input.Key;
	
	
		
	<cpp>
	#include "Lib_GzWeb_Emsc/Emscripten/Helper/html5_keyboard.cpp"
	</cpp>
	
	
	/**
	 * @author Maeiky
	 */
	public overclass OpKey overplace  Key{
		
		
		<cpp_namespace>
			const gzUInt8 aKeyLookUp[] = {
				0, //0x00
				0, //0x01
				0, //0x02
				0, //0x03
				0, //0x04
				0, //0x05
				0, //0x06
				0, //0x07
				0, //0x08
				0, //0x09
				0, //0x0A
				0, //0x0B
				0, //0x0C
				0, //0x0D
				0, //0x0E
				0, //0x0F
				
				0, //0x10
				0, //0x11
				0, //0x12
				0, //0x13
				0, //0x14
				0, //0x15
				0, //0x16
				0, //0x17
				0, //0x18
				0, //0x19
				0, //0x1A
				0, //0x1B
				0, //0x1C
				0, //0x1D
				0, //0x1E
				0, //0x1F
				
				0, //0x20
				0, //0x21
				0, //0x22
				0, //0x23
				0, //0x24
				0, //0x25 Left
				0, //0x26 UP
				0, //0x27 Right
				0, //0x28 Down
				0, //0x29
				0, //0x2A
				0, //0x2B
				0, //0x2C
				0, //0x2D
				0, //0x2E
				0, //0x2F
				
				0, //0x30
				0, //0x31
				0, //0x32
				0, //0x33
				0, //0x34
				0, //0x35
				0, //0x36
				0, //0x37
				0, //0x38
				0, //0x39
				0, //0x3A
				0, //0x3B
				0, //0x3C
				0, //0x3D
				0, //0x3E
				0, //0x3F
				
				0, //0x40
				0, //0x41
				0, //0x42
				0, //0x43
				0, //0x44
				0, //0x45
				0, //0x46
				0, //0x47
				0, //0x48
				0, //0x49
				0, //0x4A
				0, //0x4B
				0, //0x4C
				0, //0x4D
				0, //0x4E
				0, //0x4F
				
				0, //0x50
				0, //0x51
				0, //0x52
				0, //0x53
				0, //0x54
				0, //0x55
				0, //0x56
				0, //0x57
				0, //0x58
				0, //0x59
				0, //0x5A
				0, //0x5B
				0, //0x5C
				0, //0x5D
				0, //0x5E
				0, //0x5F
				
				0, //0x60
				0, //0x61
				0, //0x62
				0, //0x63
				0, //0x64
				0, //0x65
				0, //0x66
				0, //0x67
				0, //0x68
				0, //0x69
				0, //0x6A
				0, //0x6B
				0, //0x6C
				0, //0x6D
				0, //0x6E
				0, //0x6F
				
				0, //0x70
				0, //0x71
				0, //0x72
				0, //0x73
				0, //0x74
				0, //0x75
				0, //0x76
				0, //0x77
				0, //0x78
				0, //0x79
				0, //0x7A
				0, //0x7B
				0, //0x7C
				0, //0x7D
				0, //0x7E
				0, //0x7F
			};
		</cpp_namespace>
		
		
		public function OpKey():Void {
			<cpp> 
			// fInitialise_Keyboard(this->);
			 fInitialise_Keyboard(this);
			</cpp>
		}
		
		public override function fIsDown(_hKey:eKey):Bool {
			return aKeyDown[_hKey];
		}
		
		
		
	}
}
