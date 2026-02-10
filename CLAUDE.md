# Livestrap

Bootstrap 5 components for Phoenix LiveView. All components are prefixed with `bs_` to avoid naming conflicts.

## Key Commands

- `mix compile` — compile the library
- `mix test` — run tests
- `iex -S mix` — start dev server on http://localhost:4002 with live_capture preview
- `MIX_ENV=test mix compile` — compile without dev app

## Project Structure

- `lib/livestrap/components/` — component modules (one per file)
- `lib/livestrap/class_builder.ex` — shared CSS class builder utility
- `lib/livestrap.ex` — `use Livestrap` macro that imports all components
- `dev/` — dev-only live_capture preview app (not included in hex package)
- `dev/livestrap_dev/captures/` — capture modules for live_capture previews
- `test/livestrap/components/` — one test file per component

## Conventions

- Components use `ClassBuilder.build/1` for CSS class assembly
- All components accept `rest: :global` for arbitrary HTML attrs
- Capture variants use `capture variants: [name: %{attr: "value"}]` (never combine `default:` and `examples:` in capture attrs due to live_capture limitation)

## Git

- Never add Co-Authored-By or sign-off lines to commits or PRs
