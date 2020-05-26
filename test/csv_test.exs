defmodule WingsForLife.CSVTest do
  use ExUnit.Case

  import WingsForLife.CSV

  test "check valid column names" do
    names = "rank,rank-gender,surname,name,bib,nation,category,rank-category,distance"
    assert column_names() == names
  end

  test "check file results.csv exist" do
    filename = "results.csv"
    File.cd!("data")
    assert File.exists?(filename)
  end
end
