defmodule WingsForLife.Fetch do
  alias WingsForLife.{Data, Progress}

  @spec fetch(integer(), integer()) :: nil
  def fetch(actualPage \\ 1, year) do
    %{body: body} = HTTPoison.get!(url(actualPage, year))
    %{data: data, meta: meta} = Jason.decode!(body, keys: :atoms)
    Data.processing(data)
    meta(meta, year)
  end

  @spec url(integer(), integer()) :: binary()
  defp url(actualPage, year) do
    "https://www.wingsforlifeworldrun.com/api/v1/results/#{year}/?page=#{actualPage}"
  end

  @spec meta(atom | %{currentPage: integer(), lastPage: integer()}, integer()) :: nil
  defp meta(meta, year) do
    Progress.render(meta.currentPage, meta.lastPage)
    unless meta.currentPage == meta.lastPage do
      fetch(meta.currentPage + 1, year)
    end
  end
end
