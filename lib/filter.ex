defmodule SentryEventFilter.Filter do
  @moduledoc """
  This module defines exceptions to be excluded from sentry
  """
  @behaviour Sentry.EventFilter

  def exclude_exception(%Phoenix.Router.NoRouteError{}, _source), do: true

  def exclude_exception(%Phoenix.NotAcceptableError{}, _source), do: true

  def exclude_exception?(%Plug.CSRFProtection.InvalidCSRFTokenError{}, :plug), do: true

  def exclude_exception?(_exception, _source), do: false
end
