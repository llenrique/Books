defmodule BooksWeb.ReviewControllerTest do
    use BooksWeb.ConnCase

    import Books.Factory

    @review_test %{
        "review" => %{"content" => "Buen codigo"}
    }

    @invalid_review_test %{
        "review" => %{"content" => ""}
    }
    
    test "create/2 Agrega un review", %{conn: conn} do
        book = insert(:book)
        review_params = Map.put(@review_test, "book_id", book.id)
        conn = post(conn, Routes.review_path(conn, :create, book.id, review_params))

        assert redirected_to(conn) =~ "/show/#{book.id}"
    end
    
    test "create/2 Falla al agregar un review", %{conn: conn} do
        book = insert(:book)
        review_params = Map.put(@invalid_review_test, "book_id", book.id)
        conn = post(conn, Routes.review_path(conn, :create, book.id, review_params))

        assert get_flash(conn, :error) == "No se pudo agregar el review"
    end
end