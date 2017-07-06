defmodule Reader.UploadController do
  use Reader.Web, :controller
  alias Reader.CSV

  def create(conn, params) do
    filename = params["file"].filename
    persons = CSV.read params["file"].path

    render conn, filename: filename, persons: persons
  end
end
