
//// Bit Twiddling Hacks ////
#define GZ_nCHAR_BIT 8 //is the number of bits per byte (normally 8).

//SSE4.1 has the full set of integer min/max for 8-, 16- and 32-bit types

#define GZ_fMin(a, b) ((a > b) ? b : a)
#define GZ_fMax(a, b) ((a > b) ? a : b)

/*
#if DbHaveSSE4
	#define GZ_fMin(a, b) ((a > b) ? b : a)
	#define GZ_fMax(a, b) ((a > b) ? a : b)
#else
//////// NOT WORK if type is unsigned???? TODO VERIFY  TODO CAST to (INT)?
	//If you know that INT_MIN <= x - y <= INT_MAX
	#define GZ_fMin(x, y) (y + ((x - y) & ((x - y) >> (sizeof(int) * GZ_nCHAR_BIT - 1))))
	#define GZ_fMax(x, y) (x - ((x - y) & ((x - y) >> (sizeof(int) * GZ_nCHAR_BIT - 1))))
#endif
*/

//TODO (Maybe slower)?
//r = x ^ ((x ^ y) & -(x < y)); // max(x, y)
//r = y ^ ((x ^ y) & -(x < y)); // min(x, y)