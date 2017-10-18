defmodule Parseus.ResolveUtil do
  alias Parseus.Set

  def call(%Set{errors: [], output: output}), do: {:ok, output}
  def call(set), do: {:error, set}
end
