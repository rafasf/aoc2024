defmodule Day03 do
  def parse(file_name) do
    File.read!("lib/day03/#{file_name}")
    # |> String.split("\n", trim: true)
  end

  def part1(input) do
    Regex.scan(~r/mul\(\d+,\d+\)/, input)
    |> Enum.map(&hd/1)
    |> Enum.flat_map(&to_executed_instruction/1)
    |> Enum.sum()
  end

  defp to_executed_instruction(instruction) do
    Regex.scan(~r/(\d+),(\d+)/, instruction)
    |> Enum.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
  end

  def part2(input) do
    valid_instructions_from(input)
    |> Enum.flat_map(&to_executed_instruction/1)
    |> Enum.sum()
  end

  defp valid_instructions_from(line) do
    Regex.scan(~r/(mul\(\d+,\d+\))|(do\(\))|(don't\(\))/, line)
    |> Enum.map(&List.last/1)
    |> Enum.reduce({:do, []}, fn match, {token, acc} ->
      cond do
        Regex.match?(~r/don\'t\(\)/, match) ->
          {:dont, acc}

        Regex.match?(~r/do\(\)/, match) ->
          {:do, acc}

        token == :do ->
          {token, acc ++ [match]}

        token == :dont ->
          {:dont, acc}

        true ->
          {token, acc}
      end
    end)
    |> elem(1)
  end
end
