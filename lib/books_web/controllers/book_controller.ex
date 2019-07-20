defmodule BooksWeb.BookController do
  use BooksWeb, :controller

  alias Books.Helpers.BookHelper

  def index(conn, _params) do
    conn
    |> render(:index)
  end

  def create(conn, params) do
    case BookHelper.save_book(params) do
      {:ok, book} ->
        conn
        |> redirect(to: Routes.book_path(conn, :show, book))
    end
  end

  def show(conn, %{"id" => id}) do
    case BookHelper.get_book(id) do
      book ->
        IO.inspect book
        conn
        |> assign(:book, book)
        |> render(:show)
    end
  end
end