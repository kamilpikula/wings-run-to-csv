defmodule Mix.Tasks.Scrap do
  use Mix.Task

  @impl Mix.Task
  def run(arg) do
    year = List.first(arg)

    Application.ensure_all_started(:httpoison)
    WingsForLife.Fetch.fetch(1, year)
  end

end
