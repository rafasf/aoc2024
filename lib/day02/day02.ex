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
    |> Enum.filter(&safe_report?/1)
    |> length()
  end

  defp safe_report?(report) do
    between_range? = fn a, b ->
      abs(b - a) <= 3 and abs(b - a) >= 1
    end

    increasing =
      Enum.chunk_every(report, 2, 1, :discard)
      |> Enum.all?(fn [a, b] -> a < b and between_range?.(a, b) end)

    decreasing =
      Enum.chunk_every(report, 2, 1, :discard)
      |> Enum.all?(fn [a, b] -> a > b and between_range?.(a, b) end)

    increasing or decreasing
  end

  def part2(input) do
    input
    |> Enum.split_with(&safe_report?/1)
    |> then(fn {safe, unsafe} ->
      tolerated =
        unsafe
        |> Enum.filter(&can_be_safe?/1)

      safe ++ tolerated
    end)
    |> length()
  end

  defp can_be_safe?(report) do
    0..(length(report) - 1)
    |> Enum.any?(fn index ->
      safe_report?(List.delete_at(report, index))
    end)
  end
end
