defmodule Browservm.Vms do
  use Ash.Domain

  resources do
    resource Browservm.Vms.Vm
  end
end
