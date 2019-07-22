defmodule BooksWeb.PageControllerTest do
  use BooksWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Books"
  end
end
