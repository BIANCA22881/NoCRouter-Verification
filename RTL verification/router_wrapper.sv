module router_wrapper #(
    parameter BUFFER_SIZE = 8,
    parameter X_CURRENT = MESH_SIZE_X/2,
    parameter Y_CURRENT = MESH_SIZE_Y/2
)(
    input clk,
    input rst,
    router_interface_in.drv_mdp_in.drv_cb_in router_if_local_up
    router_interface_in.drv_mdp_in.drv_cb_in router_if_north_up,
    router_interface_in.drv_mdp_in.drv_cb_in router_if_south_up,
    router_interface_in.drv_mdp_in.drv_cb_in router_if_west_up,
    router_interface_in.drv_mdp_in.drv_cb_in router_if_east_up,
    
    router_interface_out.drv_mdp_out.drv_cb_out router_if_local_down,
    router_interface_out.drv_mdp_out.drv_cb_out router_if_north_down,
    router_interface_out.drv_mdp_out.drv_cb_out router_if_south_down,
    router_interface_out.drv_mdp_out.drv_cb_out router_if_west_down,
    router_interface_out.drv_mdp_out.drv_cb_out router_if_east_down,
);
    // instantiate the router2router interfaces 
    router2router local_up();
    router2router north_up();
    router2router south_up();
    router2router west_up();
    router2router east_up();
    router2router local_down();
    router2router north_down();
    router2router south_down();
    router2router west_down();
    router2router east_down();
    logic [VC_NUM-1:0] error_o [PORT_NUM-1:0]; 
    
    router #(
        .BUFFER_SIZE(BUFFER_SIZE),
        .X_CURRENT(X_CURRENT),
        .Y_CURRENT(Y_CURRENT)
    )
    router (
        .clk(clk),
        .rst(rst),
        //upstream interfaces connections 
        .router_if_local_up(local_up),
        .router_if_north_up(north_up),
        .router_if_south_up(south_up),
        .router_if_west_up(west_up),
        .router_if_east_up(east_up),
        //downstream interfaces connections
        .router_if_local_down(local_down),
        .router_if_north_down(north_down),
        .router_if_south_down(south_down),
        .router_if_west_down(west_down),
        .router_if_east_down(east_down),
        .error_o(error_o)
    );

    always_comb begin
        // upstream
        local_up.data =             router_if_local_up.data_i;
        local_up.is_valid =         router_if_local_up.valid_flit_i;
        local_up.is_on_off =        router_if_local_up.on_off_o;
        local_up.is_allocatable =   router_if_local_up.vc_allocatable_o;

        north_up.data =             router_if_north_up.data_i;
        north_up.is_valid =         router_if_north_up.valid_flit_i;
        north_up.is_on_off =        router_if_north_up.on_off_o;
        north_up.is_allocatable =   router_if_north_up.vc_allocatable_o;

        south_up.data =             router_if_south_up.data_i;
        south_up.is_valid =         router_if_south_up.valid_flit_i;
        south_up.is_on_off =        router_if_south_up.on_off_o;
        south_up.is_allocatable =   router_if_south_up.vc_allocatable_o;
 
        west_up.data =              router_if_west_up.data_i;
        west_up.is_valid =          router_if_west_up.valid_flit_i;
        west_up.is_on_off =         router_if_west_up.on_off_o;
        west_up.is_allocatable =    router_if_west_up.vc_allocatable_o;

        east_up.data =              router_if_east_up.data_i;
        east_up.is_valid =          router_if_east_up.valid_flit_i;
        east_up.is_on_off =         router_if_east_up.on_off_o;
        east_up.is_allocatable =    router_if_east_up.vc_allocatable_o;

        // downstream
        local_down.data =             router_if_local_down.data_i;
        local_down.is_valid =         router_if_local_down.valid_flit_i;
        local_down.is_on_off =        router_if_local_down.on_off_o;
        local_down.is_allocatable =   router_if_local_down.vc_allocatable_o;

        north_down.data =             router_if_north_down.data_i;
        north_down.is_valid =         router_if_north_down.valid_flit_i;
        north_down.is_on_off =        router_if_north_down.on_off_o;
        north_down.is_allocatable =   router_if_north_down.vc_allocatable_o;

        south_down.data =             router_if_south_down.data_i;
        south_down.is_valid =         router_if_south_down.valid_flit_i;
        south_down.is_on_off =        router_if_south_down.on_off_o;
        south_down.is_allocatable =   router_if_south_down.vc_allocatable_o;
 
        west_down.data =              router_if_west_down.data_i;
        west_down.is_valid =          router_if_west_down.valid_flit_i;
        west_down.is_on_off =         router_if_west_down.on_off_o;
        west_down.is_allocatable =    router_if_west_down.vc_allocatable_o;

        east_down.data =              router_if_east_down.data_i;
        east_down.is_valid =          router_if_east_down.valid_flit_i;
        east_down.is_on_off =         router_if_east_down.on_off_o;
        east_down.is_allocatable =    router_if_east_down.vc_allocatable_o;

        //error bits
        error_o[0] = local_up.error_o;
        error_o[1] = north_up.error_o;
        error_o[2] = south_up.error_o;
        error_o[3] = west_up.error_o;
        error_o[4] = east_up.error_o;
        
    end

endmodule //router_wrapper