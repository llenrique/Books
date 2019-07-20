defmodule Books.Helpers.BookHelper do
  
  alias Books.Contexts.BookManager
  
  import Base

  def save_book(map) do
    with cover <- build_book_cover(map) do
      %{"title" => title} = map
      %{"author" => author} = map
      BookManager.create(%{title: title, cover: cover, author: author})
    end
  end


  def get_book(id) do
    case BookManager.get_by_id(id) do
      book ->
        IO.puts "Here"
        IO.inspect book
      _ ->
        {:error, "Book not found"}
    end
  end

  def build_book_cover(%{"cover" => cover} = map) do
    %{path: path} = cover
    {:ok, imageData} = File.read(path)
    base64data = "data:image/jpg;base64,#{encode64(imageData)}"
  end
end