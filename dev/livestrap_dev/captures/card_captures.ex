defmodule LivestrapDev.Captures.CardCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Card

  capture()

  def card(assigns) do
    ~H"""
    <div style="width: 18rem;">
      <Card.bs_card>
        <:body title="Card title" subtitle="Card subtitle">
          Some quick example text to build on the card title and make up the bulk of the card's content.
        </:body>
      </Card.bs_card>
    </div>
    """
  end

  capture()

  def card_with_header_footer(assigns) do
    ~H"""
    <div style="width: 18rem;">
      <Card.bs_card>
        <:header>Featured</:header>
        <:body title="Special title treatment">
          With supporting text below as a natural lead-in to additional content.
        </:body>
        <:footer>2 days ago</:footer>
      </Card.bs_card>
    </div>
    """
  end

  capture()

  def card_with_image(assigns) do
    ~H"""
    <div style="width: 18rem;">
      <Card.bs_card
        img_top="https://placehold.co/286x180?text=Card+Image"
        img_alt="Card image cap"
      >
        <:body title="Card title">
          Some quick example text to build on the card title.
        </:body>
      </Card.bs_card>
    </div>
    """
  end
end
