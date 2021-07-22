#include "ap_axi_sdata.h"
#include "hls_stream.h"


void mult_constant(hls::stream< ap_axis<32,1,1,1> > &A,
	     hls::stream< ap_axis<32,1,1,1> > &B,
		 ap_int<32> constant)
{
#pragma HLS INTERFACE s_axilite register port=constant
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B

	ap_axis<32,1,1,1> tmp;

	A.read(tmp);
	tmp.data = tmp.data * constant;
	B.write(tmp);
}
