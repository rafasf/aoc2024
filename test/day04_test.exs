defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "parses input file" do
    assert Day04.parse("input_sample.txt") == [
             ["M", "M", "M", "S", "X", "X", "M", "A", "S", "M"],
             ["M", "S", "A", "M", "X", "M", "S", "M", "S", "A"],
             ["A", "M", "X", "S", "X", "M", "A", "A", "M", "M"],
             ["M", "S", "A", "M", "A", "S", "M", "S", "M", "X"],
             ["X", "M", "A", "S", "A", "M", "X", "A", "M", "M"],
             ["X", "X", "A", "M", "M", "X", "X", "A", "M", "A"],
             ["S", "M", "S", "M", "S", "A", "S", "X", "S", "S"],
             ["S", "A", "X", "A", "M", "A", "S", "A", "A", "A"],
             ["M", "A", "M", "M", "M", "X", "M", "M", "M", "M"],
             ["M", "X", "M", "X", "A", "X", "M", "A", "S", "X"]
           ]
  end

  test "returns number of occurencies of the word" do
    input = Day04.parse("input_sample.txt")
    assert Day04.part1(input) == 18
  end
end