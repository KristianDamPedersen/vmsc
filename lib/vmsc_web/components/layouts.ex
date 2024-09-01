defmodule VmscWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use VmscWeb, :controller` and
  `use VmscWeb, :live_view`.
  """
  use VmscWeb, :html

  embed_templates "layouts/*"
end
