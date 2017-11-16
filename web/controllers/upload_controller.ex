defmodule Reader.UploadController do
  use Reader.Web, :controller
  alias Reader.CSV

  def create(conn, params) do
    filename = params["filename"]
    people = CSV.read params["contents"]

    render conn, filename: filename, people: people
  end
end
