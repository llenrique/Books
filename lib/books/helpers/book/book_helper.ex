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
    with \
      cover <- BookService.build_book_cover(map),
      %{"title" => title} <- map,
      %{"author" => author} <- map
    do
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
        {:error, "Book not found"}
      book ->
        book
    end
  end
end