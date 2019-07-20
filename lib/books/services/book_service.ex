defmodule Books.Services.BookService do

  import Base
  
  def build_book_cover(%{"cover" => cover} = map) do
    %{path: path} = cover
    {:ok, imageData} = File.read(path)
    base64data = "data:image/jpg;base64,#{encode64(imageData)}"
  end
end