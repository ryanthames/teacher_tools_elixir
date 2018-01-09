defmodule SeatingChartGeneratorTest do
  use ExUnit.Case
  doctest SeatingChartGenerator

  test "generate seating chart by order" do
    SeatingChartGenerator.generate_chart(:order, "academic_awards.csv", "school_community_awards.csv")
    assert false
  end

  test "generate seating chart by seat" do
    assert false
  end

  test "generate seating chart alphabetically" do
    assert false
  end

  test "only special services assigned to row A" do
    assert false
  end
end
