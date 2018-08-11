
//// Bit Twiddling Hacks ////
#define GZ_nCHAR_BIT 8 //is the number of bits per byte (normally 8).

//SSE4.1 has the full set of integer min/max for 8-, 16- and 32-bit types
#if DbHaveSS4
	#define GZ_fMin(x, y) ((a > b) ? b : a)
	#define GZ_fMax(x, y) ((a > b) ? a : b)
#else
	//If you know that INT_MIN <= x - y <= INT_MAX
	#define GZ_fMin(x, y) (y + ((x - y) & ((x - y) >> (sizeof(int) * GZ_nCHAR_BIT - 1))))
	#define GZ_fMax(x, y) (x - ((x - y) & ((x - y) >> (sizeof(int) * GZ_nCHAR_BIT - 1))))
#endif
	
