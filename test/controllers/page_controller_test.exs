defmodule Reader.PageControllerTest do
  use Reader.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Elixir Reader"
  end
end
