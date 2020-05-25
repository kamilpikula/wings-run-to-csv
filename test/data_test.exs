defmodule WingsForLife.DataTest do
  use ExUnit.Case
  doctest WingsForLife

  def runners do
    [
      %{
        category: "M20",
        distance: 100_000,
        fullname: "Example, Example",
        nation: "USA",
        ranks: %{
          global: %{category: 1, gender: 1, rank: 1}
        },
        startnumber: "139630"
      },
      %{
        category: "M30",
        distance: 99_000,
        fullname: "Example, John",
        nation: "CAN",
        ranks: %{
          global: %{category: 1, gender: 2, rank: 2}
        },
        startnumber: "1392100"
      },
    ]
  end

  test "testing read of runners to string" do
    assert WingsForLife.Data.read(runners()) == [
      "1, 1, Example, Example, 139630, USA, M20, 1, 100000",
      "2, 2, Example, John, 1392100, CAN, M30, 1, 99000",
  ]
  end

  test "save strings to csv file in rows" do
    assert WingsForLife.Data.processing(runners()) == [:ok, :ok]
  end

end
