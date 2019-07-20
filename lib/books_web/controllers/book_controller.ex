defmodule BooksWeb.BookController do
  use BooksWeb, :controller

  alias Books.Helpers.BookHelper

  def index(conn, _params) do
    conn
    |> render(:index)
  end

  def create(conn, params) do
    case BookHelper.save_book(params) do
      cover ->
        conn
        |> redirect(to: Routes.book_path(conn, :index))
    end
  end
end