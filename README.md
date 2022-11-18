# Sentry Event Filter

This project provides a `Sentry Event Filter` with the necessary exceptions. To activate it in your project, do this:

1. Install the `sentry_event_filter` dependency by adding it to mix.exs as follows and running `mix deps.get`:
```
{:sentry_event_filter, github: "qdentity/sentry_event_filter"}
```

2. Create a custom module in your app that uses `SentryEventFilter` dependency:
```
defmodule ModuleWeb.SentryEventFilter do
  @behaviour Sentry.EventFilter

  # Here you can define your custom handlers, for example:
  def exclude_exception?(%ModuleWeb.PageNotFoundError{}, :plug), do: true
  def exclude_exception?(%Plug.Parsers.ParseError{}, _), do: true

  # The last handler needs to use SentryEventFilter
  def exclude_exception?(ex, source), do: SentryEventFilter.Filter.exclude_exception?(ex, source)
end
```

3. Configure the filter as follows (with any `included_environments` and `environment_name`):
```
# Configure sentry exclusions
config :sentry,
  filter: ModuleWeb.SentryEventFilter,
  included_environments: ~w(production development staging),
  environment_name: System.get_env("RELEASE_LEVEL") || "development"
```

