defmodule Dayone do
  def parse(file_name) do
    File.read!("lib/day1/#{file_name}")
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.zip_with(&Function.identity/1)
  end

  defp parse_line(line) do
    line
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    input
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part2 do
  end
end
