defmodule Reader.UploadView do
  use Reader.Web, :view

  def render("create.json", %{filename: filename, people: people}) do
    %{
      filename: filename,
      people: people
    }
  end
end
