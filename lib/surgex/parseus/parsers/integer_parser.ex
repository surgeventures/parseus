defmodule Surgex.Parseus.IntegerParser do
  @moduledoc false

  def call(input) when is_binary(input) do
    case Integer.parse(input) do
      {output, ""} ->
        {:ok, output}
      _ ->
        :error
    end
  end
end
