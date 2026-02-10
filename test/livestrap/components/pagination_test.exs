defmodule Livestrap.Components.PaginationTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Pagination

  test "renders pagination" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_pagination>
        <:item href="#">1</:item>
        <:item href="#" active>2</:item>
        <:item href="#">3</:item>
      </.bs_pagination>
      """)

    assert html =~ "pagination"
    assert html =~ "page-item"
    assert html =~ "page-link"
  end

  test "renders active item" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_pagination>
        <:item href="#" active>1</:item>
      </.bs_pagination>
      """)

    assert html =~ "active"
    assert html =~ ~s(aria-current="page")
  end

  test "renders disabled item" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_pagination>
        <:item href="#" disabled>Prev</:item>
      </.bs_pagination>
      """)

    assert html =~ "disabled"
  end

  test "renders with size" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_pagination size="lg">
        <:item href="#">1</:item>
      </.bs_pagination>
      """)

    assert html =~ "pagination-lg"
  end

  test "renders with alignment" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_pagination align="center">
        <:item href="#">1</:item>
      </.bs_pagination>
      """)

    assert html =~ "justify-content-center"
  end
end
