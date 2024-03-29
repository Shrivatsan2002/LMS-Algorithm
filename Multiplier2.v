// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Multiplier2.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Multiplier2
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Coefficient Update/Multiplier2
// Hierarchy Level: 2
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Multiplier2
          (clk,
           reset,
           enb,
           in1,
           in2,
           enb_1,
           mulout);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] in1;  // sfix16_En13
  input   signed [22:0] in2;  // sfix23_En21
  input   enb_1;
  output  signed [39:0] mulout;  // sfix40_En34


  wire signed [16:0] const_rsvd;  // sfix17_En13
  reg signed [16:0] Delay3_reg [0:1];  // sfix17 [2]
  wire signed [16:0] Delay3_reg_next [0:1];  // sfix17_En13 [2]
  wire signed [16:0] Delay3_out1;  // sfix17_En13
  wire signed [22:0] out;  // sfix23_En21
  wire signed [39:0] out_1;  // sfix40_En34
  reg signed [31:0] Delay3_t_0_0;  // int32
  reg signed [31:0] Delay3_t_1;  // int32


  Data_Conversion_block u_Data_Conversion (.u(in1),  // sfix16_En13
                                           .const_rsvd(const_rsvd)  // sfix17_En13
                                           );

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        for(Delay3_t_1 = 32'sd0; Delay3_t_1 <= 32'sd1; Delay3_t_1 = Delay3_t_1 + 32'sd1) begin
          Delay3_reg[Delay3_t_1] <= 17'sb00000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay3_t_0_0 = 32'sd0; Delay3_t_0_0 <= 32'sd1; Delay3_t_0_0 = Delay3_t_0_0 + 32'sd1) begin
            Delay3_reg[Delay3_t_0_0] <= Delay3_reg_next[Delay3_t_0_0];
          end
        end
      end
    end

  assign Delay3_out1 = Delay3_reg[1];
  assign Delay3_reg_next[0] = const_rsvd;
  assign Delay3_reg_next[1] = Delay3_reg[0];



  Enb_Delay u_Enb_Delay (.clk(clk),
                         .reset(reset),
                         .enb(enb),
                         .u(in2),  // sfix23_En21
                         .enb_1(enb_1),
                         .out(out)  // sfix23_En21
                         );

  multiplier u_multiplier (.clk(clk),
                           .enb(enb),
                           .in1(Delay3_out1),  // sfix17_En13
                           .in2(out),  // sfix23_En21
                           .out(out_1)  // sfix40_En34
                           );

  assign mulout = out_1;

endmodule  // Multiplier2