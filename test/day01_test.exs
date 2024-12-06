defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "parses input file" do
    [left_column, right_column] = Day01.parse("input_sample.txt")

    assert left_column == [3, 4, 2, 1, 3, 3]
    assert right_column == [4, 3, 5, 3, 9, 3]
  end

  test "calculates the distance" do
    input = Day01.parse("input_sample.txt")
    assert Day01.part1(input) == 11
  end

  test "calculate similarity score" do
    input = Day01.parse("input_sample.txt")
    assert Day01.part2(input) == 31
  end
end
