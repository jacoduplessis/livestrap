defmodule LivestrapDev.Captures.ButtonCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Button

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"},
    warning: %{variant: "warning"},
    info: %{variant: "info"},
    light: %{variant: "light"},
    dark: %{variant: "dark"},
    link: %{variant: "link"}
  ]

  def button(assigns) do
    ~H"""
    <Button.bs_button variant={@variant}>
      {String.capitalize(@variant)}
    </Button.bs_button>
    """
  end

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"}
  ]

  def button_outline(assigns) do
    ~H"""
    <Button.bs_button variant={@variant} outline>
      Outline {@variant}
    </Button.bs_button>
    """
  end

  attr :size, :string, default: "sm"

  capture variants: [
    small: %{size: "sm"},
    large: %{size: "lg"}
  ]

  def button_sizes(assigns) do
    ~H"""
    <Button.bs_button size={@size}>
      Size {@size}
    </Button.bs_button>
    """
  end

  capture()

  def button_disabled(assigns) do
    ~H"""
    <Button.bs_button disabled>Disabled button</Button.bs_button>
    """
  end

  capture()

  def button_active(assigns) do
    ~H"""
    <Button.bs_button active>Active button</Button.bs_button>
    """
  end
end
