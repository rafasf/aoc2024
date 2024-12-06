defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "parses input file" do
    assert Day02.parse("input_sample.txt") == [
             [7, 6, 4, 2, 1],
             [1, 2, 7, 8, 9],
             [9, 7, 6, 2, 1],
             [1, 3, 2, 4, 5],
             [8, 6, 4, 4, 1],
             [1, 3, 6, 7, 9]
           ]
  end

  test "returns number of safe reports" do
    input = Day02.parse("input_sample.txt")
    assert Day02.part1(input) == 2
  end

  test "returns number of safe reports with tolerance" do
    input = Day02.parse("input_sample.txt")
    assert Day02.part2(input) == 4
  end
end
