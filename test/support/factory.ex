defmodule Books.Factory do
  use ExMachina.Ecto, repo: Books.Repo

  use Books.BookFactory
end
