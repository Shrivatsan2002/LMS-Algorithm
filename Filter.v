// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Filter.v
// Created: 2024-02-10 22:35:18
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Filter
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Filter
// Hierarchy Level: 1
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Filter
          (clk,
           reset,
           enb,
           newCoeff,
           observed,
           reset_1,
           adapt,
           enb_1,
           delayLine,
           filterOut,
           filterEnb,
           oldCoeff,
           validCoeff);


  input   clk;
  input   reset;
  input   enb;
  input   signed [22:0] newCoeff;  // sfix23_En20
  input   signed [15:0] observed;  // sfix16_En13
  input   reset_1;
  input   adapt;
  input   enb_1;
  output  signed [15:0] delayLine;  // sfix16_En13
  output  signed [26:0] filterOut;  // sfix27_En20
  output  filterEnb;
  output  signed [22:0] oldCoeff;  // sfix23_En20
  output  validCoeff;


  wire Tapped_Delay_out1;
  wire filtEnb;
  wire signed [15:0] Tapped_Delay_out3;  // sfix16_En13
  wire Tapped_Delay_out4;
  wire [4:0] rdAdrs;  // ufix5
  wire signed [22:0] y;  // sfix23_En20
  wire signed [22:0] y_1;  // sfix23_En20
  wire filtEnb_1;
  wire accRst;
  wire dataRst;
  wire coeffRst;
  reg  Delay6_out1;
  reg  Delay7_out1;
  wire signed [15:0] delayLine_1;  // sfix16_En13
  reg signed [15:0] Delay11_reg [0:1];  // sfix16 [2]
  wire signed [15:0] Delay11_reg_next [0:1];  // sfix16_En13 [2]
  wire signed [15:0] Delay11_out1;  // sfix16_En13
  reg  [2:0] Delay3_reg;  // ufix1 [3]
  wire Delay3_out1;
  reg  [2:0] Delay5_reg;  // ufix1 [3]
  wire Delay5_out1;
  wire OR_out1;
  reg  [2:0] Delay8_reg;  // ufix1 [3]
  wire Delay8_out1;
  reg  [2:0] Delay1_reg;  // ufix1 [3]
  wire Delay1_out1;
  reg  [2:0] Delay9_reg;  // ufix1 [3]
  wire Delay9_out1;
  wire signed [38:0] out;  // sfix39_En33
  wire Accumulator_out1;
  wire signed [26:0] out1;  // sfix27_En20
  reg signed [31:0] Delay11_t_0_0;  // int32
  reg signed [31:0] Delay11_t_1;  // int32


  Tapped_Delay u_Tapped_Delay (.clk(clk),
                               .reset(reset),
                               .enb(enb),
                               .observed(observed),  // sfix16_En13
                               .enb_1(enb_1),
                               .rst(reset_1),
                               .adapt(adapt),
                               .validCoeff(Tapped_Delay_out1),
                               .filterEnb(filtEnb),
                               .delayLine(Tapped_Delay_out3),  // sfix16_En13
                               .coeffWrEnb(Tapped_Delay_out4),
                               .rdAddrs(rdAdrs)  // ufix5
                               );
  Coefficient_Memory u_Coefficient_Memory (.clk(clk),
                                           .reset(reset),
                                           .enb(enb),
                                           .delayLine(Tapped_Delay_out3),  // sfix16_En13
                                           .coeffWrEnb(Tapped_Delay_out4),
                                           .rdAddrs(rdAdrs),  // ufix5
                                           .coeffIn(newCoeff),  // sfix23_En20
                                           .rst(reset_1),
                                           .coeffOut(y)  // sfix23_En20
                                           );

  assign y_1 = y;

  assign filtEnb_1 = filtEnb;

  Reset_Control u_Reset_Control (.clk(clk),
                                 .reset(reset),
                                 .enb(enb),
                                 .rst(reset_1),
                                 .count(rdAdrs),  // ufix5
                                 .filterEnb(filtEnb_1),
                                 .enb_1(enb_1),
                                 .adapt(adapt),
                                 .accRst(accRst),
                                 .dataRst(dataRst),
                                 .coeffRst(coeffRst)
                                 );

  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= dataRst;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= coeffRst;
        end
      end
    end



  Reset_Data u_Reset_Data (.data(Tapped_Delay_out3),  // sfix16_En13
                           .coeff(y_1),  // sfix23_En20
                           .dataRst(Delay6_out1),
                           .coeffRst(Delay7_out1),
                           .delayLine(delayLine_1),  // sfix16_En13
                           .oldCoeff(oldCoeff)  // sfix23_En20
                           );

  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        for(Delay11_t_1 = 32'sd0; Delay11_t_1 <= 32'sd1; Delay11_t_1 = Delay11_t_1 + 32'sd1) begin
          Delay11_reg[Delay11_t_1] <= 16'sb0000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay11_t_0_0 = 32'sd0; Delay11_t_0_0 <= 32'sd1; Delay11_t_0_0 = Delay11_t_0_0 + 32'sd1) begin
            Delay11_reg[Delay11_t_0_0] <= Delay11_reg_next[Delay11_t_0_0];
          end
        end
      end
    end

  assign Delay11_out1 = Delay11_reg[1];
  assign Delay11_reg_next[0] = delayLine_1;
  assign Delay11_reg_next[1] = Delay11_reg[0];



  assign delayLine = Delay11_out1;

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay3_reg[0] <= accRst;
          Delay3_reg[32'sd2:32'sd1] <= Delay3_reg[32'sd1:32'sd0];
        end
      end
    end
assign Delay3_out1 = Delay3_reg[2];



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay5_reg[0] <= enb_1;
          Delay5_reg[32'sd2:32'sd1] <= Delay5_reg[32'sd1:32'sd0];
        end
      end
    end

  assign Delay5_out1 = Delay5_reg[2];



  assign OR_out1 = Delay3_out1 | Delay5_out1;



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay8_reg[0] <= OR_out1;
          Delay8_reg[32'sd2:32'sd1] <= Delay8_reg[32'sd1:32'sd0];
        end
      end
    end

  assign Delay8_out1 = Delay8_reg[2];



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay1_reg[0] <= filtEnb;
          Delay1_reg[32'sd2:32'sd1] <= Delay1_reg[32'sd1:32'sd0];
        end
      end
    end

  assign Delay1_out1 = Delay1_reg[2];



  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_reg <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          Delay9_reg[0] <= Delay1_out1;
          Delay9_reg[32'sd2:32'sd1] <= Delay9_reg[32'sd1:32'sd0];
        end
      end
    end

  assign Delay9_out1 = Delay9_reg[2];



  Multiplier_block1 u_Multiplier (.clk(clk),
                                  .enb(enb),
                                  .in1(Tapped_Delay_out3),  // sfix16_En13
                                  .in2(y),  // sfix23_En20
                                  .mulOut(out)  // sfix39_En33
                                  );

  Accumulator u_Accumulator (.clk(clk),
                             .reset(reset),
                             .enb(enb),
                             .reset_1(Delay8_out1),
                             .enb_1(Delay9_out1),
                             .mulOut(out),  // sfix39_En33
                             .filterValid(Accumulator_out1),
                             .filterOut(out1)  // sfix27_En20
                             );

  assign filterOut = out1;

  assign filterEnb = Accumulator_out1;

  assign validCoeff = Tapped_Delay_out1;

endmodule  // Filter
