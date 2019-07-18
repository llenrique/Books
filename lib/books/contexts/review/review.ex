defmodule Books.Contexts.Review do
  use Ecto.Schema
  import Ecto.Changeset
  alias Books.Contexts.{Book, Review}

  @fields [:content, :book_id]
  @required [:content]

  schema "reviews" do
    field :content, :string
    belongs_to :book, Book

    timestamps()
  end

  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end