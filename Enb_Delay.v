// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Enb_Delay.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Enb_Delay
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Coefficient Update/Multiplier2/Enb Delay
// Hierarchy Level: 3
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Enb_Delay
          (clk,
           reset,
           enb,
           u,
           enb_1,
           out);


  input   clk;
  input   reset;
  input   enb;
  input   signed [22:0] u;  // sfix23_En21
  input   enb_1;
  output  signed [22:0] out;  // sfix23_En21


  reg signed [22:0] out_1;  // sfix23_En21
  reg signed [22:0] reg_rsvd;  // sfix23
  reg signed [22:0] reg_next;  // sfix23_En21


  always @(posedge clk or posedge reset)
    begin : Enb_Delay_1_process
      if (reset == 1'b1) begin
        reg_rsvd <= 23'sb00000000000000000000000;
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
      reg_next = u;
    end
    out_1 = reg_rsvd;
  end



  assign out = out_1;

endmodule  // Enb_Delay