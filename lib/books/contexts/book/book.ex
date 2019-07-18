defmodule Books.Contexts.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias Books.Contexts.{Book, Review}

  @fields [:title, :cover]
  @required [:title, :cover]

  schema "books" do
    field :title, :string
    field :cover, :string
    has_many :reviews, Review

    timestamps()
  end

  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end