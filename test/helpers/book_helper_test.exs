defmodule Book.Helpers.BookHelperTest do
  use Books.DataCase
  
  alias Books.Helpers.BookHelper
  alias Books.Services.BookService
  
  import Mock
  
  @book_params %{
    "title" => "Titulo del libro",
    "author" => "Enrique Lopez",
    "cover" => %{
      "path" => "/aqui/esta/mi/archivo"
    }
  }

  @saved_expected_book %{
    author: "Enrique Lopez",
    cover: "string_on_base64",
    title: "Titulo del libro"
  }

  test "save_book/1 guarda un libro en base de datos" do
    with_mocks([
      {
        BookService,
        [],
        [
          build_book_cover: fn _ ->
            "string_on_base64"
          end
        ]
      }
    ]) do
      {:ok, book_saved} = BookHelper.save_book(@book_params)
      assert @saved_expected_book = book_saved

      assert called BookService.build_book_cover(@book_params)
    end
  end
end