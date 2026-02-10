defmodule LivestrapDev.LiveCapture do
  use LiveCapture.Component

  breakpoints(s: "576px", m: "768px", l: "992px", xl: "1200px")
  root_layout({LivestrapDev.Layouts, :root})
end
