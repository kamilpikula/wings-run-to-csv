defmodule WingsForLife.Fetch do

  @url "https://www.wingsforlifeworldrun.com/api/v1/results/2020/?page=1"

  def fetch do
    %{body: body} = HTTPoison.get!(@url)
  #  %{meta: meta} = Poison.decode!(body, keys: :atoms)
  end
end
