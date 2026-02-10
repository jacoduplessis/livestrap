defmodule Livestrap.MixProject do
  use Mix.Project

  def project do
    [
      app: :livestrap,
      version: "0.1.0",
      elixir: "~> 1.18",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      {:phoenix, "~> 1.7"},
      {:plug_cowboy, "~> 2.7", only: :dev},
      {:jason, "~> 1.4", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE", ".formatter.exs"],
      licenses: ["MIT"],
      links: %{}
    ]
  end
end
