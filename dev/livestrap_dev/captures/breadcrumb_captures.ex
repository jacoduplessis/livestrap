defmodule LivestrapDev.Captures.BreadcrumbCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Breadcrumb

  capture()

  def breadcrumb(assigns) do
    ~H"""
    <Breadcrumb.bs_breadcrumb>
      <:item href="#">Home</:item>
      <:item href="#">Library</:item>
      <:item active>Data</:item>
    </Breadcrumb.bs_breadcrumb>
    """
  end

  capture()

  def breadcrumb_custom_divider(assigns) do
    ~H"""
    <Breadcrumb.bs_breadcrumb divider="/">
      <:item href="#">Home</:item>
      <:item href="#">Components</:item>
      <:item active>Breadcrumb</:item>
    </Breadcrumb.bs_breadcrumb>
    """
  end
end
