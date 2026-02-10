defmodule Livestrap.Components.SpinnerTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Spinner

  test "renders border spinner" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_spinner />
      """)

    assert html =~ "spinner-border"
    assert html =~ ~s(role="status")
    assert html =~ "Loading..."
  end

  test "renders grow spinner" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_spinner type="grow" />
      """)

    assert html =~ "spinner-grow"
  end

  test "renders with variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_spinner variant="danger" />
      """)

    assert html =~ "text-danger"
  end

  test "renders small spinner" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_spinner size="sm" />
      """)

    assert html =~ "spinner-border-sm"
  end

  test "renders custom label" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_spinner label="Please wait..." />
      """)

    assert html =~ "Please wait..."
  end
end
