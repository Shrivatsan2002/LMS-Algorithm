// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Data_Type_Conversion.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Type_Conversion
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Data Type  Conversion
// Hierarchy Level: 1
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Type_Conversion
          (u1,
           y);


  input   signed [39:0] u1;  // sfix40_En34
  output  signed [22:0] y;  // sfix23_En20


  wire signed [22:0] Data_Type_Conversion_Inherited_out1;  // sfix23_En20


  Data_Type_Conversion_Inherited u_Data_Type_Conversion_Inherited (.u(u1),  // sfix40_En34
                                                                   .y(Data_Type_Conversion_Inherited_out1)  // sfix23_En20
                                                                   );

  assign y = Data_Type_Conversion_Inherited_out1;

endmodule  // Data_Type_Conversion