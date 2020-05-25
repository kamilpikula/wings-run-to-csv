defmodule WingsForLife.Data do
  alias WingsForLife.CSV

  @spec read(list()) :: list()
  def read(data) do
    Enum.map(data, fn runner ->
    [
      runner.ranks.global.rank,
      runner.ranks.global.gender,
      runner.fullname,
      runner.startnumber,
      runner.nation,
      runner.category,
      runner.ranks.global.category,
      runner.distance,
    ] |> Enum.join(", ")
    end)
  end

  def processing(data) do
    data |> read() |> Enum.map(&CSV.save_csv/1)
  end
end
