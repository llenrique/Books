defmodule Books.BookFactoy do
  alias Books.Context.Book

  defmacro __using__(_opts) do
    quote do
      def book_factory do
        %Book{
          title: "El Circo de Fenomenos",
          author: "Darren Shann",
          cover: "567ygvbhu7 // 456789yt"
        }
      end
    end
  end

end