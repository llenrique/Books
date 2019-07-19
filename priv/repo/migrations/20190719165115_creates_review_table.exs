defmodule Books.Repo.Migrations.CreatesReviewTable do
  use Ecto.Migration

  def up do
    create table("reviews") do
      add :content, :string
      add :book_id, references(:books)
      timestamps()
    end

    create index(:reviews, [:book_id])
  end

  def down do
    drop table("reviews")
  end
end
