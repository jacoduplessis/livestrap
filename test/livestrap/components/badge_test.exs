defmodule Livestrap.Components.BadgeTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Badge

  test "renders default badge" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_badge>New</.bs_badge>
      """)

    assert html =~ "badge"
    assert html =~ "text-bg-primary"
    assert html =~ "New"
  end

  test "renders with variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_badge variant="danger">Alert</.bs_badge>
      """)

    assert html =~ "text-bg-danger"
  end

  test "renders pill badge" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_badge pill>Pill</.bs_badge>
      """)

    assert html =~ "rounded-pill"
  end
end
