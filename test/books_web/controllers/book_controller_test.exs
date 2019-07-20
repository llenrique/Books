defmodule BooksWeb.BookControllerTest do
  use BooksWeb.ConnCase

  test "index/2 despliegue del formulario de nuevo libro", %{conn: conn} do
    conn = get(conn, "/new")
    assert html_response(conn, 200) =~ "Agregar un nuevo libro"
  end
end