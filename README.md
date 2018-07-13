# FloatOptimization
Benchmarks and property based tests for https://github.com/elixir-lang/elixir/pull/7891 and https://github.com/elixir-lang/elixir/pull/7899

## Correctness
Run `mix test` with any elixir version without my changes to Float.ceil/2, Float.floor/2 and Float.round/2

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

#### After changes (float |> :erlang.ceil |> :erlang.float)
```
Name                         ips        average  deviation         median         99th %
ceil/1                  23214.94       43.08 μs    ±17.66%          42 μs          81 μs
ceil/2 precision 0      22786.86       43.88 μs    ±18.15%          42 μs          81 μs
ceil/2 precision 1        364.20     2745.76 μs     ±4.75%        2709 μs     3260.11 μs
```

#### Second iteration of changes (float |> :math.ceil)

```
Name                         ips        average  deviation         median         99th %
ceil/1                  39032.17       25.62 μs    ±30.36%          25 μs          48 μs
ceil/2 precision 0      42085.71       23.76 μs    ±32.74%          23 μs          50 μs
ceil/2 precision 1        365.97     2732.46 μs     ±4.44%        2697 μs     3227.10 μs
```

### Floor

#### Before changes
```
Name                         ips        average  deviation         median         99th %
floor/1                    382.26     2616.04 μs     ±4.29%        2591 μs     3050.78 μs
floor/2 precision 0        374.95     2667.04 μs     ±5.65%        2624 μs        3353 μs
floor/2 prevision 1        353.21     2831.22 μs     ±4.42%        2808 μs     3310.42 μs
```

#### After changes (float |> :erlang.floor |> :erlang.float)
```
Name                          ips        average  deviation         median         99th %
floor/1                  23373.19       42.78 μs    ±15.30%          42 μs          80 μs
floor/2 precision 0      22528.48       44.39 μs    ±16.96%          43 μs          80 μs
floor/2 prevision 1        359.11     2784.66 μs     ±4.00%        2762 μs     3203.20 μs
```

#### Second iteration of changes (float |> :math.floor)
```
Name                          ips        average  deviation         median         99th %
floor/1                  46143.92       21.67 μs    ±21.94%          21 μs          39 μs
floor/2 precision 0      38185.79       26.19 μs    ±25.95%          25 μs          48 μs
floor/2 prevision 1        366.04     2731.93 μs     ±4.39%        2698 μs        3201 μs
```

### Round

#### Before changes
```
Name                          ips        average  deviation         median         99th %
round/1                    382.08     2617.25 μs     ±3.97%        2590 μs     3031.20 μs
round/2 precision 0        377.92     2646.05 μs     ±4.09%        2621 μs     3064.80 μs
round/2 precision 1        351.24     2847.02 μs     ±6.13%        2804 μs     3648.76 μs
```

#### After changes (float |> :erlang.round |> :erlang.float)
```
Name                          ips        average  deviation         median         99th %
round/1                  20596.03       48.55 μs    ±18.17%          47 μs          91 μs
round/2 precision 0      20096.23       49.76 μs    ±17.50%          48 μs          91 μs
round/2 precision 1        354.77     2818.69 μs     ±4.28%        2795 μs     3292.34 μs
```
