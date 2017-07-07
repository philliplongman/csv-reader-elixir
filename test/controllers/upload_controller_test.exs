defmodule Reader.UploadControllerTest do
  use Reader.ConnCase

  test "create action returns parsed file as JSON", %{conn: conn} do
    upload = %Plug.Upload{path: "test/fixtures/commas.csv", filename: "commas.csv"}
    conn = post conn, "/api/upload", %{ file: upload }

    assert json_response(conn, 200) == %{
      "filename" => "commas.csv",
      "persons" => [
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
