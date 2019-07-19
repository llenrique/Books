defmodule Books.Contexts.Review do

  @moduledoc """
  Define la estructura inicial de un review de un libro
  """

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

  @doc """
  Change set para un review
  """
  @spec changeset(map, list) :: Ecto.Changeset
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end