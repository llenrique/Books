defmodule Books.BookFactory do
  alias Books.Contexts.Book

  defmacro __using__(_opts) do
    quote do
      def book_factory do
        %Book{
          title: "Test",
          author: "test",
          cover: "Testing"
        }
      end
    end
  end

end