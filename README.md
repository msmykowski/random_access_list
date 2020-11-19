# RandomAccessList
This is a purely functional implementation of a random access list based off of [Chris Okasaki's research](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.55.5156&rep=rep1&type=pdf).

A random access list is a data structure that has _O(log n)_ time _lookups_ and _updates_, while maintaining a constant time
for _cons_, _tail_ and _head_ operations.

A standard list used in Elixir has a _O(i)_ time for _lookups_ and _updates_, with _i_ being the index.

## Benchmarks
### Fetch

```
##### With input ten #####
Name                         ips        average  deviation         median         99th %
standard                 12.15 M       82.28 ns ±24461.36%           0 ns           0 ns
random_access_list        6.41 M      155.99 ns ±62310.01%           0 ns           0 ns

Comparison:
standard                 12.15 M
random_access_list        6.41 M - 1.90x slower +73.71 ns

##### With input hundred #####
Name                         ips        average  deviation         median         99th %
random_access_list       13.36 M       74.83 ns ±20053.30%           0 ns        1000 ns
standard                  3.34 M      299.51 ns ±10137.56%           0 ns        1000 ns

Comparison:
random_access_list       13.36 M
standard                  3.34 M - 4.00x slower +224.68 ns

##### With input thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list        2.41 M        0.42 μs   ±638.71%           0 μs           2 μs
standard                 0.128 M        7.83 μs   ±880.30%           7 μs          14 μs

Comparison:
random_access_list        2.41 M
standard                 0.128 M - 18.86x slower +7.42 μs

##### With input ten_thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list        1.69 M        0.59 μs  ±1999.80%           0 μs           2 μs
standard                0.0113 M       88.57 μs    ±69.36%          78 μs         187 μs

Comparison:
random_access_list        1.69 M
standard                0.0113 M - 149.36x slower +87.98 μs

##### With input hundred_thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list        1.06 M     0.00094 ms  ±1601.17%     0.00100 ms     0.00300 ms
standard               0.00088 M        1.13 ms    ±80.44%        0.94 ms        4.43 ms

Comparison:
random_access_list        1.06 M
standard               0.00088 M - 1201.83x slower +1.13 ms

##### With input million #####
Name                         ips        average  deviation         median         99th %
random_access_list      819.31 K     0.00122 ms  ±1764.48%     0.00100 ms     0.00300 ms
standard                0.0938 K       10.67 ms    ±53.09%        9.60 ms       45.10 ms

Comparison:
random_access_list      819.31 K
standard                0.0938 K - 8739.02x slower +10.67 ms
```

### Update At

```
##### With input ten #####
Name                         ips        average  deviation         median         99th %
standard                 37.33 M      0.0268 μs ±85875.68%           0 μs           0 μs
random_access_list        0.75 M        1.33 μs  ±2896.73%           1 μs           3 μs

Comparison:
standard                 37.33 M
random_access_list        0.75 M - 49.79x slower +1.31 μs

##### With input hundred #####
Name                         ips        average  deviation         median         99th %
standard                  1.19 M        0.84 μs  ±6569.57%           1 μs           2 μs
random_access_list        0.36 M        2.75 μs  ±2735.93%           2 μs           5 μs

Comparison:
standard                  1.19 M
random_access_list        0.36 M - 3.26x slower +1.90 μs

##### With input thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list      202.22 K        4.95 μs   ±822.02%           5 μs           8 μs
standard                 76.28 K       13.11 μs   ±512.05%          13 μs          17 μs

Comparison:
random_access_list      202.22 K
standard                 76.28 K - 2.65x slower +8.17 μs

##### With input ten_thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list      143.76 K        6.96 μs  ±1400.86%           7 μs          11 μs
standard                  7.37 K      135.65 μs   ±137.56%         132 μs         186 μs

Comparison:
random_access_list      143.76 K
standard                  7.37 K - 19.50x slower +128.69 μs

##### With input hundred_thousand #####
Name                         ips        average  deviation         median         99th %
random_access_list      116.02 K     0.00862 ms   ±592.29%     0.00800 ms      0.0130 ms
standard                  0.70 K        1.44 ms    ±42.98%        1.39 ms        1.85 ms

Comparison:
random_access_list      116.02 K
standard                  0.70 K - 166.50x slower +1.43 ms

##### With input million #####
Name                         ips        average  deviation         median         99th %
random_access_list       71.50 K      0.0140 ms   ±827.85%      0.0130 ms      0.0230 ms
standard                0.0479 K       20.88 ms    ±51.13%       17.19 ms       37.02 ms

Comparison:
random_access_list       71.50 K
standard                0.0479 K - 1492.97x slower +20.87 ms
```

## Installation

```elixir
def deps do
  [
    {:random_access_list, "~> 0.1.0"}
  ]
end
```

