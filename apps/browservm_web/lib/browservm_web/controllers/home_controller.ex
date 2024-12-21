defmodule BrowservmWeb.HomeController do
  use BrowservmWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
