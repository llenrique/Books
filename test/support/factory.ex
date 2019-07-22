defmodule Books.Factory do
  @moduledoc """
  Proevee elementos prefabricados para los tests
  """
  use ExMachina.Ecto, repo: Books.Repo

  use Books.BookFactory
end
