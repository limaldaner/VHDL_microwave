library LIB_TP3;
library LIB_TP3_BENCH;

configuration config_bench_ctrl_oven_behavioral_onehot of LIB_TP3_BENCH.bench_ctrl_oven is
    for test
       for dut : ctrl_oven
           use entity LIB_TP3.ctrl_oven(behavioral_onehot);
       end for;
    end for;
end config_bench_ctrl_oven_behavioral_onehot;
