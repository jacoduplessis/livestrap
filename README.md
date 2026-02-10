# Livestrap

Bootstrap 5 components for Phoenix LiveView.

All components are prefixed with `bs_` to avoid naming conflicts with Phoenix builtins or your own components.

## Installation

Add `livestrap` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:livestrap, "~> 0.1.0"}
  ]
end
```

## Setup

Add `use Livestrap` to your app's HTML helpers so all components are available in your templates:

```elixir
defmodule MyAppWeb do
  def html do
    quote do
      use Phoenix.Component
      use Livestrap
      # ...
    end
  end
end
```

Or import individual component modules where needed:

```elixir
import Livestrap.Components.Button
import Livestrap.Components.Table
```

Make sure Bootstrap 5 CSS and JS are loaded in your layout (via CDN or your asset pipeline):

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
```

## Components

### Button

```heex
<.bs_button variant="primary">Click me</.bs_button>
<.bs_button variant="danger" outline>Delete</.bs_button>
<.bs_button variant="success" size="lg" type="submit">Save</.bs_button>
```

Attrs: `variant`, `outline`, `size` (sm/lg), `type`, `disabled`, `active`

### Alert

```heex
<.bs_alert variant="success">Saved successfully!</.bs_alert>
<.bs_alert variant="warning" dismissible>Watch out!</.bs_alert>
<.bs_alert variant="info">
  <:heading>Heads up!</:heading>
  Here is some additional info.
</.bs_alert>
```

Attrs: `variant`, `dismissible` | Slots: `inner_block`, `heading`

### Badge

```heex
<.bs_badge variant="primary">New</.bs_badge>
<.bs_badge variant="danger" pill>99+</.bs_badge>
```

Attrs: `variant`, `pill`

### Spinner

```heex
<.bs_spinner />
<.bs_spinner type="grow" variant="success" />
<.bs_spinner size="sm" label="Please wait..." />
```

Attrs: `type` (border/grow), `variant`, `size` (sm), `label`

### Progress

```heex
<.bs_progress value={75} />
<.bs_progress value={60} variant="success" striped animated label="60%" />
```

Attrs: `value`, `min`, `max`, `label`, `variant`, `striped`, `animated`

### Breadcrumb

```heex
<.bs_breadcrumb>
  <:item href="/">Home</:item>
  <:item href="/users">Users</:item>
  <:item active>Profile</:item>
</.bs_breadcrumb>
```

Attrs: `label`, `divider` | Slot: `item` (attrs: `href`, `active`)

### Pagination

```heex
<.bs_pagination>
  <:item href="#" disabled>Previous</:item>
  <:item href="/page/1">1</:item>
  <:item href="/page/2" active>2</:item>
  <:item href="/page/3">3</:item>
  <:item href="#">Next</:item>
</.bs_pagination>
```

Attrs: `label`, `size` (sm/lg), `align` (center/end) | Slot: `item` (attrs: `href`, `active`, `disabled`)

### Card

```heex
<.bs_card img_top="/photo.jpg" img_alt="A photo">
  <:header>Featured</:header>
  <:body title="Card title" subtitle="Subtitle">
    Some content here.
  </:body>
  <:footer>2 days ago</:footer>
</.bs_card>
```

Attrs: `img_top`, `img_bottom`, `img_alt` | Slots: `header`, `body` (attrs: `title`, `subtitle`), `footer`, `inner_block`

### Accordion

```heex
<.bs_accordion id="faq">
  <:item heading="Question 1" open>Answer 1</:item>
  <:item heading="Question 2">Answer 2</:item>
</.bs_accordion>
```

Attrs: `id`, `flush`, `always_open` | Slot: `item` (attrs: `heading`, `open`)

### Modal

```heex
<.bs_modal id="confirm" title="Are you sure?" centered>
  This action cannot be undone.
  <:footer>
    <.bs_button variant="secondary" data-bs-dismiss="modal">Cancel</.bs_button>
    <.bs_button variant="danger">Delete</.bs_button>
  </:footer>
</.bs_modal>
```

Attrs: `id`, `title`, `size` (sm/lg/xl), `centered`, `scrollable`, `static_backdrop`, `fullscreen` | Slots: `inner_block`, `footer`

### Table

```heex
<.bs_table id="users" rows={@users} striped hover>
  <:col :let={user} label="ID">{user.id}</:col>
  <:col :let={user} label="Name">{user.name}</:col>
  <:action :let={user}>
    <a href={"/users/#{user.id}/edit"}>Edit</a>
  </:action>
</.bs_table>
```

Attrs: `id`, `rows`, `row_id`, `row_click`, `row_item`, `variant`, `striped`, `striped_columns`, `hover`, `bordered`, `borderless`, `small`, `responsive`, `caption_top` | Slots: `col` (attr: `label`), `action`

Supports Phoenix LiveView streams via `phx-update="stream"`.

## Global Attributes

All components accept arbitrary HTML attributes via Phoenix's `:global` pattern:

```heex
<.bs_button variant="primary" phx-click="save" class="mt-3">Save</.bs_button>
<.bs_alert variant="info" id="notice" data-testid="alert">Info</.bs_alert>
```

## Development

Start the live_capture preview server:

```bash
iex -S mix
```

Visit http://localhost:4002 to browse all components with their variations.

## License

MIT
