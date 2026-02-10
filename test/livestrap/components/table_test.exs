defmodule Livestrap.Components.TableTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest
  import Phoenix.Component
  import Livestrap.Components.Table

  @rows [
    %{id: 1, name: "Alice"},
    %{id: 2, name: "Bob"}
  ]

  test "renders table with rows and columns" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows}>
        <:col :let={row} label="ID">{row.id}</:col>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ ~s(class="table")
    assert html =~ "<th>ID</th>"
    assert html =~ "<th>Name</th>"
    assert html =~ ~s(id="test")
    assert html =~ "Alice"
    assert html =~ "Bob"
  end

  test "renders with variant" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} variant="dark">
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-dark"
  end

  test "renders striped" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} striped>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-striped"
  end

  test "renders hover" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} hover>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-hover"
  end

  test "renders bordered" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} bordered>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-bordered"
  end

  test "renders small" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} small>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-sm"
  end

  test "renders responsive" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} responsive="always">
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ ~s(class="table-responsive")
  end

  test "renders responsive with breakpoint" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} responsive="lg">
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ "table-responsive-lg"
  end

  test "renders action slot" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows}>
        <:col :let={row} label="Name">{row.name}</:col>
        <:action :let={row}>
          <a href={"#edit-#{row.id}"}>Edit</a>
        </:action>
      </.bs_table>
      """)

    assert html =~ "<th>Actions</th>"
    assert html =~ ~s(href="#edit-1")
    assert html =~ ~s(href="#edit-2")
  end

  test "no actions header when no action slot" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows}>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    refute html =~ "Actions"
  end

  test "renders with row_id" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} row_id={&"user-#{&1.id}"}>
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ ~s(id="user-1")
    assert html =~ ~s(id="user-2")
  end

  test "renders with row_item mapper" do
    assigns = %{rows: [%{id: 1, data: %{name: "Alice"}}]}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} row_item={& &1.data}>
        <:col :let={data} label="Name">{data.name}</:col>
      </.bs_table>
      """)

    assert html =~ "Alice"
  end

  test "passes global attrs" do
    assigns = %{rows: @rows}

    html =
      rendered_to_string(~H"""
      <.bs_table id="test" rows={@rows} data-testid="my-table">
        <:col :let={row} label="Name">{row.name}</:col>
      </.bs_table>
      """)

    assert html =~ ~s(data-testid="my-table")
  end
end
