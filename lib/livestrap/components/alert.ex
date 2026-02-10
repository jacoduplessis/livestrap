defmodule Livestrap.Components.Alert do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark)

  attr :variant, :string, default: "primary", values: @variants
  attr :dismissible, :boolean, default: false
  attr :rest, :global

  slot :heading
  slot :inner_block, required: true

  def bs_alert(assigns) do
    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "alert",
          "alert-#{assigns.variant}",
          assigns.dismissible && "alert-dismissible fade show"
        ])
      )

    ~H"""
    <div class={@class} role="alert" {@rest}>
      <h4 :if={@heading != []} class="alert-heading">
        {render_slot(@heading)}
      </h4>
      {render_slot(@inner_block)}
      <button :if={@dismissible} type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
      </button>
    </div>
    """
  end
end
