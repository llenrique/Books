defmodule Books.Contexts.BookManagerTest do
  use Books.DataCase
  alias Books.Contexts.{BookManager, Book}

  @book_attrs %{
    title: "Hola",
    author: "Me",
    cover: "werwr45 // 1234f"
  }

  test "create/1 creates and insert a book" do
    {:ok, %Book{} = book} = BookManager.create(@book_attrs)
    assert @book_attrs = book
  end
end