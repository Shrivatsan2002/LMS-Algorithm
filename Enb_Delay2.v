// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Enb_Delay2.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Enb_Delay2
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Coefficient Update/Enb Delay2
// Hierarchy Level: 2
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Enb_Delay2
          (clk,
           reset,
           enb,
           u,
           enb_1,
           out);


  input   clk;
  input   reset;
  input   enb;
  input   signed [17:0] u;  // sfix18_En18
  input   enb_1;
  output  [17:0] out;  // ufix18_En18


  reg [17:0] out_1;  // ufix18_En18
  reg [17:0] reg_rsvd;  // ufix18
  reg [17:0] reg_next;  // ufix18_En18


  always @(posedge clk or posedge reset)
    begin : Enb_Delay2_1_process
      if (reset == 1'b1) begin
        reg_rsvd <= 18'b000000000000000000;
      end
      else begin
        if (enb) begin
          reg_rsvd <= reg_next;
        end
      end
    end

  always @(enb_1, reg_rsvd, u) begin
    reg_next = reg_rsvd;
    //#Codegen
    // The wordlength and fractional length adjusted based on simulation
    if (enb_1) begin
      if (u[17] == 1'b1) begin
        reg_next = 18'b000000000000000000;
      end
      else begin
        reg_next = u;
      end
    end
    out_1 = reg_rsvd;
  end



  assign out = out_1;

endmodule  // Enb_Delay2