module top();
    reg clk;

    // upstream interfaces 
    router_interface_in local_up(clk);
    router_interface_in north_up(clk);
    router_interface_in south_up(clk);
    router_interface_in west_up(clk);
    router_interface_in east_up(clk);
    
    // downstream interfaces
    router_interface_out local_down(clk);
    router_interface_out north_down(clk);
    router_interface_out south_down(clk);
    router_interface_out west_down(clk);
    router_interface_out east_down(clk);
    
    // router instantiation
    router_wrapper #(
        .BUFFER_SIZE(8),
        .X_CURRENT(0),
        .Y_CURRENT(0)
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
        .router_if_east_down(east_down)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = !clk;
        end
    end

endmodule //top