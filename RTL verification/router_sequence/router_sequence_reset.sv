`ifndef ROUTER_SEQUENCE_RESET
`define ROUTER_SEQUENCE_RESET

class router_sequence_reset extends uvm_sequence;
    `uvm_object_utils(router_sequence_reset)

    function new(string name = "router_sequence_reset");
        super.new(name);
    endfunction 

    task body()
        //do something
    endtask
endclass // router_sequence_reset


`endif //ROUTER_SEQUENCE_RESET