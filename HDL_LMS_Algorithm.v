
// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\HDL_LMS_Algorithm.v
// Created: 2024-02-10 22:35:18
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// filterOut_out1                ce_out        1
// filterOut_signal2             ce_out        1
// filterWeights_oldCoeff        ce_out        1
// filterWeights_signal2         ce_out        1
// filterError_signal1           ce_out        1
// filterError_signal2           ce_out        1
// ready                         ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HDL_LMS_Algorithm
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm
// Hierarchy Level: 0
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HDL_LMS_Algorithm
          (clk,
           reset,
           clk_enable,
           observedSignal,
           desiredSignal,
           valid,
           stepSize,
           adapt,
           reset_1,
           ce_out,
           filterOut_out1,
           filterOut_signal2,
           filterWeights_oldCoeff,
           filterWeights_signal2,
           filterError_signal1,
           filterError_signal2,
           ready);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [15:0] observedSignal;  // sfix16_En13
  input   signed [15:0] desiredSignal;  // sfix16_En13
  input   valid;
  input   signed [17:0] stepSize;  // sfix18_En18
  input   adapt;
  input   reset_1;
  output  ce_out;
  output  signed [26:0] filterOut_out1;  // sfix27_En20
  output  filterOut_signal2;
  output  signed [22:0] filterWeights_oldCoeff;  // sfix23_En20
  output  filterWeights_signal2;
  output  signed [22:0] filterError_signal1;  // sfix23_En16
  output  filterError_signal2;
  output  ready;


  wire adaptOut;
  wire validOut;
  wire readyOut;
  wire signed [39:0] Coefficient_Update_out1;  // sfix40_En34
  wire signed [22:0] Data_Type_Conversion_out1;  // sfix23_En20
  wire signed [15:0] Filter_out1;  // sfix16_En13
  wire signed [26:0] out1;  // sfix27_En20
  wire Filter_out3;
  wire signed [22:0] oldCoeff;  // sfix23_En20
  wire Filter_out5;
  wire signed [22:0] Coefficient_Update_out2_signal1;  // sfix23_En16
  wire Coefficient_Update_out2_signal2;
  wire signed [26:0] Coefficient_Update_out3_out1;  // sfix27_En20
  wire Coefficient_Update_out3_signal2;
  wire signed [22:0] Coefficient_Update_out4_oldCoeff;  // sfix23_En20
  wire Coefficient_Update_out4_signal2;


  Data_Control u_Data_Control (.clk(clk),
                               .reset(reset),
                               .enb(clk_enable),
                               .reset_1(reset_1),
                               .validIn(valid),
                               .adapt(adapt),
                               .adaptOut(adaptOut),
                               .validOut(validOut),
                               .readyOut(readyOut)
                               );

  Data_Type_Conversion u_Data_Type_Conversion (.u1(Coefficient_Update_out1),  // sfix40_En34
                                               .y(Data_Type_Conversion_out1)  // sfix23_En20
                                               );

  Filter u_Filter (.clk(clk),
                   .reset(reset),
                   .enb(clk_enable),
                   .newCoeff(Data_Type_Conversion_out1),  // sfix23_En20
                   .observed(observedSignal),  // sfix16_En13
                   .reset_1(reset_1),
                   .adapt(adaptOut),
                   .enb_1(validOut),
                   .delayLine(Filter_out1),  // sfix16_En13
                   .filterOut(out1),  // sfix27_En20
                   .filterEnb(Filter_out3),
                   .oldCoeff(oldCoeff),  // sfix23_En20
                   .validCoeff(Filter_out5)
                   );

  Coefficient_Update u_Coefficient_Update (.clk(clk),
                                           .reset(reset),
                                           .enb(clk_enable),
                                           .delayLine(Filter_out1),  // sfix16_En13
                                           .filterData(out1),  // sfix27_En20
                                           .filterEnb(Filter_out3),
                                           .oldCoeff(oldCoeff),  // sfix23_En20
                                           .validCoeff(Filter_out5),
                                           .inputEnb(validOut),
                                           .stepSize(stepSize),  // sfix18_En18
                                           .desired(desiredSignal),  // sfix16_En13
                                           .newCoeff(Coefficient_Update_out1),  // sfix40_En34
                                           .filterError_signal1(Coefficient_Update_out2_signal1),  // sfix23_En16
                                           .filterError_signal2(Coefficient_Update_out2_signal2),
                                           .filterOut_out1(Coefficient_Update_out3_out1),  // sfix27_En20
                                           .filterOut_signal2(Coefficient_Update_out3_signal2),
                                           .filterWeights_oldCoeff(Coefficient_Update_out4_oldCoeff),  // sfix23_En20
                                           .filterWeights_signal2(Coefficient_Update_out4_signal2)
                                           );

  assign filterOut_out1 = Coefficient_Update_out3_out1;

  assign filterOut_signal2 = Coefficient_Update_out3_signal2;

  assign filterWeights_oldCoeff = Coefficient_Update_out4_oldCoeff;

  assign filterWeights_signal2 = Coefficient_Update_out4_signal2;

  assign filterError_signal1 = Coefficient_Update_out2_signal1;

  assign filterError_signal2 = Coefficient_Update_out2_signal2;

  assign ready = readyOut;

  assign ce_out = clk_enable;

endmodule  // HDL_LMS_Algorithm

