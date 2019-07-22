defmodule BooksWeb.PageController do

  @moduledoc """
  Acciones en la página principal
  """

  use BooksWeb, :controller

  alias Books.Helpers.BookHelper

  @doc """
  Despliega todos los libros registrados
  """
  @spec index(map, map) :: String.t()
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
