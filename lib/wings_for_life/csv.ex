defmodule WingsForLife.CSV do

  @spec column_names() :: binary()
  def column_names() do
    Enum.join(~w(rank rank-gender surname name bib nation
                category rank-category distance), ",")
  end

  @spec save_csv(binary()) :: :ok
  def save_csv(row_of_runners) do
    filename = "data/results.csv"
    unless File.exists?(filename) do
      File.write!(filename, column_names() <>  "\n")
    end
    File.write!(filename, row_of_runners <> "\n", [:append])
  end
end
