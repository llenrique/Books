defmodule BooksWeb.PageController do
  use BooksWeb, :controller

  alias Books.Helpers.BookHelper

  def index(conn, _params) do
    case BookHelper.list_all_books() do
      {:ok, books} ->
        conn
        |> assign(:books, books)
        |> render(:index)

      {:error, message} ->
        IO.puts(message)
    end
  end
end
