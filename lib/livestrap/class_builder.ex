defmodule Livestrap.ClassBuilder do
  @moduledoc """
  Utility for building CSS class strings from a list of parts.
  Filters out nil, false, and empty string values before joining.
  """

  @doc """
  Builds a CSS class string from a list of parts.

  ## Examples

      iex> Livestrap.ClassBuilder.build(["btn", "btn-primary", nil, false, ""])
      "btn btn-primary"

      iex> Livestrap.ClassBuilder.build(["alert", "alert-danger", "alert-dismissible"])
      "alert alert-danger alert-dismissible"
  """
  @spec build([String.t() | nil | false]) :: String.t()
  def build(parts) when is_list(parts) do
    parts
    |> Enum.filter(&filter_part/1)
    |> Enum.join(" ")
  end

  defp filter_part(nil), do: false
  defp filter_part(false), do: false
  defp filter_part(""), do: false
  defp filter_part(_), do: true
end
