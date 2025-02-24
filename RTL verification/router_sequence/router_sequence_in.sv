`ifndef ROUTER_SEQUENCE_IN
`define ROUTER_SEQUENCE_IN

class router_sequence_in extends uvm_sequence;
    `uvm_object_utils(router_sequence_in)

    function new(string name = "router_sequence_in");
        super.new(name);
    endfunction 

    task body()
        //do something
    endtask
endclass // router_sequence_in

`endif //ROUTER_SEQUENCE_IN