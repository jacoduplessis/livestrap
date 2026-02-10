defmodule Livestrap.Components.Pagination do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  attr :label, :string, default: "Page navigation"
  attr :size, :string, default: nil, values: [nil, "sm", "lg"]
  attr :align, :string, default: nil, values: [nil, "center", "end"]
  attr :rest, :global

  slot :item, required: true do
    attr :href, :string
    attr :active, :boolean
    attr :disabled, :boolean
  end

  def bs_pagination(assigns) do
    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "pagination",
          assigns.size && "pagination-#{assigns.size}",
          assigns.align && "justify-content-#{assigns.align}"
        ])
      )

    ~H"""
    <nav aria-label={@label} {@rest}>
      <ul class={@class}>
        <li
          :for={item <- @item}
          class={["page-item", item[:active] && "active", item[:disabled] && "disabled"]}
        >
          <a class="page-link" href={item[:href] || "#"} aria-current={item[:active] && "page"}>
            {render_slot(item)}
          </a>
        </li>
      </ul>
    </nav>
    """
  end
end
