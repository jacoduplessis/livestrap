defmodule Livestrap.Components.Accordion do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  attr :id, :string, required: true
  attr :flush, :boolean, default: false
  attr :always_open, :boolean, default: false
  attr :rest, :global

  slot :item, required: true do
    attr :heading, :string, required: true
    attr :open, :boolean
  end

  def bs_accordion(assigns) do
    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "accordion",
          assigns.flush && "accordion-flush"
        ])
      )

    ~H"""
    <div class={@class} id={@id} {@rest}>
      <div :for={{item, idx} <- Enum.with_index(@item)} class="accordion-item">
        <h2 class="accordion-header">
          <button
            class={["accordion-button", !item[:open] && "collapsed"]}
            type="button"
            data-bs-toggle="collapse"
            data-bs-target={"##{@id}-collapse-#{idx}"}
            aria-expanded={to_string(!!item[:open])}
            aria-controls={"#{@id}-collapse-#{idx}"}
          >
            {item[:heading]}
          </button>
        </h2>
        <div
          id={"#{@id}-collapse-#{idx}"}
          class={["accordion-collapse collapse", item[:open] && "show"]}
          data-bs-parent={!@always_open && "##{@id}"}
        >
          <div class="accordion-body">
            {render_slot(item)}
          </div>
        </div>
      </div>
    </div>
    """
  end
end
