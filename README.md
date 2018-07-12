# FloatOptimization

## Correctness
Run `mix test` with any elixir version without my changes to Float.ceil/2 and Float.floor/2

## Benchmarks
Run `mix run lib/benchmarks.exs` with different elixir versions

```
Elixir 1.8.0-dev
Erlang 21.0
CPU Information: Intel(R) Core(TM) i7-6920HQ CPU @ 2.90GHz
Number of Available Cores: 8
Available memory: 16 GB
```

### Ceil

#### Before changes
```
Name                         ips        average  deviation         median         99th %
ceil/1                    369.95     2703.04 μs     ±9.48%        2615 μs        3897 μs
ceil/2 precision 0        366.37     2729.45 μs     ±8.96%        2674 μs     3743.83 μs
ceil/2 precision 1        350.72     2851.25 μs     ±4.61%        2821 μs     3356.70 μs
```

#### After changes
```
Name                         ips        average  deviation         median         99th %
ceil/1                  23214.94       43.08 μs    ±17.66%          42 μs          81 μs
ceil/2 precision 0      22786.86       43.88 μs    ±18.15%          42 μs          81 μs
ceil/2 precision 1        364.20     2745.76 μs     ±4.75%        2709 μs     3260.11 μs
```

### Floor

#### Before changes
```
Name                         ips        average  deviation         median         99th %
floor/1                    382.26     2616.04 μs     ±4.29%        2591 μs     3050.78 μs
floor/2 precision 0        374.95     2667.04 μs     ±5.65%        2624 μs        3353 μs
floor/2 prevision 1        353.21     2831.22 μs     ±4.42%        2808 μs     3310.42 μs
```

#### After changes
```
Name                          ips        average  deviation         median         99th %
floor/1                  23373.19       42.78 μs    ±15.30%          42 μs          80 μs
floor/2 precision 0      22528.48       44.39 μs    ±16.96%          43 μs          80 μs
floor/2 prevision 1        359.11     2784.66 μs     ±4.00%        2762 μs     3203.20 μs
```
