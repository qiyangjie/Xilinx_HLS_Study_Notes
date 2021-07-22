#include "float_point_tutorial.h"

void float_point_tutorial(mystream &strm_in, mystream &strm_out){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register_mode=both register port=strm_out
#pragma HLS INTERFACE axis register_mode=both register port=strm_in
	data_C data_buf[MAX_N];
	int os_idx = 0;
	data_T_w_l tmp;
  
  union {
    data_T packet;
    data_C val;
  } converter;

	// Stream in label vector
	do{
		tmp = pop_stream(strm_in.read());
    converter.packet = tmp.data;
		data_buf[os_idx++] = converter.val * converter.val;
	}while(!tmp.last);

	// Stream out output matrix
    for (int i = os_idx - 1; i >= 0 ; i--){
    	// Push output element into AXI stream
        converter.val = data_buf[i];
        strm_out.write(push_stream(converter.packet, i == 0));
    }
}

// --------------------------------------------------------
// functions to insert and extract elements from an AXI stream
// includes conversion to correct data type
data_T_w_l pop_stream(AXI_VAL const &e) {
#pragma HLS INLINE


  data_T_w_l ret;
  ret.data = e.data;
  ret.last = e.last;

  volatile ap_uint<sizeof(data_T)> strb = e.strb;
  volatile ap_uint<sizeof(data_T)> keep = e.keep;
  volatile ap_uint<AXI_U> user = e.user;
  // volatile ap_uint<1> last = e.last;
  volatile ap_uint<AXI_TI> id = e.id;
  volatile ap_uint<AXI_TD> dest = e.dest;

  return ret;
}

AXI_VAL push_stream(data_T const &v, bool last = false){
#pragma HLS INLINE

  AXI_VAL e;

  e.data = v;
  e.strb = (1 << sizeof(data_T)) - 1;
  e.keep = (1 << sizeof(data_T)) - 1;
  e.user = 0;
  e.last = last ? 1 : 0;
  e.id = 0;
  e.dest = 0;
  return e;
}
