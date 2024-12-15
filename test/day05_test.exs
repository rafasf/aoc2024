defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  test "parses input file" do
    assert Day05.parse("input_sample.txt") == [
             ["47", "53"],
             ["97", "13"],
             ["97", "61"],
             ["97", "47"],
             ["75", "29"],
             ["61", "13"],
             ["75", "53"],
             ["29", "13"],
             ["97", "29"],
             ["53", "29"],
             ["61", "53"],
             ["97", "53"],
             ["61", "29"],
             ["47", "13"],
             ["75", "47"],
             ["97", "75"],
             ["47", "61"],
             ["75", "61"],
             ["47", "29"],
             ["75", "13"],
             ["53", "13"],
             ["75", "47", "61", "53", "29"],
             ["97", "61", "53", "29", "13"],
             ["75", "29", "13"],
             ["75", "97", "47", "61", "53"],
             ["61", "13", "29"],
             ["97", "13", "75", "29", "47"]
           ]
  end

  test "sum middle pages of correctly ordered pages" do
    input = Day05.parse("input_sample.txt")
    assert Day05.part1(input) == 143
  end

  test "sum middle pages of corrected pages" do
    input = Day05.parse("input_sample.txt")
    assert Day05.part2(input) == 123
  end
end
