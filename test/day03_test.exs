defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "parses input file" do
    assert Day03.parse("input_sample.txt") == [
             "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
           ]
  end

  test "returns sum of valid instructions" do
    input = Day03.parse("input_sample.txt")
    assert Day03.part1(input) == 161
  end
end
