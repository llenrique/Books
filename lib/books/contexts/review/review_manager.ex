defmodule Books.Contexts.ReviewManager do
  @moduledoc """
  Modulo para crear reviews de un libro
  """

  alias Books.Contexts.Review
  alias Books.Repo

  def new, do: Review.changeset(%Review{}, %{})

  @doc """
  Crea un review para un libro
  """
  @spec create(map) :: Ecto.Changeset
  def create(fields \\ %{}) do
    %Review{}
    |> Review.changeset(fields)
    |> Repo.insert()
  end
end
