defmodule Livestrap do
  @moduledoc """
  Bootstrap 5 components for Phoenix LiveView.

  `use Livestrap` imports all component modules so you can use them
  directly in your HEEx templates:

      use Livestrap

      ~H\"\"\"
      <.bs_button variant="primary">Click me</.bs_button>
      <.bs_alert variant="success" dismissible>Saved!</.bs_alert>
      \"\"\"
  """

  defmacro __using__(_opts) do
    quote do
      import Livestrap.Components.Alert
      import Livestrap.Components.Accordion
      import Livestrap.Components.Badge
      import Livestrap.Components.Breadcrumb
      import Livestrap.Components.Button
      import Livestrap.Components.Card
      import Livestrap.Components.Modal
      import Livestrap.Components.Pagination
      import Livestrap.Components.Progress
      import Livestrap.Components.Spinner
      import Livestrap.Components.Table
    end
  end
end
