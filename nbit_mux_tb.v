`timescale 1ps/1ps
module mux_n_1_tb;

  parameter N = 8;

  reg  [8*N-1:0] inputs;
  reg  [$clog2(N)-1:0] sel;
  wire [7:0] d_out;

  integer i;

  mux_n_1 #(.N(N)) uut (
    .inputs(inputs),
    .sel(sel),
    .d_out(d_out)
  );

  initial begin
    $dumpfile("mux_n_1.vcd");
    $dumpvars(0, mux_n_1_tb);
    $monitor("Time = %0t | sel = %0d | d_out = %h", $time, sel, d_out);

    
    for (i = 0; i < N; i = i + 1)
      inputs[i*8 +: 8] = (i+1) * 8'h11; 

    
    for (i = 0; i < N; i = i + 1) begin
      sel = i;
      #10;
    end

    $finish;
  end

endmodule