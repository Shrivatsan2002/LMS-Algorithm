onbreak resume
onerror resume
vsim -voptargs=+acc work.HDL_LMS_Algorithm_tb

add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/clk
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/reset
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/clk_enable
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/observedSignal
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/desiredSignal
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/valid
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/stepSize
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/adapt
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/reset_1
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/ce_out
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterOut_out1
add wave sim:/HDL_LMS_Algorithm_tb/filterOut_out1_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterOut_signal2
add wave sim:/HDL_LMS_Algorithm_tb/filterOut_signal2_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterWeights_oldCoeff
add wave sim:/HDL_LMS_Algorithm_tb/filterWeights_oldCoeff_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterWeights_signal2
add wave sim:/HDL_LMS_Algorithm_tb/filterWeights_signal2_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterError_signal1
add wave sim:/HDL_LMS_Algorithm_tb/filterError_signal1_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/filterError_signal2
add wave sim:/HDL_LMS_Algorithm_tb/filterError_signal2_ref
add wave sim:/HDL_LMS_Algorithm_tb/u_HDL_LMS_Algorithm/ready
add wave sim:/HDL_LMS_Algorithm_tb/ready_ref
run -all
