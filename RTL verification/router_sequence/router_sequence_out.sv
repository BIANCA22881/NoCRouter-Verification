`ifndef ROUTER_SEQUENCE_OUT
`define ROUTER_SEQUENCE_OUT

class router_sequence_out extends uvm_sequence;
    `uvm_object_utils(router_sequence_out)

    function new(string name = "router_sequence_out");
        super.new(name);
    endfunction 

    task body()
        //do something
    endtask
endclass // router_sequence_out

`endif //ROUTER_SEQUENCE_OUT