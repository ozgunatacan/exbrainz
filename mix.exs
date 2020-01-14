defmodule Exbrainz.MixProject do
  use Mix.Project

  def project do
    [
      app: :exbrainz,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.github": :test
      ],
      description: description(),
      package: package(),
      name: "Exbrainz",
      source_url: "https://github.com/ozgunatacan/exbrainz"
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
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:exconstructor, "~> 1.1.0"},
      {:plug_cowboy, "~> 2.0", only: [:dev, :test]},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "Elixir client library for MusicBrainz web service."
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib config .formatter.exs mix.exs README*  LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ozgunatacan/exbrainz"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
