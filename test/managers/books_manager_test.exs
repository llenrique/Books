defmodule Books.Contexts.BookManagerTest do
  use Books.DataCase
  alias Books.Contexts.{Book, BookManager}

  import Books.Factory

  @book_attrs %{
    title: "Hola",
    author: "Me",
    cover: "werwr45 // 1234f"
  }

  test "create/1 creates and insert a book" do
    {:ok, %Book{} = book} = BookManager.create(@book_attrs)
    assert @book_attrs = book
  end

  test "get_by_id/1 Regresa un libro buscando por su id" do
    inserted_book = insert(:book)

    result = BookManager.get_by_id(inserted_book.id)

    assert length([result]) == 1
  end
end
