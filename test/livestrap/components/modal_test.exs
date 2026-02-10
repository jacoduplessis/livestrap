defmodule Livestrap.Components.ModalTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Modal

  test "renders modal" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test">
        Modal content
      </.bs_modal>
      """)

    assert html =~ ~s(id="test-modal")
    assert html =~ "modal fade"
    assert html =~ "modal-dialog"
    assert html =~ "modal-content"
    assert html =~ "modal-header"
    assert html =~ "modal-body"
    assert html =~ "modal-title"
    assert html =~ "Test"
    assert html =~ "Modal content"
    assert html =~ "btn-close"
  end

  test "renders with footer" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test">
        Content
        <:footer>Footer content</:footer>
      </.bs_modal>
      """)

    assert html =~ "modal-footer"
    assert html =~ "Footer content"
  end

  test "renders with size" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" size="lg">
        Content
      </.bs_modal>
      """)

    assert html =~ "modal-lg"
  end

  test "renders centered" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" centered>
        Content
      </.bs_modal>
      """)

    assert html =~ "modal-dialog-centered"
  end

  test "renders scrollable" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" scrollable>
        Content
      </.bs_modal>
      """)

    assert html =~ "modal-dialog-scrollable"
  end

  test "renders static backdrop" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" static_backdrop>
        Content
      </.bs_modal>
      """)

    assert html =~ ~s(data-bs-backdrop="static")
    assert html =~ ~s(data-bs-keyboard="false")
  end

  test "renders fullscreen" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" fullscreen="always">
        Content
      </.bs_modal>
      """)

    assert html =~ "modal-fullscreen"
  end

  test "renders fullscreen with breakpoint" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_modal id="test-modal" title="Test" fullscreen="lg-down">
        Content
      </.bs_modal>
      """)

    assert html =~ "modal-fullscreen-lg-down"
  end
end
