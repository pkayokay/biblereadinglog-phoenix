defmodule BiblereadinglogWeb.TableOfContentsController do
  use BiblereadinglogWeb, :controller

  def index(conn, _params) do
    json(conn, BiblereadinglogWeb.TableOfContentsJSON.books())
  end
end
