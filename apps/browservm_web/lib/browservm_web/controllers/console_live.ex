defmodule BrowservmWeb.ConsoleLive do
  @moduledoc """
  The liveview responsible for the console. This is the view where an operator can keep track of their live machines,
  request new ones and remove old ones.
  """
  use BrowservmWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="h-full w-full flex justify-center">
      <div class="w-full h-full max-w-6xl px-8 py-8">
      <div class="w-full max-w-2xl gap-x-2 justify-between flex">
        <h1 class="font-bold text-xl">Dine maskiner:</h1>
        <div>
          <button class="rounded-lg bg-indigo-500 px-2 py-1 text-indigo-100 hover:bg-indigo-700">Slet alle maskiner</button>
          <button class="rounded-lg bg-indigo-500 px-2 py-1 text-indigo-100 hover:bg-indigo-700">Tilføj maskiner</button>
        </div>
      </div>
      <ul class="w-full max-w-2xl">
        <.render_vm machine_id="1" />
        <.render_vm machine_id="2" />
        <.render_vm machine_id="3" />
        <.render_vm machine_id="4" />
      </ul>
      </div>
    </div>
    """
  end

  # TODO: List items for individual VMs might make more sense as a live component
  def render_vm(assigns) do
    ~H"""
    <li class="my-2">
    <div class="bg-slate-100 px-2 py-1 rounded-lg transition hover:bg-indigo-200 flex justify-between">
      <p>M#{@machine_id}</p>
      <p>192.168.1.23</p>
      <p>Running</p>
      <button><span aria-hidden="true">&rarr;</span></button>
    </div>
    </li>
    """
  end
end
