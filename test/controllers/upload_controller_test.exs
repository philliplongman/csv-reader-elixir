defmodule Reader.UploadControllerTest do
  use Reader.ConnCase

  test "create action returns parsed file as JSON", %{conn: conn} do
    filename = "commas.csv"
    contents = File.read! "test/fixtures/commas.csv"
    conn = post conn, "/api/upload", %{ filename: filename, contents: contents }

    assert json_response(conn, 200) == %{
      "filename" => "commas.csv",
      "people" => [
        %{
          "birthday" => "1945-04-14",   "color" => "Turquoise",
          "first" => "Shalonda",        "last" => "Radican",
          "middle" => nil,              "pet" => "Cat"
        },
        %{
          "birthday" => "1980-09-20",   "color" => "Yellow",
          "first" => "Jennifer",        "last" => "Brinckerhoff",
          "middle" => nil,              "pet" => "Dog"
        },
        %{
          "birthday" => "1964-11-13",   "color" => "Blue",
          "first" => "Moses",           "last" => "Votraw",
          "middle" => nil,              "pet" => "None"
        }
      ]
    }
  end
end
