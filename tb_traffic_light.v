`timescale 1ns/1ps

module tb;

reg clk;
reg rst;

wire [1:0] state;

traffic_light dut(
    .clk(clk),
    .rst(rst),
    .state(state)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #10 rst = 0;

    #200 $finish;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end

endmodule
