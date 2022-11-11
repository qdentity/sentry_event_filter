# Sentry Event Filter

This repo contains a sample `sentry_event_filter.ex` file with the necessary exceptions. To activate it in a new app,
configure it as follows in `config.exs` (with the desired `included_environments` and `environment_name`):

```
# Configure sentry exclusions
config :sentry,
  filter: ModuleWeb.SentryEventFilter,
  included_environments: ~w(production development staging),
  environment_name: System.get_env("RELEASE_LEVEL") || "development"
```

