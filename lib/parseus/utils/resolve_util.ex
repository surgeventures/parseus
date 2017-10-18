defmodule Parseus.ResolveUtil do
  @moduledoc false

  alias Parseus.Set

  def call(%Set{errors: [], output: output}), do: {:ok, output}
  def call(set), do: {:error, set}
end
