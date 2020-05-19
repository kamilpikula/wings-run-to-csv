defmodule WingsForLife.Fetch do
  alias WingsForLife.{Data, Progress}

  def fetch(actualPage \\ 1) do
    %{body: body} = HTTPoison.get!(url(actualPage))
    %{data: data, meta: meta} = Jason.decode!(body, keys: :atoms)
    Data.data(data)
    meta(meta)
  end

  def url(actualPage) do
    "https://www.wingsforlifeworldrun.com/api/v1/results/2020/?page=#{actualPage}"
  end

  def meta(meta) do
    Progress.render(meta.currentPage, meta.lastPage)
    unless meta.currentPage == meta.lastPage do
      fetch(meta.currentPage + 1)
    end
  end
end
