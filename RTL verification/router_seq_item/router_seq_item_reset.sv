`ifndef ROUTER_SEQ_ITEM_RESET
`define ROUTER_SEQ_ITEM_RESET

class router_seq_item_reset extends uvm_sequence_item;
    rand logic                    reset;
    rand logic [`DELAY_SIZE-1: 0] reset_delay;

    `uvm_object_utils_begin(router_seq_item_reset)
        `uvm_field_int(reset,       UVM_DEFAULT)
        `uvm_field_int(reset_delay, UVM_DEFAULT)
    `uvm_object_utils_end

    // extern constraints:
    constraint multiple_resets;//this will be used if we want only one reset
    constraint reset_delay_length_constraint;
    
endclass  //router_seq_item_reset

`endif //ROUTER_SEQ_ITEM_RESET