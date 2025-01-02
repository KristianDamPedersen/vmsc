defmodule Vms.VmsTest do
  use ExUnit.Case
  import ExUnitProperties
  alias Browservm.Vms


  describe "Creation" do
    setup do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(Browservm.Repo)
      Ecto.Adapters.SQL.Sandbox.allow(Browservm.Repo, self(), self())
      on_exit(fn -> Ecto.Adapters.SQL.Sandbox.checkin(Browservm.Repo) end)
      :ok
    end

    test "Can request the creation of a new vm" do
      {status, vm} = Vms.request_new_vm("test", "ami_id")
      assert :ok == status
      assert vm.machine_name == "test"
      assert vm.ami_id == "ami_id"
    end

    test "Fails if vm already exists" do
      _ = Vms.request_new_vm("test", "ami_id")
      {status, reason} = Vms.request_new_vm("test", "ami_id")
      assert :error == status
    end
  end

end
