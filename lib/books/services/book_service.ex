defmodule Books.Services.BookService do

  @moduledoc """
  Se encarga de los detalles de la creación de un libro
  """

  import Base

  @doc """
  Convierte el contenido de un archivo de imagen JPG
  a una cadena de base64
  """
  @spec build_book_cover(map) :: String.t()
  def build_book_cover(%{"cover" => cover}) do
    %{content_type: content} = cover
    %{path: path} = cover
    {:ok, imageData} = File.read(path)
    "data:#{content};base64,#{encode64(imageData)}"
  end
end