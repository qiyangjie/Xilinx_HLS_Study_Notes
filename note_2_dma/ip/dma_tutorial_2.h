#include <ap_axi_sdata.h>
#include "hls_stream.h"

// Data size for AXI transfer
typedef unsigned int data_T;
// Data size for computation
typedef unsigned int data_C;
// Maximum Length
#define MAX_N 1024
// AXI settings
#define AXI_DATA (sizeof(data_T) * 8)
#define AXI_U 1
#define AXI_TI 1
#define AXI_TD 1

typedef ap_axiu<AXI_DATA, AXI_U, AXI_TI, AXI_TD> AXI_VAL;
typedef hls::stream<AXI_VAL> mystream;


struct data_T_w_l{
	data_T data;
	ap_uint<1> last;
};

data_T_w_l pop_stream(AXI_VAL const &e);
AXI_VAL push_stream(data_T const &v, bool last);

