# Sentry Event Filter

This proejct provides a `Sentry Event Filter` with the necessary exceptions. To activate it in your project, do this:

Install the `sentry_event_filter` dependency by adding it to mix.exs as follows and running `mix deps.get`:
```

```

Configure the filter as follows (with any `included_environments` and `environment_name`):
```
# Configure sentry exclusions
config :sentry,
  filter: SentryEventFilter.SentryEventFilter,
  included_environments: ~w(production development staging),
  environment_name: System.get_env("RELEASE_LEVEL") || "development"
```

