defmodule Browservm.VmProvider do
  @moduledoc """
  The set of expected behaviours that should be available when interacting with a VmProvider.
  """

  @doc """
  Creates a virtual machine synchronously.
  Returns either {:ok, details (map)} or {:error, reason}.
  """
  @callback create_virtual_machine() :: {:ok, map()} | {:error, String.t()}

  @doc """
  Deletes a virtual machine, removing it and all its dependent resources.
  Returns eithe :ok or {:error, reason}
  """
  @callback delete_virtual_machine() :: :ok | {:error, String.t()}

end
