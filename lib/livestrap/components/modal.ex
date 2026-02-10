defmodule Livestrap.Components.Modal do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  attr :id, :string, required: true
  attr :title, :string, default: nil
  attr :size, :string, default: nil, values: [nil, "sm", "lg", "xl"]
  attr :centered, :boolean, default: false
  attr :scrollable, :boolean, default: false
  attr :static_backdrop, :boolean, default: false
  attr :fullscreen, :string, default: nil, values: [nil, "always", "sm-down", "md-down", "lg-down", "xl-down", "xxl-down"]
  attr :rest, :global

  slot :inner_block, required: true
  slot :footer

  def bs_modal(assigns) do
    assigns =
      assign(assigns, :dialog_class,
        ClassBuilder.build([
          "modal-dialog",
          assigns.size && "modal-#{assigns.size}",
          assigns.centered && "modal-dialog-centered",
          assigns.scrollable && "modal-dialog-scrollable",
          fullscreen_class(assigns.fullscreen)
        ])
      )

    ~H"""
    <div
      class="modal fade"
      id={@id}
      tabindex="-1"
      aria-labelledby={"#{@id}-label"}
      aria-hidden="true"
      data-bs-backdrop={@static_backdrop && "static"}
      data-bs-keyboard={@static_backdrop && "false"}
      {@rest}
    >
      <div class={@dialog_class}>
        <div class="modal-content">
          <div :if={@title} class="modal-header">
            <h5 class="modal-title" id={"#{@id}-label"}>{@title}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            </button>
          </div>
          <div class="modal-body">
            {render_slot(@inner_block)}
          </div>
          <div :if={@footer != []} class="modal-footer">
            {render_slot(@footer)}
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp fullscreen_class(nil), do: nil
  defp fullscreen_class("always"), do: "modal-fullscreen"
  defp fullscreen_class(breakpoint), do: "modal-fullscreen-#{breakpoint}"
end
