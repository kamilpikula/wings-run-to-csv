defmodule Mix.Tasks.Scrap do
  use Mix.Task

  @shortdoc "Scrap the results"
  def run(_) do
    Application.ensure_all_started(:httpoison)
    WingsForLife.Fetch.fetch()
  end
end
