defmodule Livestrap.Components.Card do
  use Phoenix.Component

  attr :img_top, :string, default: nil
  attr :img_bottom, :string, default: nil
  attr :img_alt, :string, default: ""
  attr :rest, :global

  slot :header
  slot :body do
    attr :title, :string
    attr :subtitle, :string
  end
  slot :footer
  slot :inner_block

  def bs_card(assigns) do
    ~H"""
    <div class="card" {@rest}>
      <img :if={@img_top} src={@img_top} class="card-img-top" alt={@img_alt} />
      <div :if={@header != []} class="card-header">
        {render_slot(@header)}
      </div>
      <div :for={body <- @body} class="card-body">
        <h5 :if={body[:title]} class="card-title">{body[:title]}</h5>
        <h6 :if={body[:subtitle]} class="card-subtitle mb-2 text-body-secondary">{body[:subtitle]}</h6>
        {render_slot(body)}
      </div>
      {render_slot(@inner_block)}
      <div :if={@footer != []} class="card-footer">
        {render_slot(@footer)}
      </div>
      <img :if={@img_bottom} src={@img_bottom} class="card-img-bottom" alt={@img_alt} />
    </div>
    """
  end
end
