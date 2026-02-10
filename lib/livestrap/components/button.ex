defmodule Livestrap.Components.Button do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark link)

  attr :variant, :string, default: "primary", values: @variants
  attr :outline, :boolean, default: false
  attr :size, :string, default: nil, values: [nil, "sm", "lg"]
  attr :type, :string, default: "button", values: ["button", "submit", "reset"]
  attr :disabled, :boolean, default: false
  attr :active, :boolean, default: false
  attr :rest, :global

  slot :inner_block, required: true

  def bs_button(assigns) do
    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "btn",
          btn_variant_class(assigns.variant, assigns.outline),
          size_class(assigns.size),
          assigns.active && "active"
        ])
      )

    ~H"""
    <button type={@type} class={@class} disabled={@disabled} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp btn_variant_class(variant, true), do: "btn-outline-#{variant}"
  defp btn_variant_class(variant, _), do: "btn-#{variant}"

  defp size_class("sm"), do: "btn-sm"
  defp size_class("lg"), do: "btn-lg"
  defp size_class(_), do: nil
end
