defmodule Livestrap.Components.ButtonTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Button

  test "renders default button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button>Click me</.bs_button>
      """)

    assert html =~ ~s(class="btn btn-primary")
    assert html =~ "Click me"
    assert html =~ ~s(type="button")
  end

  test "renders with variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button variant="danger">Delete</.bs_button>
      """)

    assert html =~ "btn-danger"
  end

  test "renders outline variant" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button variant="primary" outline>Outline</.bs_button>
      """)

    assert html =~ "btn-outline-primary"
  end

  test "renders with size" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button size="sm">Small</.bs_button>
      """)

    assert html =~ "btn-sm"
  end

  test "renders disabled button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button disabled>Disabled</.bs_button>
      """)

    assert html =~ "disabled"
  end

  test "renders active button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button active>Active</.bs_button>
      """)

    assert html =~ "active"
  end

  test "renders submit type" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button type="submit">Submit</.bs_button>
      """)

    assert html =~ ~s(type="submit")
  end

  test "passes global attrs" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.bs_button phx-click="do_thing">Click</.bs_button>
      """)

    assert html =~ "phx-click"
    assert html =~ "do_thing"
  end
end
