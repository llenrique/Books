defmodule Books.Helpers.ReviewHelper do
  @moduledoc """
  Construye los parametros de un review y los persiste
  """

  alias Books.Contexts.ReviewManager

  @doc """
  Agrega un review a un libro
  """
  @spec add_review(map) :: atom
  def add_review(%{"book_id" => book_id, "review" => review}) do
    with %{"content" => content} <- review,
        {:ok, _} <- ReviewManager.create(%{book_id: book_id, content: content}) do
      :ok
    else
      {:error, _} -> :error
    end
  end
end
