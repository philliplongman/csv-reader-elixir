defmodule Reader.UploadView do
  use Reader.Web, :view

  def render("create.json", %{filename: filename, persons: persons}) do
    %{
      filename: filename,
      persons: persons
    }
  end
end
