// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Accumulator.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Accumulator
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Filter/Accumulator
// Hierarchy Level: 2
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Accumulator
          (clk,
           reset,
           enb,
           reset_1,
           enb_1,
           mulOut,
           filterValid,
           filterOut);


  input   clk;
  input   reset;
  input   enb;
  input   reset_1;
  input   enb_1;
  input   signed [38:0] mulOut;  // sfix39_En33
  output  filterValid;
  output  signed [26:0] filterOut;  // sfix27_En20


  reg  Delay1_out1;
  reg  Delay5_out1;
  reg  Delay2_out1;
  reg signed [38:0] Delay3_out1;  // sfix39_En33
  wire signed [26:0] out1;  // sfix27_En20


  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= enb_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Delay1_out1;
        end
      end
    end



  assign filterValid = Delay5_out1;

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= reset_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 39'sh0000000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= mulOut;
        end
      end
    end



  Adder u_Adder (.clk(clk),
                 .reset(reset),
                 .enb(enb),
                 .enb_1(Delay1_out1),
                 .rst(Delay2_out1),
                 .a(Delay3_out1),  // sfix39_En33
                 .out1(out1)  // sfix27_En20
                 );

  assign filterOut = out1;

endmodule  // Accumulator