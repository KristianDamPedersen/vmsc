defmodule Browservm.Vms.Vm do
  use Ash.Resource,
    domain: Browservm.Vms,
    data_layer: Ash.DataLayer.Ets

  attributes do
    uuid_primary_key :id
    attribute :machine_name, :string, allow_nil?: false
    attribute :ami_id, :string, allow_nil?: false
    attribute :ip_addr, :string
    attribute :status, :atom do
      default :requested
      # :one_of [:requested]
    end
    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  actions do
    defaults [:read]

    @doc """
    Creates the initial VM entry in the database.
    """
    create :create do
      accept [:machine_name, :ami_id, :ip_addr]
    end

    @doc """
    Requests the creation of a new vm.
    """
    create :request_new_vm do
      accept [:machine_name, :ami_id]
      primary? true # Marks this action as the default create action
      manual Browservm.Vms.Vm.RequestVm
    end
  end

  defmodule RequestVm do
    @moduledoc """
    Custom logic for requesting a virtual machine to be created. Used by the :request_vm_action of the `BrowserVm.Vms.Vm`resource.
    This module should not be invoked directly.
    """
    use Ash.Resource.ManualCreate

    def create(changeset, _, _) do
      # TODO: Add the code for requesting / validating the VM here
      IO.puts("UNIMPLEMENTED: Requesting VM creation...")

      record = Browservm.Vms.Vm
      |> Ash.Changeset.for_create(:create, %{
        machine_name: changeset.attributes.machine_name,
        ami_id: changeset.attributes.ami_id,
        ip_addr: "192.168.1.1",
      })
      |> Ash.create!()

      # TODO: Broadcast creation here to notify subscribers
      Phoenix.PubSub.broadcast(Browservm.PubSub, "vms", :new_vm)

      {:ok, record}
    end

  end
end
