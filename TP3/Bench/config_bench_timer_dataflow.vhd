library LIB_TP2;
library LIB_TP2_BENCH;

configuration config_bench_counter_dataflow of LIB_TP2_BENCH.bench_counter is
    for test
       for dut : counter
           use entity LIB_TP2.counter(dataflow);
       end for;
    end for;
end config_bench_counter_dataflow;
