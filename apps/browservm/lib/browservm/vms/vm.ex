defmodule Browservm.Vms.Vm do
  use Ash.Resource,
    domain: Browservm.Vms,
    data_layer: AshPostgres.DataLayer
  require Ash.Query

  postgres do
    table "vms"
    repo Browservm.Repo
  end
  attributes do
    attribute :machine_name, :string, allow_nil?: false, primary_key?: true
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
    defaults [:read, :destroy]

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

    destroy :request_remove_vm do
      accept [:machine_name, :ami_id]
      primary? true # Marks this action as the default destroy action
      manual Browservm.Vms.Vm.RemoveVm
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
      machine = changeset.attributes.machine_name

      # Check if VM exists
      vm = Browservm.Vms.Vm
      |> Ash.Query.filter(machine_name == ^machine)
      |> Ash.read_first!()
      IO.inspect(vm, label: "VM query response")
      case vm do
        nil ->
          case Browservm.Vms.Vm
          |> Ash.Changeset.for_create(:create, %{
            machine_name: machine,
            ami_id: changeset.attributes.ami_id,
            ip_addr: "192.168.1.1",
          })
          |> Ash.create() do
            {:ok, vm} ->
              # Broadcast creation here to notify subscribers
              Phoenix.PubSub.broadcast(Browservm.PubSub, "vms", :vm_state_change)

              {:ok, vm}
            {:error, reason} -> {:error, reason}
          end
        _ ->
          # VM already exists so we return error
          {:error, "VM already exists"}
      end
    end
  end

  defmodule RemoveVm do
    use Ash.Resource.ManualDestroy

    # BUG: Destroy on non-existent resource doesn't trigger an error

    @doc """
    Removes a VM. This function wraps the normal destroy function, with the nescessary logic to request the removal
    from Hetzner.
    """
    def destroy(changeset, _, _) do
      IO.inspect(changeset, label: "Changeset")

      # TODO: Add the code for deleting the VM
      IO.puts("UNIMPLEMENTED: Reqesting the deletion of the VM")

      # Call the actual delete on this
      vm = changeset.data
      |> Ash.Changeset.for_destroy(:destroy)
      |> Ash.destroy(return_destroyed?: true)

      # Broadcast state change
      Phoenix.PubSub.broadcast(Browservm.PubSub, "vms", :vm_state_change)

      IO.inspect(vm, label: "Destroyed VM")

      vm
    end
  end
end
