`ifndef ROUTER_INTERFACE_OUT
`define ROUTER_INTERFACE_OUT

interface router_interface_out(input logic clk);
    flit_t data_o;
    logic valid_flit_o;
    logic [VC_NUM-1:0] on_off_i;
    logic [VC_NUM-1:0] vc_allocatable_i;

    //clocking block used for driving data
    clocking drv_cb_out @(posedge clk);// i THINK its posedge, needs verifying
        output vc_allocatable_i;
        output on_off_i;
    endclocking
    modport drv_mdp_out(clocking drv_cb_out, input clk);

    //clocking block used for receiving data
    clocking rcv_cb_out @(posedge clk);// i THINK its posedge, needs verifying
        input on_off_i;
        input vc_allocatable_i;
        input data_o;
        input valid_flit_o;
    endclocking
    modport rcv_mdp_out(clocking rcv_cb_out, input clk);

    //functional coverage
    
endinterface //router_interface_out

`endif //ROUTER_INTERFACE_OUT