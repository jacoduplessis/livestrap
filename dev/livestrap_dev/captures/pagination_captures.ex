defmodule LivestrapDev.Captures.PaginationCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Pagination

  capture()

  def pagination(assigns) do
    ~H"""
    <Pagination.bs_pagination>
      <:item href="#" disabled>Previous</:item>
      <:item href="#">1</:item>
      <:item href="#" active>2</:item>
      <:item href="#">3</:item>
      <:item href="#">Next</:item>
    </Pagination.bs_pagination>
    """
  end

  attr :size, :string, default: "sm"

  capture variants: [
    small: %{size: "sm"},
    large: %{size: "lg"}
  ]

  def pagination_sizes(assigns) do
    ~H"""
    <Pagination.bs_pagination size={@size}>
      <:item href="#">1</:item>
      <:item href="#" active>2</:item>
      <:item href="#">3</:item>
    </Pagination.bs_pagination>
    """
  end

  attr :align, :string, default: "center"

  capture variants: [
    center: %{align: "center"},
    end: %{align: "end"}
  ]

  def pagination_aligned(assigns) do
    ~H"""
    <Pagination.bs_pagination align={@align}>
      <:item href="#">Previous</:item>
      <:item href="#">1</:item>
      <:item href="#" active>2</:item>
      <:item href="#">3</:item>
      <:item href="#">Next</:item>
    </Pagination.bs_pagination>
    """
  end
end
