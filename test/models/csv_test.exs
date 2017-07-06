defmodule Reader.CSVTest do
  use Reader.ModelCase

  defp is_list_of_persons([%Person{}, %Person{}, %Person{}]), do: true
  defp is_list_of_persons(_), do: false

  test "reads three different CSV formats" do
    commas = "test/fixtures/commas.csv"
    pipes = "test/fixtures/pipes.csv"
    spaces = "test/fixtures/spaces.csv"

    assert is_list_of_persons CSV.read(commas)
    assert is_list_of_persons CSV.read(pipes)
    assert is_list_of_persons CSV.read(spaces)
  end
end
