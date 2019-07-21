defmodule Books.Helpers.ReviewHelper do
    alias Books.Contexts.ReviewManager

    def add_review(%{"book_id" => book_id, "review" => review }) do
        %{"content" => content} = review
        ReviewManager.create(%{book_id: book_id, content: content})
    end
end