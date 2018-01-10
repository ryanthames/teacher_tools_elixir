defmodule SeatingChartGeneratorTest do
  use ExUnit.Case
  import SeatingChartGenerator.Factory
  alias SeatingChartGenerator.Award

  test "play with stuff" do
    File.stream!("test/academic_awards.csv") |> CSV.decode! |> Enum.each(&IO.inspect/1)
    File.stream!("test/school_community_awards.csv") |> CSV.decode! |> Enum.each(&IO.inspect/1)
    IO.inspect build_list(5, :award, %{award_name: "Test Award"})
    assert true
  end

  describe "given some awards" do
    # setup [:generate_input, :generate_output]
    test "generate seating chart by order" do
      # SeatingChartGenerator.generate_chart(:order, academic_awards, school_comm_awards)
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
end
