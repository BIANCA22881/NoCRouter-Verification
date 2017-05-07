import noc_params::*;

interface input_port2switch_allocator;

    port_t [VC_NUM-1 : 0] out_port;
    logic [VC_SIZE-1 : 0] vc_sel;
    logic valid_sel;

    modport input_port (
        output out_port,
        input vc_sel,
        input valid_sel
    );

    modport switch_allocator (
        input out_port,
        output vc_sel,
        output valid_sel
    );

endinterface