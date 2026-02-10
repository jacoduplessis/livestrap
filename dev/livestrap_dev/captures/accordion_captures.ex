defmodule LivestrapDev.Captures.AccordionCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Accordion

  capture()

  def accordion(assigns) do
    ~H"""
    <Accordion.bs_accordion id="accordionExample">
      <:item heading="Accordion Item #1" open>
        <strong>This is the first item's accordion body.</strong>
        It is shown by default.
      </:item>
      <:item heading="Accordion Item #2">
        <strong>This is the second item's accordion body.</strong>
        It is hidden by default.
      </:item>
      <:item heading="Accordion Item #3">
        <strong>This is the third item's accordion body.</strong>
        It is hidden by default.
      </:item>
    </Accordion.bs_accordion>
    """
  end

  capture()

  def accordion_flush(assigns) do
    ~H"""
    <Accordion.bs_accordion id="accordionFlush" flush>
      <:item heading="Flush Item #1" open>
        Flush accordion content for item 1.
      </:item>
      <:item heading="Flush Item #2">
        Flush accordion content for item 2.
      </:item>
    </Accordion.bs_accordion>
    """
  end

  capture()

  def accordion_always_open(assigns) do
    ~H"""
    <Accordion.bs_accordion id="accordionAlwaysOpen" always_open>
      <:item heading="Always Open #1" open>
        This item stays open when other items are opened.
      </:item>
      <:item heading="Always Open #2" open>
        This item also starts open.
      </:item>
      <:item heading="Always Open #3">
        This item starts collapsed.
      </:item>
    </Accordion.bs_accordion>
    """
  end
end
