defmodule Livestrap.Components.Badge do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark)

  attr :variant, :string, default: "primary", values: @variants
  attr :pill, :boolean, default: false
  attr :rest, :global

  slot :inner_block, required: true

  def bs_badge(assigns) do
    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "badge",
          "text-bg-#{assigns.variant}",
          assigns.pill && "rounded-pill"
        ])
      )

    ~H"""
    <span class={@class} {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end
end
