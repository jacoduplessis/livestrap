defmodule Livestrap.Components.CardTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Card

  test "renders card with body" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_card>
        <:body title="Card title">Content</:body>
      </.bs_card>
      """)

    assert html =~ "card"
    assert html =~ "card-body"
    assert html =~ "card-title"
    assert html =~ "Card title"
    assert html =~ "Content"
  end

  test "renders card with header and footer" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_card>
        <:header>Header</:header>
        <:body>Body</:body>
        <:footer>Footer</:footer>
      </.bs_card>
      """)

    assert html =~ "card-header"
    assert html =~ "Header"
    assert html =~ "card-footer"
    assert html =~ "Footer"
  end

  test "renders card with subtitle" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_card>
        <:body title="Title" subtitle="Subtitle">Content</:body>
      </.bs_card>
      """)

    assert html =~ "card-subtitle"
    assert html =~ "Subtitle"
  end

  test "renders card with top image" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_card img_top="/img.png" img_alt="Test">
        <:body>Content</:body>
      </.bs_card>
      """)

    assert html =~ "card-img-top"
    assert html =~ ~s(src="/img.png")
    assert html =~ ~s(alt="Test")
  end

  test "renders card with bottom image" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_card img_bottom="/img.png">
        <:body>Content</:body>
      </.bs_card>
      """)

    assert html =~ "card-img-bottom"
  end
end
