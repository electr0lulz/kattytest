defmodule KattyWeb.PageController do
  use KattyWeb, :controller

  def index(conn, _params) do
    conn
    |> put_root_layout({KattyWeb.LayoutView, "page.html"})
    |> render("index.html")
  end
end
