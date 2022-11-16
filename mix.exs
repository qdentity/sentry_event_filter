defmodule SentryEventFilter.MixProject do
  use Mix.Project

  def project do
    [
      app: :sentry_event_filter,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "SentryEventFilter",
      source_url: "https://github.com/qdentity/sentry_event_filter"
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
      {:phoenix, "~> 1.6.13"},
      {:sentry, "~> 8.0"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"}
    ]
  end
end
