//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {


	/**
	 * @author Maeiky
	 */
	public overclass Key  {
		
		public var aKeyDown : CArray<Bool, 1, 256>
		public var aKeyPress : CArray<Bool, 1, 256>
		public var aKeyRelease : CArray<Bool, 1, 256>
		
		
		public enum eKey : Int {
			Abnt_C1     = 0xC1;
			Abnt_C2     = 0xC2;
			Numpad_Add         = 0x6B;
			Attn        = 0xF6;
			Backspace        = 0x08;
			Break      = 0x03;
			Clear      = 0x0C;
			CrSel       = 0xF7;
			Numpad_Dot     = 0x6E;    
			Numpad_Divide      = 0x6F;   
			ErEof       = 0xF9;   
			Escape      = 0x1B;  
			Execute     = 0x2B;
			ExSel       = 0xF8;
			Ico_Clear   = 0xE6;
			Ico_Help    = 0xE3;
			KEY_0       = 0x30;
			KEY_1  = 0x31;
			KEY_2  = 0x32;
			KEY_3  = 0x33;
			KEY_4  = 0x34;
			KEY_5  = 0x35;
			KEY_6  = 0x36;
			KEY_7  = 0x37;
			KEY_8  = 0x38;
			KEY_9  = 0x39;
			KEY_A  = 0x41;
			KEY_B  = 0x42;
			KEY_C  = 0x43;
			KEY_D  = 0x44;
			KEY_E  = 0x45;
			KEY_F  = 0x46;
			KEY_G  = 0x47;
			KEY_H  = 0x48;
			KEY_I  = 0x49;
			KEY_J  = 0x4A;
			KEY_K  = 0x4B;
			KEY_L  = 0x4C;
			KEY_M  = 0x4D;
			KEY_N  = 0x4E;
			KEY_O  = 0x4F;
			KEY_P  = 0x50;
			KEY_Q  = 0x51;
			KEY_R  = 0x52;
			KEY_S  = 0x53;
			KEY_T  = 0x54;
			KEY_U  = 0x55;
			KEY_V  = 0x56;
			KEY_W  = 0x57;
			KEY_X  = 0x58;
			KEY_Y  = 0x59;
			KEY_Z  = 0x5A;
			Numpad_Multiply  = 0x6A;
			NoName  = 0xFC;
			Numpad_0  = 0x60;
			Numpad_1  = 0x61;
			Numpad_2  = 0x62;
			Numpad_3  = 0x63;
			Numpad_4  = 0x64;
			Numpad_5  = 0x65;
			Numpad_6  = 0x66;
			Numpad_7  = 0x67;
			Numpad_8  = 0x68;
			Numpad_9  = 0x69;
			OEM_1  = 0xBA;
			OEM_102  = 0xE2;
			OEM_2  = 0xBF;
			OEM_3  = 0xC0;
			OEM_4  = 0xDB;
			OEM_5  = 0xDC;
			OEM_6  = 0xDD;
			OEM_7  = 0xDE;
			OEM_8  = 0xDF;
			OEM_ATTN  = 0xF0;
			OEM_AUTO  = 0xF3;
			OEM_AX  = 0xE1;
			OEM_BACKTAB  = 0xF5;
			OEM_CLEAR  = 0xFE;
			OEM_COMMA  = 0xBC;
			OEM_COPY  = 0xF2;
			OEM_CUSEL  = 0xEF;
			OEM_ENLW  = 0xF4;
			OEM_FINISH  = 0xF1;
			OEM_FJ_LOYA  = 0x95;
			OEM_FJ_MASSHOU  = 0x93;
			OEM_FJ_ROYA  = 0x96;
			OEM_FJ_TOUROKU  = 0x94;
			OEM_JUMP  = 0xEA;
			OEM_MINUS  = 0xBD;
			OEM_PA1  = 0xEB;
			OEM_PA2  = 0xEC;
			OEM_PA3  = 0xED;
			OEM_PERIOD  = 0xBE;
			OEM_PLUS  = 0xBB;
			OEM_RESET  = 0xE9;
			OEM_WSCTRL  = 0xEE;
			PA1  = 0xFD;
			Packet  = 0xE7;
			Play  = 0xFA;
			ProcessKey  = 0xE5;
			Return  = 0x0D;
			Select  = 0x29;
			Separator  = 0x6C;
			SPACE  = 0x20;
			Numpad_Subtract  = 0x6D;
			Tab  = 0x09;
			Zoom  = 0xFB;
			None  =  0xFF;
			Accept  = 0x1E;
			Apps  = 0x5D;
			BROWSER_BACK  = 0xA6;
			BROWSER_FAVORITES  = 0xAB;
			BROWSER_FORWARD  = 0xA7;
			BROWSER_HOME  = 0xAC;
			BROWSER_REFRESH  = 0xA8;
			BROWSER_SEARCH  = 0xAA;
			BROWSER_STOP  = 0xA9;
			Capital  = 0x14;
			Convert  = 0x1C;
			Delete  = 0x2E;
			End  = 0x23;
			F1  = 0x70;
			F10  = 0x79;
			F11  = 0x7A;
			F12  = 0x7B;
			F13  = 0x7C;
			F14  = 0x7D;
			F15  = 0x7E;
			F16  = 0x7F;
			F17  = 0x80;
			F18  = 0x81;
			F19  = 0x82;
			F2  = 0x71;
			F20  = 0x83;
			F21  = 0x84;
			F22  = 0x85;
			F23  = 0x86;
			F24  = 0x87;
			F3  = 0x72;
			F4  = 0x73;
			F5  = 0x74;
			F6  = 0x75;
			F7  = 0x76;
			F8  = 0x77;
			F9  = 0x78;
			Final  = 0x18;
			Help  = 0x2F;
			Home  = 0x24;
			Ico_00  = 0xE4;
			Insert  = 0x2D;
			JUNJA  = 0x17;
			KANA  = 0x15;
			KANJI  = 0x19;
			LAUNCH_APP1  = 0xB6 ;
			LAUNCH_APP2  = 0xB7;
			LAUNCH_MAIL  = 0xB4;
			LAUNCH_MEDIA_SELECT  = 0xB5;
			Mouse_Left  = 0x01;
			LControl  = 0xA2;
			LMenu  = 0xA4;
			LShift  = 0xA0;
			LWin  = 0x5B;
			Media_NextTrack  = 0xB0;
			Media_PlayPause  = 0xB3;
			Media_PrevTrack  = 0xB1;
			Media_Stop  = 0xB2;
			ModeChange  = 0x1F;
			NonConvert  = 0x1D;
			NumLock  = 0x90;
			OEM_Jisho  = 0x92;
			Pause  = 0x13;
			Print  = 0x2A;
			PageUp  = 0x21;
			PageDown  = 0x22;
			Mouse_Right = 0x02;
			Mouse_Middle  = 0x04;
			RConctrol  = 0xA3;
			RMenu  = 0xA5;
			RShift  = 0xA1;
			RWin  = 0x5C;
			Scroll_Lock  = 0x91;
			Sleep  = 0x5F;
			Snapshot  = 0x2C;
			Up  = 0x26;
			Down  = 0x28;
			Left  = 0x25;
			Right  = 0x27;
			Volume_Down  = 0xAE;
			Volume_Mute  = 0xAD;
			Volume_Up  = 0xAF;
			XButton_1  = 0x05;
			XButton_2  = 0x06;
		}
		public function Key():Void {
			
		
		}
		
		public function fIsDown(_hKey:eKey):Bool {
			return aKeyDown[_hKey];
		}
		
		
		/*
					OEM_2  = 0xBF                //OEM_2 (? /)
			OEM_3  = 0xC0                //OEM_3 (~ `)
			OEM_4  = 0xDB                //OEM_4 ({ [)
			OEM_5  = 0xDC                //OEM_5 (| )
			OEM_6  = 0xDD                //OEM_6 (} ])
			OEM_7  = 0xDE                //OEM_7 (" ')
			OEM_8  = 0xDF                //OEM_8 (§ !)
			OEM_ATTN  = 0xF0                //Oem Attn
		               //OEM_COMMA (< ,)
		*/
		
	}
}
