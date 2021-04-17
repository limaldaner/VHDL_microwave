library LIB_TP3;
library LIB_TP3_BENCH;

configuration config_bench_ctrl_oven_behavioral_all of LIB_TP3_BENCH.bench_ctrl_oven is
    for test
       for dut : ctrl_oven
           use entity LIB_TP3.ctrl_oven(behavioral);
       end for;
	   for dutB : ctrl_oven_binary
           use entity LIB_TP3.ctrl_oven_binary(behavioral_binary);
       end for;
	   for dutOH : ctrl_oven_onehot
           use entity LIB_TP3.ctrl_oven_onehot(behavioral_onehot);
       end for;
	   for dutG : ctrl_oven_gray
           use entity LIB_TP3.ctrl_oven_gray(behavioral_gray);
       end for;
    end for;
end config_bench_ctrl_oven_behavioral_all;