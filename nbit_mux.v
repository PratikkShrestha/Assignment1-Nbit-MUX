`timescale 1ps/1ps
module mux_n_1 #(
  parameter N = 8  
)(
  input  [8*N-1:0] inputs,     
  input  [$clog2(N)-1:0] sel,  
  output reg [7:0] d_out      
);

always @(*) begin
  d_out = inputs[sel*8 +: 8];  
end

endmodule