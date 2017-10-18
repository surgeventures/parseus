defmodule Parseus.AcceptanceValidator do
  @moduledoc false

  def call(true), do: :ok
  def call(false), do: :error
end
