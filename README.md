# RandomAccessList
This is a purely functional implementation of a random access list based off of [Chris Okasaki's research](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.55.5156&rep=rep1&type=pdf).

A random access list is a data structure that has _O(log n)_ time _lookups_ and _updates_, while maintaining a constant time
for _cons_, _tail_ and _head_ operations.

A standard list used in Elixir has a _O(i)_ time for _lookups_ and _updates_, with _i_ being the index.

## Installation

```elixir
def deps do
  [
    {:random_access_list, "~> 0.1.0"}
  ]
end
```

