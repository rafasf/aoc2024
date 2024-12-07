defmodule Day03 do
  def parse(file_name) do
    File.read!("lib/day03/#{file_name}")
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> Enum.flat_map(&to_valid_instructions/1)
    |> Enum.flat_map(&to_executed_instruction/1)
    |> Enum.sum()
  end

  defp to_valid_instructions(line) do
    Regex.scan(~r/mul\(\d+,\d+\)/, line)
    |> Enum.map(&hd/1)
  end

  defp to_executed_instruction(instruction) do
    Regex.scan(~r/(\d+),(\d+)/, instruction)
    |> Enum.map(&tl/1)
    |> Enum.map(fn [a, b] -> String.to_integer(a) * String.to_integer(b) end)
  end

  def part2(input) do
    input
  end
end
