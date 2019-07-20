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


  def build_book_cover(%{"cover" => cover} = map) do
    %{path: path} = cover
    {:ok, imageData} = File.read(path)
    base64data = "data:image/png;base64,#{encode64(imageData)}"
  end
end 