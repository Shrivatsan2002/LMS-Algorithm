// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Coefficient_Update.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Coefficient_Update
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Coefficient Update
// Hierarchy Level: 1
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Coefficient_Update
          (clk,
           reset,
           enb,
           delayLine,
           filterData,
           filterEnb,
           oldCoeff,
           validCoeff,
           inputEnb,
           stepSize,
           desired,
           newCoeff,
           filterError_signal1,
           filterError_signal2,
           filterOut_out1,
           filterOut_signal2,
           filterWeights_oldCoeff,
           filterWeights_signal2);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] delayLine;  // sfix16_En13
  input   signed [26:0] filterData;  // sfix27_En20
  input   filterEnb;
  input   signed [22:0] oldCoeff;  // sfix23_En20
  input   validCoeff;
  input   inputEnb;
  input   signed [17:0] stepSize;  // sfix18_En18
  input   signed [15:0] desired;  // sfix16_En13
  output  signed [39:0] newCoeff;  // sfix40_En34
  output  signed [22:0] filterError_signal1;  // sfix23_En16
  output  filterError_signal2;
  output  signed [26:0] filterOut_out1;  // sfix27_En20
  output  filterOut_signal2;
  output  signed [22:0] filterWeights_oldCoeff;  // sfix23_En20
  output  filterWeights_signal2;


  reg signed [15:0] Delay1_reg [0:22];  // sfix16 [23]
  reg signed [15:0] Delay1_reg_next [0:22];  // sfix16_En13 [23]
  reg signed [15:0] Delay1_out1;  // sfix16_En13
  wire [17:0] out;  // ufix18_En18
  reg [17:0] Delay8_reg [0:7];  // ufix18 [8]
  reg [17:0] Delay8_reg_next [0:7];  // ufix18_En18 [8]
  reg [17:0] Delay8_out1;  // ufix18_En18
  wire signed [22:0] Filter_Error_out1;  // sfix23_En16
  wire signed [22:0] y;  // sfix23_En21
  reg  Delay13_out1;
  reg  [2:0] Delay6_reg;  // ufix1 [3]
  wire Delay6_out1;
  wire signed [39:0] out_1;  // sfix40_En34
  reg signed [22:0] Delay10_reg [0:31];  // sfix23 [32]
  reg signed [22:0] Delay10_reg_next [0:31];  // sfix23_En20 [32]
  reg signed [22:0] Delay10_out1;  // sfix23_En20
  wire signed [39:0] Add2_add_cast;  // sfix40_En34
  wire signed [39:0] Add2_out1;  // sfix40_En34
  reg signed [31:0] Delay1_t_0_0;  // int32
  reg signed [31:0] Delay1_t_0_1;  // int32
  reg signed [31:0] Delay1_t_1;  // int32
  reg signed [31:0] Delay8_t_0_0;  // int32
  reg signed [31:0] Delay8_t_0_1;  // int32
  reg signed [31:0] Delay8_t_1;  // int32
  reg signed [31:0] Delay10_t_0_0;  // int32
  reg signed [31:0] Delay10_t_0_1;  // int32
  reg signed [31:0] Delay10_t_1;  // int32


  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        for(Delay1_t_1 = 32'sd0; Delay1_t_1 <= 32'sd22; Delay1_t_1 = Delay1_t_1 + 32'sd1) begin
          Delay1_reg[Delay1_t_1] <= 16'sb0000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay1_t_0_1 = 32'sd0; Delay1_t_0_1 <= 32'sd22; Delay1_t_0_1 = Delay1_t_0_1 + 32'sd1) begin
            Delay1_reg[Delay1_t_0_1] <= Delay1_reg_next[Delay1_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay1_out1 = Delay1_reg[22];
    Delay1_reg_next[0] = delayLine;

    for(Delay1_t_0_0 = 32'sd0; Delay1_t_0_0 <= 32'sd21; Delay1_t_0_0 = Delay1_t_0_0 + 32'sd1) begin
      Delay1_reg_next[Delay1_t_0_0 + 32'sd1] = Delay1_reg[Delay1_t_0_0];
    end

  end



  Enb_Delay2 u_Enb_Delay2 (.clk(clk),
                           .reset(reset),
                           .enb(enb),
                           .u(stepSize),  // sfix18_En18
                           .enb_1(inputEnb),
                           .out(out)  // ufix18_En18
                           );

  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        for(Delay8_t_1 = 32'sd0; Delay8_t_1 <= 32'sd7; Delay8_t_1 = Delay8_t_1 + 32'sd1) begin
          Delay8_reg[Delay8_t_1] <= 18'b000000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay8_t_0_1 = 32'sd0; Delay8_t_0_1 <= 32'sd7; Delay8_t_0_1 = Delay8_t_0_1 + 32'sd1) begin
            Delay8_reg[Delay8_t_0_1] <= Delay8_reg_next[Delay8_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay8_out1 = Delay8_reg[7];
    Delay8_reg_next[0] = out;

    for(Delay8_t_0_0 = 32'sd0; Delay8_t_0_0 <= 32'sd6; Delay8_t_0_0 = Delay8_t_0_0 + 32'sd1) begin
      Delay8_reg_next[Delay8_t_0_0 + 32'sd1] = Delay8_reg[Delay8_t_0_0];
    end

  end



  Filter_Error u_Filter_Error (.clk(clk),
                               .reset(reset),
                               .enb(enb),
                               .enb_1(inputEnb),
                               .desired(desired),  // sfix16_En13
                               .filterData(filterData),  // sfix27_En20
                               .filterError(Filter_Error_out1)  // sfix23_En16
                               );

  Multiplier1 u_Multiplier1 (.clk(clk),
                             .enb(enb),
                             .stepSize(Delay8_out1),  // ufix18_En18
                             .filterError(Filter_Error_out1),  // sfix23_En16
                             .mulout(y)  // sfix23_En21
                             );

  always @(posedge clk or posedge reset)
    begin : Delay13_process
      if (reset == 1'b1) begin
        Delay13_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay13_out1 <= filterEnb;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay6_reg[0] <= Delay13_out1;
          Delay6_reg[32'sd2:32'sd1] <= Delay6_reg[32'sd1:32'sd0];
        end
      end
    end

  assign Delay6_out1 = Delay6_reg[2];



  Multiplier2 u_Multiplier2 (.clk(clk),
                             .reset(reset),
                             .enb(enb),
                             .in1(Delay1_out1),  // sfix16_En13
                             .in2(y),  // sfix23_En21
                             .enb_1(Delay6_out1),
                             .mulout(out_1)  // sfix40_En34
                             );

  always @(posedge clk or posedge reset)
    begin : Delay10_process
      if (reset == 1'b1) begin
        for(Delay10_t_1 = 32'sd0; Delay10_t_1 <= 32'sd31; Delay10_t_1 = Delay10_t_1 + 32'sd1) begin
          Delay10_reg[Delay10_t_1] <= 23'sb00000000000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay10_t_0_1 = 32'sd0; Delay10_t_0_1 <= 32'sd31; Delay10_t_0_1 = Delay10_t_0_1 + 32'sd1) begin
            Delay10_reg[Delay10_t_0_1] <= Delay10_reg_next[Delay10_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay10_out1 = Delay10_reg[31];
    Delay10_reg_next[0] = oldCoeff;

    for(Delay10_t_0_0 = 32'sd0; Delay10_t_0_0 <= 32'sd30; Delay10_t_0_0 = Delay10_t_0_0 + 32'sd1) begin
      Delay10_reg_next[Delay10_t_0_0 + 32'sd1] = Delay10_reg[Delay10_t_0_0];
    end

  end



  assign Add2_add_cast = {{3{Delay10_out1[22]}}, {Delay10_out1, 14'b00000000000000}};
  assign Add2_out1 = out_1 + Add2_add_cast;



  assign newCoeff = Add2_out1;

  assign filterError_signal1 = Filter_Error_out1;

  assign filterError_signal2 = Delay13_out1;

  assign filterOut_out1 = filterData;

  assign filterOut_signal2 = filterEnb;

  assign filterWeights_oldCoeff = oldCoeff;

  assign filterWeights_signal2 = validCoeff;

endmodule  // Coefficient_Update