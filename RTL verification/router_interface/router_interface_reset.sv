`ifndef ROUTER_INTERFACE_RESET
`define ROUTER_INTERFACE_RESET

interface router_interface_reset(input logic clk);
    logic reset;
    
    //clocking block used for driving data
    clocking drv_cb_reset @(posedge clk);
        output reset;
    endclocking
    modport drv_mdp_reset(clocking drv_cb_reset, input clk);

    //clocking block used for driving data
    clocking rcv_cb_reset @(posedge clk);
        input reset;
    endclocking
    modport rcv_mdp_reset(clocking rcv_cb_reset, input clk);

endinterface //router_interface_reset

`endif //ROUTER_INTERFACE_RESET