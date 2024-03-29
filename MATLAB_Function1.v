// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\MATLAB_Function1.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: MATLAB_Function1
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Filter/Coefficient Memory/MATLAB Function1
// Hierarchy Level: 3
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module MATLAB_Function1
          (u_re,
           u_im,
           u1,
           y);


  input   signed [22:0] u_re;  // sfix23_En20
  input   signed [22:0] u_im;  // sfix23_En20
  input   signed [15:0] u1;  // sfix16_En13
  output  signed [22:0] y;  // sfix23_En20




  assign y = u_re;



endmodule  // MATLAB_Function1