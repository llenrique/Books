defmodule Book.Helpers.BookHelperTest do
  use Books.DataCase
  
  alias Books.Helpers.BookHelper
  
  import Mock
  
  @book_params %{
    "title" => "Titulo del libro",
    "author" => "Enrique Lopez",
    "cover" => %{
      path: "/aqui/esta/mi/archivo"
    }
  }

  test "save_book/1 guarda un libro en base de datos" do
    with_mocks([
      {
        BookHelper,
        [],
        [
          save_book: fn _ ->
            {:ok,  %Books.Contexts.Book{
              author: "Me",
              id: 3,
              inserted_at: ~N[2019-07-20 10:59:23],
              title: "Title",
              updated_at: ~N[2019-07-20 10:59:23]
            }
           }
          end,
          build_book_cover: fn _ ->
            "string_on_base64"
          end
        ]
      }
    ]) do
      book_saved = BookHelper.save_book(@book_params)
      IO.inspect book_saved
    end
  end
end