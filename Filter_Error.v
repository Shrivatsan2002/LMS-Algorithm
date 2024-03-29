// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HDLFullySerialLMSModel\Filter_Error.v
// Created: 2024-02-10 22:35:17
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Filter_Error
// Source Path: HDLFullySerialLMSModel/HDL LMS Algorithm/Coefficient Update/Filter Error
// Hierarchy Level: 2
// Model version: 6.2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Filter_Error
          (clk,
           reset,
           enb,
           enb_1,
           desired,
           filterData,
           filterError);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   signed [15:0] desired;  // sfix16_En13
  input   signed [26:0] filterData;  // sfix27_En20
  output  signed [22:0] filterError;  // sfix23_En16


  wire signed [22:0] out1;  // sfix23_En16
  wire signed [22:0] out2;  // sfix23_En16
  reg signed [22:0] Delay3_reg [0:6];  // sfix23 [7]
  reg signed [22:0] Delay3_reg_next [0:6];  // sfix23_En16 [7]
  reg signed [22:0] Delay3_out1;  // sfix23_En16
  wire signed [22:0] Add1_out1;  // sfix23_En16
  reg signed [22:0] Delay5_out1;  // sfix23_En16
  reg signed [31:0] Delay3_t_0_0;  // int32
  reg signed [31:0] Delay3_t_0_1;  // int32
  reg signed [31:0] Delay3_t_1;  // int32


  DataType_Conversion u_DataType_Conversion (.clk(clk),
                                             .reset(reset),
                                             .enb(enb),
                                             .enb_1(enb_1),
                                             .u(desired),  // sfix16_En13
                                             .u1(filterData),  // sfix27_En20
                                             .out1(out1),  // sfix23_En16
                                             .out2(out2)  // sfix23_En16
                                             );

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        for(Delay3_t_1 = 32'sd0; Delay3_t_1 <= 32'sd6; Delay3_t_1 = Delay3_t_1 + 32'sd1) begin
          Delay3_reg[Delay3_t_1] <= 23'sb00000000000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay3_t_0_1 = 32'sd0; Delay3_t_0_1 <= 32'sd6; Delay3_t_0_1 = Delay3_t_0_1 + 32'sd1) begin
            Delay3_reg[Delay3_t_0_1] <= Delay3_reg_next[Delay3_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay3_out1 = Delay3_reg[6];
    Delay3_reg_next[0] = out1;

    for(Delay3_t_0_0 = 32'sd0; Delay3_t_0_0 <= 32'sd5; Delay3_t_0_0 = Delay3_t_0_0 + 32'sd1) begin
      Delay3_reg_next[Delay3_t_0_0 + 32'sd1] = Delay3_reg[Delay3_t_0_0];
    end

  end



  assign Add1_out1 = Delay3_out1 - out2;



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 23'sb00000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Add1_out1;
        end
      end
    end



  assign filterError = Delay5_out1;

endmodule  // Filter_Error