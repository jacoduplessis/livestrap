defmodule Livestrap.Components.Progress do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark)

  attr :value, :integer, default: 0
  attr :min, :integer, default: 0
  attr :max, :integer, default: 100
  attr :label, :string, default: nil
  attr :variant, :string, default: nil, values: [nil | @variants]
  attr :striped, :boolean, default: false
  attr :animated, :boolean, default: false
  attr :rest, :global

  def bs_progress(assigns) do
    assigns =
      assign(assigns, :bar_class,
        ClassBuilder.build([
          "progress-bar",
          assigns.variant && "bg-#{assigns.variant}",
          assigns.striped && "progress-bar-striped",
          assigns.animated && "progress-bar-animated"
        ])
      )

    ~H"""
    <div class="progress" role="progressbar" aria-valuenow={@value} aria-valuemin={@min} aria-valuemax={@max} {@rest}>
      <div class={@bar_class} style={"width: #{@value}%"}>
        {@label}
      </div>
    </div>
    """
  end
end
