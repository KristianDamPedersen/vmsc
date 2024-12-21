defmodule BrowservmWeb.HomeHTML do
  use BrowservmWeb, :html

  # embed_templates "home_html/*"

  def index(assigns) do
    ~H"""
    <div class="w-full h-full flex flex-col items-center justify-center">
        <h1 class="font-bold text-4xl">Forbind til din maskine</h1>
        <p class="font-extralight text-xl">Brug den kode du har fået udleveret</p>
        <%!-- <div class="w-full max-w-4xl flex gap-2 py-2"> --%>
        <div class="flex w-full px-10 gap-2 py-2 max-w-4xl">
        <input type="text" class="rounded-lg flex-grow" />
          <button class="rounded-lg bg-indigo-500 px-2 py-1 hover:bg-indigo-700 text-indigo-100 font-semibold font-sans">
          Forbind
          </button>
        </div>
    </div>
    """
  end
end
# class="rounded-lg bg-indigo-500 px-2 py-1 hover:bg-indigo-700"
