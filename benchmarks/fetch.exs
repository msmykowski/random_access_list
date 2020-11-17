ten = Enum.to_list(0..10)
hundred = Enum.to_list(0..100)
thousand = Enum.to_list(0..1_000)
ten_thousand = Enum.to_list(0..10_000)
hundred_thousand = Enum.to_list(0..100_000)
million = Enum.to_list(0..1_000_000)

ten_ral = RandomAccessList.new(ten)
hundred_ral = RandomAccessList.new(hundred)
thousand_ral = RandomAccessList.new(thousand)
ten_thousand_ral = RandomAccessList.new(ten_thousand)
hundred_thousand_ral = RandomAccessList.new(hundred_thousand)
million_ral = RandomAccessList.new(million)

Benchee.run(
  %{
    "standard" => fn {standard, _ral, index}-> {:ok, ^index} = Enum.fetch(standard, index) end,
    "random_access_list" => fn {_standard, ral, index} -> {:ok, ^index} = RandomAccessList.fetch(ral, index) end,
  },
  inputs: %{
    "ten" => {ten, ten_ral, 5},
    "hundred" => {hundred, hundred_ral, 50},
    "thousand" => {thousand, thousand_ral, 500},
    "ten_thousand" => {ten_thousand, ten_thousand_ral, 5_000},
    "hundred_thousand" => {hundred_thousand, hundred_thousand_ral, 50_000},
    "million" => {million, million_ral, 500_000},
  }
)