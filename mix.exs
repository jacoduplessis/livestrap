defmodule Livestrap.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/jacoduplessis/livestrap"

  def project do
    [
      app: :livestrap,
      version: @version,
      elixir: "~> 1.18",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Bootstrap 5 components for Phoenix LiveView",
      docs: docs()
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "dev"]
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ] ++ maybe_mod(Mix.env())
  end

  defp maybe_mod(:dev), do: [mod: {LivestrapDev.Application, []}]
  defp maybe_mod(_), do: []

  defp deps do
    [
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_html, "~> 4.0"},
      {:live_capture, "~> 0.2", only: :dev},
      {:phoenix, "~> 1.7", optional: true},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:plug_cowboy, "~> 2.7", only: :dev},
      {:jason, "~> 1.4", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE", ".formatter.exs"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: ["README.md"]
    ]
  end
end
