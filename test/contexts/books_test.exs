defmodule Books.Contexts.BookTest do
  use Books.DataCase
  alias Books.Contexts.Book

  @valid_attrs %{
    title: "La montaña de los vampiros",
    author: "Darren Shann",
    cover: "45678jni8 // tgy8huib"
  }

  test "changeset/2 valida los datos de un libro" do
    valid_changeset = Book.changeset(%Book{}, @valid_attrs)

    assert valid_changeset.valid? == :true
  end
end