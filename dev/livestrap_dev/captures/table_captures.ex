defmodule LivestrapDev.Captures.TableCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Table

  @sample_rows [
    %{id: 1, first: "Mark", last: "Otto", handle: "@mdo"},
    %{id: 2, first: "Jacob", last: "Thornton", handle: "@fat"},
    %{id: 3, first: "Larry", last: "Bird", handle: "@twitter"}
  ]

  capture()

  def table(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="default" rows={@rows}>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
      <:col :let={row} label="Handle">{row.handle}</:col>
    </Table.bs_table>
    """
  end

  attr :variant, :string, default: "primary"

  capture variants: [
    primary: %{variant: "primary"},
    secondary: %{variant: "secondary"},
    success: %{variant: "success"},
    danger: %{variant: "danger"},
    warning: %{variant: "warning"},
    info: %{variant: "info"},
    light: %{variant: "light"},
    dark: %{variant: "dark"}
  ]

  def table_variants(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="variants" rows={@rows} variant={@variant}>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
    </Table.bs_table>
    """
  end

  capture()

  def table_striped(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="striped" rows={@rows} striped>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
    </Table.bs_table>
    """
  end

  capture()

  def table_hover(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="hover" rows={@rows} hover>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
    </Table.bs_table>
    """
  end

  capture()

  def table_bordered(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="bordered" rows={@rows} bordered>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
    </Table.bs_table>
    """
  end

  capture()

  def table_small(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="small" rows={@rows} small striped>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
    </Table.bs_table>
    """
  end

  capture()

  def table_with_actions(assigns) do
    assigns = assign(assigns, :rows, @sample_rows)

    ~H"""
    <Table.bs_table id="actions" rows={@rows} hover>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="First">{row.first}</:col>
      <:col :let={row} label="Last">{row.last}</:col>
      <:action :let={row}>
        <a href={"#edit-#{row.id}"} class="link-primary me-2">Edit</a>
      </:action>
      <:action :let={row}>
        <a href={"#delete-#{row.id}"} class="link-danger">Delete</a>
      </:action>
    </Table.bs_table>
    """
  end

  capture()

  def table_responsive(assigns) do
    assigns =
      assign(assigns, :rows, [
        %{id: 1, a: "Cell", b: "Cell", c: "Cell", d: "Cell", e: "Cell", f: "Cell", g: "Cell"},
        %{id: 2, a: "Cell", b: "Cell", c: "Cell", d: "Cell", e: "Cell", f: "Cell", g: "Cell"}
      ])

    ~H"""
    <Table.bs_table id="responsive" rows={@rows} responsive="always" bordered>
      <:col :let={row} label="#">{row.id}</:col>
      <:col :let={row} label="Col A">{row.a}</:col>
      <:col :let={row} label="Col B">{row.b}</:col>
      <:col :let={row} label="Col C">{row.c}</:col>
      <:col :let={row} label="Col D">{row.d}</:col>
      <:col :let={row} label="Col E">{row.e}</:col>
      <:col :let={row} label="Col F">{row.f}</:col>
      <:col :let={row} label="Col G">{row.g}</:col>
    </Table.bs_table>
    """
  end
end
