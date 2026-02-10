defmodule Livestrap.Components.Spinner do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark)

  attr :type, :string, default: "border", values: ["border", "grow"]
  attr :variant, :string, default: nil, values: [nil | @variants]
  attr :size, :string, default: nil, values: [nil, "sm"]
  attr :label, :string, default: "Loading..."
  attr :rest, :global

  def bs_spinner(assigns) do
    base = "spinner-#{assigns.type}"

    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          base,
          assigns.size && "#{base}-sm",
          assigns.variant && "text-#{assigns.variant}"
        ])
      )

    ~H"""
    <div class={@class} role="status" {@rest}>
      <span class="visually-hidden">{@label}</span>
    </div>
    """
  end
end
