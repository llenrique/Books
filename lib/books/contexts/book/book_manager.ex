defmodule Books.Contexts.BookManager do
  @moduledoc """
  Provee un CRUD de libros
  """
  
  import Ecto.Query

  alias Books.Repo
  alias Books.Contexts.Book

  @doc """
  Crea un libro
  """
  @spec create(map) :: Ecto.Changeset
  def create(fields \\ %{}) do
    %Book{}
    |> Book.changeset(fields)
    |> IO.inspect
    |> Repo.insert
  end
end