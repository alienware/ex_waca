defmodule ExWaca.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_waca,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:hackney, "~> 1.17"},
      {:jason, ">= 1.0.0"},
      {:mox, "~> 1.0", only: :test},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:tesla, "~> 1.4"},
    ]
  end
end
