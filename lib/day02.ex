defmodule Day02 do
  def parse(file_name) do
    File.read!("lib/day02/#{file_name}")
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    input
    |> Enum.filter(&is_safe_report/1)
    |> length()
  end

  defp is_safe_report(report) do
    is_between_range = fn a, b ->
      abs(b - a) <= 3 and abs(b - a) >= 1
    end

    increasing =
      Enum.chunk_every(report, 2, 1, :discard)
      |> Enum.all?(fn [a, b] -> a < b and is_between_range.(a, b) end)

    decreasing =
      Enum.chunk_every(report, 2, 1, :discard)
      |> Enum.all?(fn [a, b] -> a > b and is_between_range.(a, b) end)

    increasing or decreasing
  end

  def part2(input) do
    input
  end
end
