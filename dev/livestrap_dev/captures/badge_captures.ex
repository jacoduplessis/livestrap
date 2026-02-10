defmodule LivestrapDev.Captures.BadgeCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Badge

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

  def badge(assigns) do
    ~H"""
    <Badge.bs_badge variant={@variant}>
      {String.capitalize(@variant)}
    </Badge.bs_badge>
    """
  end

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"}
  ]

  def badge_pill(assigns) do
    ~H"""
    <Badge.bs_badge variant={@variant} pill>
      Pill {String.capitalize(@variant)}
    </Badge.bs_badge>
    """
  end
end
