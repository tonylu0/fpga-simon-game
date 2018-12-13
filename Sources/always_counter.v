
module always_counter(
    output [24:0] count,
    input clk_in
    );
    
    reg     [22:0] counter = 1;
    always @ (posedge(clk_in))
    begin
        if (counter == 10000000)
        begin
            counter <= 1;
        end
        else 
            counter <= counter + 1;
    end
    assign count = counter;

endmodule