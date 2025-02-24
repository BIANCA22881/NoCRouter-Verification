`ifndef ROUTER_SEQ_ITEM_OUT
`define ROUTER_SEQ_ITEM_OUT

class router_seq_item_out extends uvm_sequence_item;
    rand logic [`VC_NUM-1:0]     on_off_i;
    rand logic [`VC_NUM-1:0]     vc_allocatable_i;
    rand logic [`DELAY_SIZE-1:0] out_delay;
    
    `uvm_object_utils_begin(router_seq_item_out)
        `uvm_field_int(on_off_i,         UVM_DEFAULT)
        `uvm_field_int(vc_allocatable_i, UVM_DEFAULT)
        `uvm_field_int(out_delay,        UVM_DEFAULT)
    `uvm_object_utils_end

    // extern constraints:
    constraint on_off_constraint;
    constraint vc_allocatable_constraint;
    constraint delay_length_constraint;
    
endclass //router_seq_item_out

`endif //ROUTER_SEQ_ITEM_OUT