defmodule Books.Contexts.Book do
  @moduledoc """
  Define la estructura inicial de un libro
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Books.Contexts.{Book, Review}

  @fields [:title, :author, :cover]
  @required [:title, :author, :cover]

  schema "books" do
    field :title, :string
    field :author, :string
    field :cover, :string
    has_many :reviews, Review

    timestamps()
  end

  @doc """
  Changeset para un libro
  """
  @spec changeset(map, list) :: Ecto.Changeset
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end
