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

      in_bounds?(input, next_row, next_col) and
        Enum.at(Enum.at(input, next_row), next_col) == String.at(word, index)
    end)
  end

  defp in_bounds?(matrix, row, col) do
    row >= 0 and row < length(matrix) and
      col >= 0 and col < length(List.first(matrix))
  end

  def part2(input) do
    occurences =
      for row <- 0..(length(input) - 1),
          col <- 0..(length(List.first(input)) - 1),
          xmas?(input, row, col),
          do: {row, col}

    length(occurences)
  end

  defp xmas?(input, row, col) do
    cond do
      Enum.at(Enum.at(input, row), col) == "A" ->
        up_left = {row - 1, col - 1, :up_left}
        up_right = {row - 1, col + 1, :up_right}
        down_left = {row + 1, col - 1, :down_left}
        down_right = {row + 1, col + 1, :down_right}

        positions = [up_left, up_right, down_left, down_right]
        all_in_bounds = Enum.all?(positions, fn {r, c, _} -> in_bounds?(input, r, c) end)

        if all_in_bounds do
          ms =
            positions
            |> Enum.map(fn {p_row, p_col, dir} ->
              {dir, Enum.at(Enum.at(input, p_row), p_col)}
            end)
            |> Enum.chunk_every(4)
            |> Enum.filter(fn [{_, up_left}, {_, up_right}, {_, down_left}, {_, down_right}] ->
              up_left != down_right and up_right != down_left
            end)
            |> List.flatten()
            |> Enum.map(fn a -> elem(a, 1) end)

          Enum.count(ms, fn char -> char == "M" end) == 2 and
            Enum.count(ms, fn char -> char == "S" end) == 2
        else
          false
        end

      true ->
        false
    end
  end
end
