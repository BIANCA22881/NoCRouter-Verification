`ifndef ROUTER_INTERFACE_IN
`define ROUTER_INTERFACE_IN

interface router_interface_in(input logic clk);
    flit_t data_i;
    logic valid_flit_i;
    logic [VC_NUM-1:0] on_off_o;
    logic [VC_NUM-1:0] vc_allocatable_o;
    logic [VC_NUM-1:0] error_o

    //clocking block used for driving data
    clocking drv_cb_in @(posedge clk);
        output data_i;
        output valid_flit_i;
        // input data_i, valid_flit_i;
        // output on_off_o, vc_allocatable_o, error_o;
    endclocking
    modport drv_mdp_in(clocking r_cb_in, input clk, input );

    //clocking block used for receiving data
    clocking rcv_cb_in @(posedge clk);
        input data_i,
        input valid_flit_i;
        input on_off_o;
        input vc_allocatable_o;
        input error_o;
    endclocking
    modport rcv_mdp_in(clocking r_cb_in, input clk);

    //functional coverage
    
endinterface //router_interface_in

`endif //ROUTER_INTERFACE_IN