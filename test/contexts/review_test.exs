defmodule Books.Contexts.ReviewTest do
  use Books.DataCase
  alias Books.Contexts.Review

  @valid_attrs %{
    content: "Un excelete libro de montañas y vampiros...",
    book_id: 1
  }

  test "chaneset/2 valida los datos de un review" do
    valid_review = Review.changeset(%Review{}, @valid_attrs)

    assert valid_review.valid? == :true
  end
end