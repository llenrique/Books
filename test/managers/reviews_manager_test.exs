defmodule Books.Contexts.ReviewManagerTest do
  use Books.DataCase
  alias Books.Contexts.{Review, ReviewManager}

  import Books.Factory

  @review_attrs %{
    content: "Un buen libro de montañas y vampiros..."
  }

  test "create/1 creates a review for a book" do
    book = insert(:book)
    valid_attrs = Map.put(@review_attrs, :book_id, book.id)

    {:ok, %Review{} = i_review} = ReviewManager.create(valid_attrs)
    
    assert @review_attrs = i_review
  end
end