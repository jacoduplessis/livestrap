defmodule Livestrap.Components.AlertTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Alert

  test "renders default alert" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_alert>Hello</.bs_alert>
      """)

    assert html =~ ~s(class="alert alert-primary")
    assert html =~ ~s(role="alert")
    assert html =~ "Hello"
  end

  test "renders with variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_alert variant="danger">Error</.bs_alert>
      """)

    assert html =~ "alert-danger"
  end

  test "renders dismissible" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_alert dismissible>Dismissible</.bs_alert>
      """)

    assert html =~ "alert-dismissible"
    assert html =~ "btn-close"
    assert html =~ "data-bs-dismiss"
  end

  test "renders heading slot" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_alert variant="success">
        <:heading>Well done!</:heading>
        Content here.
      </.bs_alert>
      """)

    assert html =~ "alert-heading"
    assert html =~ "Well done!"
    assert html =~ "Content here."
  end
end
