defmodule BooksWeb.ReviewController do
    use BooksWeb, :controller

    alias Books.Helpers.ReviewHelper

    def create(conn, params) do
        case ReviewHelper.add_review(params) do
            :ok ->
                conn
                |> redirect(to: Routes.book_path(conn, :show, params["book_id"]))
            :error ->
                conn
                |> put_flash(:error, "No se pudo agregar el review")
                |> redirect(to: Routes.book_path(conn, :show, params["book_id"]))
        end
    end
end