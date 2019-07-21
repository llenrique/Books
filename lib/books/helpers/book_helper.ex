defmodule Books.Helpers.BookHelper do
  @moduledoc """
  Provee la logica para administrar libros
  """

  alias Books.Contexts.BookManager
  alias Books.Services.BookService

  @doc """
  Guarda la información de un libro
  """
  @spec save_book(map) :: Ecto.Changeset
  def save_book(map) do
    with cover <- BookService.build_book_cover(map),
        %{"title" => title} <- map,
        %{"author" => author} <- map do
      BookManager.create(%{title: title, cover: cover, author: author})
    end
  end

  @doc """
  Obtiene un libro por su id
  """
  @spec get_book(integer) :: Ecto.Changeset
  def get_book(id) do
    case BookManager.get_by_id(id) do
      nil ->
        {:error, "Libro no encontrado"}

      book ->
        book
    end
  end

  @doc """
  Regresa una lista con todos los libros registrados
  """
  @spec list_all_books() :: list
  def list_all_books do
    case BookManager.get_all() do
      nil ->
        {:error, "No hay libros registrados"}
      books ->
        {:ok, books}
    end
  end
end
