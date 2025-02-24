`ifndef ROUTER_SEQ_ITEM_IN
`define ROUTER_SEQ_ITEM_IN

class router_seq_item_in extends uvm_sequence_item;
    rand logic                          valid_flit_i;
    // flit_t data_i; // i dont think i can use structs this will be packed in the driver 
    
    //these form the data_i
    rand logic [`DEST_ADDR_SIZE_X-1 : 0] x_dest;
    rand logic [`DEST_ADDR_SIZE_Y-1 : 0] y_dest;

    rand logic [`HEAD_PAYLOAD_SIZE-1: 0] head_pl; //head and bt _pl are part of an union so you ca only use on at a time
    rand logic [`FLIT_DATA_SIZE-1 : 0]   bt_pl;
    
    rand logic [`VC_SIZE-1 : 0] 	     vc_id; //VC_size in my case is 1 so this is only one bit (for future bianca)
    rand flit_label_t			         flit_label; // HEAD, BODY, TAIL, HEADTAIL

    rand logic [`DELAY_SIZE-1: 0]        in_delay;

    `uvm_object_utils_begin(router_seq_item_in)
        `uvm_field_int(valid_flit_i, UVM_DEFAULT)
        // `uvm_field_int(data_i,       UVM_DEFAULT)
        `uvm_field_int(x_dest,       UVM_DEFAULT)
        `uvm_field_int(y_dest,       UVM_DEFAULT)
        `uvm_field_int(head_pl,      UVM_DEFAULT)
        `uvm_field_int(bt_pl,        UVM_DEFAULT)
        `uvm_field_int(vc_id,        UVM_DEFAULT)
        `uvm_field_enum(flit_label,  UVM_DEFAULT)
        `uvm_field_int(in_delay,     UVM_DEFAULT)
    `uvm_object_utils_end

    constraint default_dest_constraint{
        x_dest < MESH_SIZE_X;
        x_dest >= 0;
        y_dest < MESH_SIZE_Y;
        y_dest >= 0;
    }

    // constraint valid_flit_constraint{ // I think this should be an extern constraint but i will keep it here for a bittt
    //     valid_flit_i dist { 0:=8, 1:=2};
    // }
    
    // extern constraints:
    constraint valid_flit_constraint;
    constraint coord_dest_constraint;

    constraint data_pl_constraint;
    
    constraint vc_id_constraint;
    constraint flit_label_constraint;
    constraint delay_length_constraint;
    
    // something after the randomizing, we set head_pl or bt_pl to 0 , depending fo flit_label

endclass //router_seq_item_in

`endif //ROUTER_SEQ_ITEM_IN