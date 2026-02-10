defmodule Livestrap.Components.BreadcrumbTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Breadcrumb

  test "renders breadcrumb" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_breadcrumb>
        <:item href="/">Home</:item>
        <:item href="/lib">Library</:item>
        <:item active>Data</:item>
      </.bs_breadcrumb>
      """)

    assert html =~ ~s(aria-label="breadcrumb")
    assert html =~ "breadcrumb-item"
    assert html =~ ~s(href="/")
    assert html =~ "Home"
    assert html =~ "Data"
  end

  test "renders active item without link" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_breadcrumb>
        <:item href="/">Home</:item>
        <:item active>Current</:item>
      </.bs_breadcrumb>
      """)

    # Active item should not have an anchor tag
    assert html =~ ~r/<li[^>]*active[^>]*>.*<span>.*Current.*<\/span>/s
  end

  test "renders with custom divider" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_breadcrumb divider="/">
        <:item href="/">Home</:item>
        <:item active>Page</:item>
      </.bs_breadcrumb>
      """)

    assert html =~ "--bs-breadcrumb-divider"
  end
end
