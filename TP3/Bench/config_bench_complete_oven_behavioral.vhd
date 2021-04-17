library LIB_TP3;
library LIB_TP3_BENCH;

configuration config_bench_complete_oven_behavioral of LIB_TP3_BENCH.bench_complete_oven is
    for test
       for dut : complete_oven
           use entity LIB_TP3.complete_oven(behavioral);
       end for;
    end for;
end config_bench_complete_oven_behavioral;
