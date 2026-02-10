defmodule LivestrapDev.Captures.AlertCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Alert

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

  def alert(assigns) do
    ~H"""
    <Alert.bs_alert variant={@variant}>
      This is a {@variant} alert — check it out!
    </Alert.bs_alert>
    """
  end

  capture()

  def alert_dismissible(assigns) do
    ~H"""
    <Alert.bs_alert variant="warning" dismissible>
      This is a dismissible alert. Click the X to close it.
    </Alert.bs_alert>
    """
  end

  slot :heading
  slot :inner_block, required: true

  capture attributes: %{
    inner_block: "Content below the heading.",
    heading: %{inner_block: "Well done!"}
  }

  def alert_with_heading(assigns) do
    ~H"""
    <Alert.bs_alert variant="success">
      <:heading>{render_slot(@heading)}</:heading>
      {render_slot(@inner_block)}
    </Alert.bs_alert>
    """
  end
end
