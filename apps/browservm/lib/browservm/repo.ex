defmodule Browservm.Repo do
  use AshPostgres.Repo, otp_app: :browservm

  def installed_extensions do
    # Ash installs some functions that it nees to run the first time you generate migrations
    ["ash-functions"]
  end
end
