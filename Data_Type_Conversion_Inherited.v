// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Data_Type_Conversion_Inherited.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Type_Conversion_Inherited
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Data Type  Conversion/Data Type Conversion Inherited
// Hierarchy Level: 2
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Type_Conversion_Inherited
          (u,
           y);


  input   signed [39:0] u;  // sfix40_En34
  output  signed [22:0] y;  // sfix23_En20


  wire signed [22:0] Conversion_out1;  // sfix23_En20


  assign Conversion_out1 = u[36:14];



  assign y = Conversion_out1;

endmodule  // Data_Type_Conversion_Inherited