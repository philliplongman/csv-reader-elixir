defmodule Reader.CSV do
  use Reader.Web, :model
  alias Reader.Person

  def read(contents) do
    read_people_from_file(contents) |> Enum.to_list
  end

  defp read_people_from_file(contents) do
    contents
      |> String.split("\n", trim: true)
      |> Stream.map(&String.trim/1)
      |> Stream.map(&split_by_delimiter/1)
      |> Stream.map(&Person.new/1)
  end

  defp split_by_delimiter(line) do
    cond do
      String.contains? line, "," -> { :comma, String.split(line, ",") }
      String.contains? line, " " -> { :space, String.split(line, " ") }
      String.contains? line, "|" -> { :pipe,  String.split(line, "|") }
    end
  end
end
