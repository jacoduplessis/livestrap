defmodule Livestrap.Components.AccordionTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Accordion

  test "renders accordion" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_accordion id="test-acc">
        <:item heading="Item 1" open>Content 1</:item>
        <:item heading="Item 2">Content 2</:item>
      </.bs_accordion>
      """)

    assert html =~ ~s(id="test-acc")
    assert html =~ "accordion"
    assert html =~ "accordion-item"
    assert html =~ "Item 1"
    assert html =~ "Content 1"
    assert html =~ "Content 2"
  end

  test "renders open item with show class" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_accordion id="test-acc">
        <:item heading="Open" open>Open content</:item>
      </.bs_accordion>
      """)

    assert html =~ "show"
    assert html =~ ~s(aria-expanded="true")
  end

  test "renders collapsed item" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_accordion id="test-acc">
        <:item heading="Closed">Closed content</:item>
      </.bs_accordion>
      """)

    assert html =~ "collapsed"
    assert html =~ ~s(aria-expanded="false")
  end

  test "renders flush accordion" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_accordion id="test-acc" flush>
        <:item heading="Item">Content</:item>
      </.bs_accordion>
      """)

    assert html =~ "accordion-flush"
  end

  test "renders always_open without parent" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_accordion id="test-acc" always_open>
        <:item heading="Item">Content</:item>
      </.bs_accordion>
      """)

    refute html =~ "data-bs-parent"
  end
end
