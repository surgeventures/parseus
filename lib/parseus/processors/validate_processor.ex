defmodule Parseus.ValidateProcessor do
  @moduledoc false

  alias Parseus.{
    CallUtil,
    Error,
    Set,
  }

  def call(set, keys, validator, opts) when is_list(keys) do
    Enum.reduce(keys, set, &call(&2, &1, validator, opts))
  end
  def call(set = %Set{output: output}, key, validator, opts) do
    with {:ok, old_value} <- Keyword.fetch(output, key) do
      validator
      |> CallUtil.call(old_value, opts)
      |> handle_result(set, key, validator)
    else
      _ -> set
    end
  end

  defp handle_result(:ok, set, _, _) do
    set
  end
  defp handle_result(:error, set, key, validator) do
    put_error(set, key, source: validator)
  end
  defp handle_result({:error, reason}, set, key, validator) do
    put_error(set, key, source: validator, reason: reason)
  end
  defp handle_result({:error, reason, info}, set, key, validator) do
    put_error(set, key, source: validator, reason: reason, info: info)
  end

  defp put_error(set = %Set{errors: errors}, key, attrs) do
    new_error = Error.build(attrs)
    new_errors = [{key, new_error} | errors]

    %{set | errors: new_errors}
  end
end
