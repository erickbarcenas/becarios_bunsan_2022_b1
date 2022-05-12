defmodule BecariosBunsan2022B1.MixProject do
  use Mix.Project

  def project do
    [
      app: :becarios_bunsan_2022_b1,
      version: "0.1.0",
      elixir: "~> 1.13",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {BecariosBunsan.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:excoveralls, "~> 0.10", only: :test},
      {:sweet_xml, "~> 0.7.2"},
      {:libgraph, "~> 0.13.3"},
      # {:httpotion, "~> 3.1.0"},
      {:poison, "~> 5.0"},
      {:tzdata, "~> 1.1"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},
      {:jason, ">= 1.0.0"},
      {:amqp, "~> 3.1"}
    ]
  end
end
