defmodule Livestrap.Components.Breadcrumb do
  use Phoenix.Component

  attr :label, :string, default: "breadcrumb"
  attr :divider, :string, default: nil
  attr :rest, :global

  slot :item, required: true do
    attr :href, :string
    attr :active, :boolean
  end

  def bs_breadcrumb(assigns) do
    ~H"""
    <nav aria-label={@label} {@rest}>
      <ol class="breadcrumb" style={@divider && "--bs-breadcrumb-divider: '#{@divider}';"}>
        <li :for={item <- @item} class={["breadcrumb-item", item[:active] && "active"]}>
          <a :if={!item[:active] && item[:href]} href={item[:href]}>
            {render_slot(item)}
          </a>
          <span :if={item[:active] || !item[:href]}>
            {render_slot(item)}
          </span>
        </li>
      </ol>
    </nav>
    """
  end
end
