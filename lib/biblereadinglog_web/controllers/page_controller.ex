defmodule BiblereadinglogWeb.PageController do
  use BiblereadinglogWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
