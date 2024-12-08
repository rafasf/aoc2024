defmodule Day04 do
  def parse(file_name) do
    File.read!("lib/day04/#{file_name}")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def part1(input) do
    directions = [
      # Up
      {-1, 0},
      # Down
      {1, 0},
      # Left
      {0, -1},
      # Right
      {0, 1},
      # Diagonal up, left
      {-1, -1},
      # Diagonal up, right
      {-1, 1},
      # Diagonal down, left
      {1, -1},
      # Diagonal down, right
      {1, 1}
    ]

    occurences =
      for row <- 0..(length(input) - 1),
          col <- 0..(length(List.first(input)) - 1),
          direction <- directions,
          word?(input, "XMAS", row, col, direction),
          do: {row, col, direction}

    length(occurences)
  end

  defp word?(input, word, row, col, {d_row, d_col}) do
    Enum.all?(0..(String.length(word) - 1), fn index ->
      next_row = row + index * d_row
      next_col = col + index * d_col

      in_bounds =
        next_row >= 0 and next_row < length(input) and
          next_col >= 0 and next_col < length(List.first(input))

      in_bounds and Enum.at(Enum.at(input, next_row), next_col) == String.at(word, index)
    end)
  end

  def part2(input) do
    input
  end
end
