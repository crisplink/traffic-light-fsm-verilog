module traffic_light(
    input clk,
    input rst,
    output reg [1:0] state
);

parameter GREEN = 2'b00;
parameter YELLOW = 2'b01;
parameter RED = 2'b10;

reg [3:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        state <= GREEN;
        count <= 0;
    end
    else begin
        count <= count + 1;

        case(state)

        GREEN:
            if(count == 5) begin
                state <= YELLOW;
                count <= 0;
            end

        YELLOW:
            if(count == 2) begin
                state <= RED;
                count <= 0;
            end

        RED:
            if(count == 5) begin
                state <= GREEN;
                count <= 0;
            end

        endcase
    end
end

endmodule
