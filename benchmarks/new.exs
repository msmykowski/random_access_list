ten = 1..10
hundred = 1..100
thousand = 1..1_000
ten_thousand = 1..10_000
hundred_thousand = 1..100_000
million = 1..1_000_000

Benchee.run(
  %{
    "standard" => fn range -> Enum.to_list(range) end,
    "random_access_list" => fn range ->
        range
        |> Enum.to_list()
        |> RandomAccessList.new() 
    end,
  },
  inputs: %{
    "ten" => ten,
    "hundred" => hundred,
    "thousand" => thousand,
    "ten_thousand" => ten_thousand,
    "hundred_thousand" => hundred_thousand,
    "million" => million,
  }
)