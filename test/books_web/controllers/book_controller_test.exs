defmodule BooksWeb.BookControllerTest do
  use BooksWeb.ConnCase

  import Mock
  import Books.Factory

  alias Books.Services.BookService

  @book_params %{
    "title" => "Titulo del libro",
    "author" => "Enrique Lopez",
    "cover" => %{
      "path" => "/aqui/esta/mi/archivo"
    }
  }

  test "index/2 despliegue del formulario de nuevo libro", %{conn: conn} do
    conn = get(conn, "/new")
    assert html_response(conn, 200) =~ "Agregar un nuevo libro"
  end

  test "create/2 recibe los parametros para crear un libro", %{conn: conn} do
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
      conn = post(conn, Routes.book_path(conn, :create, @book_params))

      assert redirected_to(conn) =~ "/new"
    end
  end

  test "show/2 despliegue de un libro por su id", %{conn: conn} do
    book = insert(:book)
    conn = get(conn, Routes.book_path(conn, :show, book.id))

    assert html_response(conn, 200) =~ book.title
  end
end
