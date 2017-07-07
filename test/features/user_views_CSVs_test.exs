defmodule Reader.UserViewsCSVsTest do
  use Reader.FeatureCase, async: true

  import Wallaby.Query, only: [css: 2]

  test "user uploads and views CSV", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css ".count", text: "0 people")
    |> assert_has(css ".filename", text: "")
    |> assert_has(css "tr", text: "No records")
    |> make_visible("file")
    |> attach_file(css("#file", []), path: "test/fixtures/commas.csv")
    |> assert_has(css ".count", text: "3 people")
    |> assert_has(css ".filename", text: "commas.csv")
    |> assert_has(css ".person", count: 3)
  end

  test "user sorts the table", %{session: session} do
    session
    |> visit("/")
    |> make_visible("file")
    |> attach_file(css("#file", []), path: "test/fixtures/commas.csv")
    |> get_first_person
    |> assert =~ "Brinckerhoff Jennifer"

    session
    |> click(css "th", text: "Last")
    |> get_first_person
    |> assert =~ "Votraw Moses"
  end

  defp get_first_person(parent) do
    parent |> all(css ".person", []) |> List.first |> Element.text
  end

  # Wallaby currently fails when attaching files to inputs with 'display: none'
  defp make_visible(parent, id) do
    script = "document.getElementById('#{id}').classList.remove('hidden')"
    parent |> execute_script(script)
  end

end
