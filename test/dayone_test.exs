defmodule DayoneTest do
  use ExUnit.Case
  doctest Dayone

  test "parses input file" do
    [left_column, right_column] = Dayone.parse("input_sample.txt")

    assert left_column == [3, 4, 2, 1, 3, 3]
    assert right_column == [4, 3, 5, 3, 9, 3]
  end

  test "calculates the distance" do
    input = Dayone.parse("input_sample.txt")
    assert Dayone.part1(input) == 11
  end
end
