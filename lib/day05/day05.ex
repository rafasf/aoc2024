defmodule Day05 do
  def parse(file_name) do
    File.read!("lib/day05/#{file_name}")
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> String.split(line, ~r/\||,/) end)
  end

  def part1(input) do
    order_rules = order_rules_from(input)

    input
    |> Enum.filter(fn line -> length(line) > 2 end)
    |> Enum.filter(fn line -> correct?(order_rules, Enum.reverse(line)) end)
    |> Enum.map(fn line ->
      String.to_integer(Enum.at(line, div(length(line), 2)))
    end)
    |> Enum.sum()
  end

  def part2(input) do
    order_rules = order_rules_from(input)

    input
    |> Enum.filter(fn line -> length(line) > 2 end)
    |> Enum.reject(fn line -> correct?(order_rules, Enum.reverse(line)) end)
    |> Enum.map(fn line -> make_correct(order_rules, line) end)
    |> Enum.map(fn line ->
      String.to_integer(Enum.at(line, div(length(line), 2)))
    end)
    |> Enum.sum()
  end

  defp order_rules_from(input) do
    input
    |> Enum.filter(fn line -> length(line) == 2 end)
    |> Enum.group_by(
      fn [key, _value] -> key end,
      fn [_key, value] -> value end
    )
  end

  defp correct?(_order_rules, []), do: true
  defp correct?(_order_rules, [_]), do: true

  defp correct?(order_rules, [current | rest]) do
    rules = Map.get(order_rules, current, [])

    if Enum.any?(rules, fn rule ->
         rule in rest
       end) do
      false
    else
      correct?(order_rules, rest)
    end
  end

  def make_correct(order_rules, [current_page | pages]) do
    order_rule = Map.get(order_rules, current_page, [])

    case Enum.all?(pages, &Enum.member?(order_rule, &1)) do
      true -> [current_page | make_correct(order_rules, pages)]
      false -> make_correct(order_rules, insert(pages, current_page, order_rule))
    end
  end

  def make_correct(_order_rules, []), do: []

  def insert([current_page | pages], page, order_rule) do
    case Enum.all?(pages, &Enum.member?(order_rule, &1)) do
      true -> [current_page, page | pages]
      false -> [current_page | insert(pages, page, order_rule)]
    end
  end
end
