defmodule Livestrap.Components.Table do
  use Phoenix.Component

  alias Livestrap.ClassBuilder

  @variants ~w(primary secondary success danger warning info light dark)

  @doc ~S"""
  Renders a table with Bootstrap 5 styling.

  ## Examples

      <.bs_table id="users" rows={@users}>
        <:col :let={user} label="id">{user.id}</:col>
        <:col :let={user} label="username">{user.username}</:col>
      </.bs_table>

      <.bs_table id="users" rows={@users} striped hover>
        <:col :let={user} label="Name">{user.name}</:col>
        <:action :let={user}>
          <a href={~p"/users/#{user.id}"}>Show</a>
        </:action>
      </.bs_table>
  """
  attr :id, :string, required: true
  attr :rows, :list, required: true
  attr :row_id, :any, default: nil, doc: "function for generating the row id"
  attr :row_click, :any, default: nil, doc: "function for handling phx-click on each row"
  attr :row_item, :any, default: &Function.identity/1, doc: "function for mapping each row before calling :col and :action slots"
  attr :variant, :string, default: nil, values: [nil | @variants]
  attr :striped, :boolean, default: false
  attr :striped_columns, :boolean, default: false
  attr :hover, :boolean, default: false
  attr :bordered, :boolean, default: false
  attr :borderless, :boolean, default: false
  attr :small, :boolean, default: false
  attr :responsive, :string, default: nil, values: [nil, "always", "sm", "md", "lg", "xl", "xxl"]
  attr :caption_top, :boolean, default: false
  attr :rest, :global

  slot :col, required: true do
    attr :label, :string
  end

  slot :action, doc: "slot for showing user actions in the last table column"

  def bs_table(assigns) do
    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    assigns =
      assign(assigns, :class,
        ClassBuilder.build([
          "table",
          assigns.variant && "table-#{assigns.variant}",
          assigns.striped && "table-striped",
          assigns.striped_columns && "table-striped-columns",
          assigns.hover && "table-hover",
          assigns.bordered && "table-bordered",
          assigns.borderless && "table-borderless",
          assigns.small && "table-sm",
          assigns.caption_top && "caption-top"
        ])
      )

    assigns = assign(assigns, :responsive_class, responsive_class(assigns.responsive))

    ~H"""
    <%= if @responsive_class do %>
      <div class={@responsive_class}>
        <table class={@class} {@rest}>
          <thead>
            <tr>
              <th :for={col <- @col}>{col[:label]}</th>
              <th :if={@action != []}>Actions</th>
            </tr>
          </thead>
          <tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
            <tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
              <td
                :for={col <- @col}
                phx-click={@row_click && @row_click.(row)}
                class={[@row_click && "hover:cursor-pointer"]}
              >
                {render_slot(col, @row_item.(row))}
              </td>
              <td :if={@action != []}>
                <span :for={action <- @action}>
                  {render_slot(action, @row_item.(row))}
                </span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    <% else %>
      <table class={@class} {@rest}>
        <thead>
          <tr>
            <th :for={col <- @col}>{col[:label]}</th>
            <th :if={@action != []}>Actions</th>
          </tr>
        </thead>
        <tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
          <tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
            <td
              :for={col <- @col}
              phx-click={@row_click && @row_click.(row)}
              class={[@row_click && "hover:cursor-pointer"]}
            >
              {render_slot(col, @row_item.(row))}
            </td>
            <td :if={@action != []}>
              <span :for={action <- @action}>
                {render_slot(action, @row_item.(row))}
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    <% end %>
    """
  end

  defp responsive_class(nil), do: nil
  defp responsive_class("always"), do: "table-responsive"
  defp responsive_class(breakpoint), do: "table-responsive-#{breakpoint}"
end
