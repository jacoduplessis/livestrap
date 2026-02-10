defmodule Livestrap.Components.ProgressTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Progress

  test "renders progress bar" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_progress value={50} />
      """)

    assert html =~ "progress"
    assert html =~ "progress-bar"
    assert html =~ "width: 50%"
    assert html =~ ~s(aria-valuenow="50")
  end

  test "renders with label" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_progress value={75} label="75%" />
      """)

    assert html =~ "75%"
  end

  test "renders with variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_progress value={50} variant="success" />
      """)

    assert html =~ "bg-success"
  end

  test "renders striped" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_progress value={50} striped />
      """)

    assert html =~ "progress-bar-striped"
  end

  test "renders animated" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_progress value={50} striped animated />
      """)

    assert html =~ "progress-bar-animated"
  end
end
