defmodule Books.Contexts.ReviewManager do
  @moduledoc """
  Modulo para crear reviews de un libro
  """
  
  import Ecto.Query

  alias Books.Repo
  alias Books.Contexts.Review

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