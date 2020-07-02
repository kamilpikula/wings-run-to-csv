defmodule Mix.Tasks.Scrap do
  use Mix.Task

  @impl Mix.Task
  def run(arg) do
    year = List.first(arg) |> String.to_integer()

    Application.ensure_all_started(:httpoison)
    WingsForLife.Fetch.fetch(year)
  end

end
