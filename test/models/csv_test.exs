defmodule Reader.CSVTest do
  use Reader.ModelCase

  defp is_list_of_people([%Person{}, %Person{}, %Person{}]), do: true
  defp is_list_of_people(_), do: false

  test "reads three different CSV formats" do
    commas = File.read! "test/fixtures/commas.csv"
    pipes = File.read! "test/fixtures/pipes.csv"
    spaces = File.read! "test/fixtures/spaces.csv"

    assert is_list_of_people CSV.read(commas)
    assert is_list_of_people CSV.read(pipes)
    assert is_list_of_people CSV.read(spaces)
  end
end
