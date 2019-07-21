defmodule Books.Helpers.ReviewHelperTest do
  use Books.DataCase

  alias Books.Helpers.ReviewHelper
  alias Books.Helpers.BookHelper

  import Books.Factory

  @valid_review_params %{
    "content" => "Este es un review"
  }

  @invalid_review_params %{
    "content" => :"12345"
  }

  test "add_review/1 Agrega un review a un libro" do
    inserted_book = insert(:book)
    params = %{"book_id" => inserted_book.id, "review" => @valid_review_params}
    ReviewHelper.add_review(params)
    %{reviews: [review]} = BookHelper.get_book(inserted_book.id)

    assert review.content == "Este es un review"
  end

  test "add_review/1 Falla al agregar un review a un libro" do
    inserted_book = insert(:book)
    params = %{"book_id" => inserted_book.id, "review" => @invalid_review_params}
    result = ReviewHelper.add_review(params)

    assert result == :error
  end
end
