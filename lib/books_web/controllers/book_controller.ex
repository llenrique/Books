defmodule BooksWeb.BookController do
  @moduledoc """
  Logica para las rutas de administración de los libros
  """
  use BooksWeb, :controller

  alias Books.Contexts.ReviewManager
  alias Books.Helpers.BookHelper

  @doc """
  Despliega el formulario donde se coloca la información del libro
  """
  @spec index(map, map) :: String.t()
  def index(conn, _params) do
    conn
    |> render(:index)
  end

  @doc """
  Guarda la información de un libro
  """
  @spec create(map, map) :: String.t()
  def create(conn, params) do
    case BookHelper.save_book(params) do
      {:ok, _} ->
        conn
        |> redirect(to: Routes.book_path(conn, :index))
    end
  end

  @doc """
  Despliega la información de un libro
  """
  @spec show(map, map) :: String.t()
  def show(conn, %{"id" => id}) do
    case BookHelper.get_book(id) do
      book ->
        review_changeset = ReviewManager.new()

        conn
        |> assign(:review, review_changeset)
        |> assign(:book, book)
        |> render(:show)
    end
  end
end
