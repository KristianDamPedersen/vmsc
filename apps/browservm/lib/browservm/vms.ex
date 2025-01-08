defmodule Browservm.Vms do
  use Ash.Domain

  resources do
    resource Browservm.Vms.Vm do
      define :request_new_vm, args: [:machine_name, :ami_id], action: :request_new_vm
      define :request_remove_vm, action: :request_remove_vm
    end
  end
end
