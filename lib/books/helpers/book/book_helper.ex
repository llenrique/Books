defmodule Books.Helpers.BookHelper do

  @moduledoc """
  Provee la logica para administrar libros
  """
  
  alias Books.Contexts.BookManager
  alias Books.Services.BookService
  
  def save_book(map) do
    with \
      cover <- BookService.build_book_cover(map),
      %{"title" => title} <- map,
      %{"author" => author} <- map
    do
      BookManager.create(%{title: title, cover: cover, author: author})
    end
  end

  def get_book(id) do
    case BookManager.get_by_id(id) do
      book ->
        book
      _ ->
        {:error, "Book not found"}
    end
  end
end