defmodule LivestrapDev.Captures.SpinnerCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Spinner

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"},
    warning: %{variant: "warning"},
    info: %{variant: "info"},
    light: %{variant: "light"},
    dark: %{variant: "dark"}
  ]

  def spinner_border(assigns) do
    ~H"""
    <Spinner.bs_spinner variant={@variant} />
    """
  end

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"}
  ]

  def spinner_grow(assigns) do
    ~H"""
    <Spinner.bs_spinner type="grow" variant={@variant} />
    """
  end

  capture()

  def spinner_small(assigns) do
    ~H"""
    <Spinner.bs_spinner size="sm" /> <Spinner.bs_spinner type="grow" size="sm" />
    """
  end
end
