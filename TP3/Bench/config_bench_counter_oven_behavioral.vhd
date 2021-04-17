library LIB_TP3;
library LIB_TP3_BENCH;

configuration config_bench_counter_oven_behavioral of LIB_TP3_BENCH.bench_counter_oven is
    for test
       for dut : counter_oven
           use entity LIB_TP3.counter_oven(impl);
       end for;
    end for;
end config_bench_counter_oven_behavioral;
