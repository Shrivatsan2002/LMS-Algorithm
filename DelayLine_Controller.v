
// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\DelayLine_Controller.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DelayLine_Controller
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Filter/Tapped Delay/DelayLine Controller
// Hierarchy Level: 3
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DelayLine_Controller
          (clk,
           reset,
           enb,
           enb_1,
           rst,
           adapt,
           enbRd,
           filtEnb,
           rdAdrs,
           valCoeff,
           coeffWrEnb);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   rst;
  input   adapt;
  output  enbRd;
  output  filtEnb;
  output  [4:0] rdAdrs;  // ufix5
  output  valCoeff;
  output  coeffWrEnb;




  Controller_block u_Controller (.clk(clk),
                                 .reset(reset),
                                 .enb(enb),
                                 .enb_1(enb_1),
                                 .rst(rst),
                                 .adapt(adapt),
                                 .enbRd(enbRd),
                                 .valCoeff(valCoeff),
                                 .filtEnb(filtEnb),
                                 .coeffWrEnb(coeffWrEnb),
                                 .rdAdrs(rdAdrs)  // ufix5
                                 );

endmodule  // DelayLine_Controller