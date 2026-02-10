defmodule LivestrapDev.Captures.ProgressCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Progress

  attr :value, :integer, default: 0

  capture variants: [
    "0%": %{value: 0},
    "25%": %{value: 25},
    "50%": %{value: 50},
    "75%": %{value: 75},
    "100%": %{value: 100}
  ]

  def progress(assigns) do
    ~H"""
    <Progress.bs_progress value={@value} />
    """
  end

  attr :value, :integer, default: 50

  capture()

  def progress_with_label(assigns) do
    ~H"""
    <Progress.bs_progress value={@value} label={"#{@value}%"} />
    """
  end

  attr :variant, :string, default: "success"

  capture variants: [
    success: %{variant: "success"},
    info: %{variant: "info"},
    warning: %{variant: "warning"},
    danger: %{variant: "danger"}
  ]

  def progress_variants(assigns) do
    ~H"""
    <Progress.bs_progress value={50} variant={@variant} />
    """
  end

  capture()

  def progress_striped(assigns) do
    ~H"""
    <Progress.bs_progress value={60} striped />
    """
  end

  capture()

  def progress_animated(assigns) do
    ~H"""
    <Progress.bs_progress value={75} striped animated />
    """
  end
end
