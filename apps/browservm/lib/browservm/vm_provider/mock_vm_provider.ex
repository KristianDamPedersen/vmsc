defmodule Browservm.VmProvider.MockVmProvider do
  @moduledoc """
  Mock implementations, meant to be used for testing
  """
  @behaviour Browservm.VmProvider

  @impl true
  def create_virtual_machine() do
    {:ok, %{}}
  end

  @impl true
  def delete_virtual_machine() do
    :ok
  end

  @impl true
  def sleep_virtual_machine() do
    :ok
  end
end
