defmodule Books.Repo.Migrations.CreatesBookTable do
  use Ecto.Migration

  def up do
    create table ("books") do
      add :title, :string
      add :author, :string
      add :cover, :text

      timestamps()
    end
  end

  def down do
    drop table("books")
  end
end
