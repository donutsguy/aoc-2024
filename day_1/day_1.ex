defmodule Day_1 do
  def part_1() do
    {odd_list, even_list} = setup()

    Enum.zip_reduce(even_list, odd_list, 0, fn n1, n2, acc ->
      if n1 - n2 < 0 do
        abs(n1 - n2) + acc
      else
        n1 - n2 + acc
      end
    end)
  end

  def part_2() do
    {odd_list, even_list} = setup()

    Enum.reduce(odd_list, 0, fn x, acc ->
      frequencie =
        Enum.count(even_list, fn y ->
          y == x
        end)

      x * frequencie + acc
    end)
  end

  def read_file_and_split() do
    {:ok, file} = File.read("input_1.txt")

    String.split(file) |> Enum.map(&String.to_integer/1)
  end

  def even_list(split_list) do
    split_list
    |> Enum.drop_every(2)
    |> Enum.sort()
  end

  def odd_list(split_list) do
    split_list
    |> Enum.take_every(2)
    |> Enum.sort()
  end

  def setup() do
    split_list = read_file_and_split()
    {odd_list(split_list), even_list(split_list)}
  end
end

IO.inspect(Day_1.part_1())
