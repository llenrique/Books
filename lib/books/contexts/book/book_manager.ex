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
    |> Repo.insert()
  end

  @doc """
  Regresa un libro buscando por su id
  """
  @spec get_by_id(integer) :: Ecto.Changeset
  def get_by_id(id) do
    Book
    |> preload(:reviews)
    |> Repo.get!(id)
  end

  @doc """
  Regresa todos los libros registrados
  """
  @spec get_all() :: list
  def get_all do
    Book
    |> Repo.all()
  end
end
