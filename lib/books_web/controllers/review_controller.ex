defmodule BooksWeb.ReviewController do
    use BooksWeb, :controller

    alias Books.Helpers.ReviewHelper

    def create(conn, params) do
        case ReviewHelper.add_review(params) do
            {:ok, _} ->
                conn
                |> redirect(to: Routes.book_path(conn, :show, params["book_id"]))
        end
    end
end