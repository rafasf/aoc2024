defmodule Day05 do
  def parse(file_name) do
    File.read!("lib/day05/#{file_name}")
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> String.split(line, ~r/\||,/) end)
  end

  def part1(input) do
    ordering =
      input
      |> Enum.filter(fn line -> length(line) == 2 end)
      |> Enum.group_by(
        fn [key, _value] -> key end,
        fn [_key, value] -> value end
      )

    input
    |> Enum.filter(fn line -> length(line) > 2 end)
    |> Enum.filter(fn line -> correct?(ordering, Enum.reverse(line)) end)
    |> Enum.map(fn line ->
      String.to_integer(Enum.at(line, div(length(line), 2)))
    end)
    |> Enum.sum()
  end

  defp correct?(_order_rules, []), do: true
  defp correct?(_order_rules, [_]), do: true

  defp correct?(order_rules, [current | rest]) do
    rules = Map.get(order_rules, current, [])

    if Enum.any?(rules, fn rule -> rule in rest end) do
      false
    else
      correct?(order_rules, rest)
    end
  end

  def part2(input) do
    input
  end
end