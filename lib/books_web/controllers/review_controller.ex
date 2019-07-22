defmodule BooksWeb.ReviewController do
  @moduledoc """
  Modulo que provee la interfaz para administrar los reviews
  """
  use BooksWeb, :controller

  alias Books.Helpers.ReviewHelper

  @doc """
  Crea un review para un libro
  """
  @spec create(map, map) :: String.t()
  def create(conn, params) do
    case ReviewHelper.add_review(params) do
      :ok ->
        conn
        |> redirect(to: Routes.book_path(conn, :show, params["book_id"]))

      :error ->
        conn
        |> put_flash(:error, "No se pudo agregar el review")
        |> redirect(to: Routes.book_path(conn, :show, params["book_id"]))
    end
  end
end
