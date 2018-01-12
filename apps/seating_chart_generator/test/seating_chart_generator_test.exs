defmodule SeatingChartGeneratorTest do
  use ExUnit.Case
  import SeatingChartGenerator.Factory
  alias SeatingChartGenerator.Award

  test "play with stuff" do
    #File.stream!("test/academic_awards.csv") |> CSV.decode! |> Enum.each(&IO.inspect/1)
    #File.stream!("test/school_community_awards.csv") |> CSV.decode! |> Enum.each(&IO.inspect/1)
    #IO.inspect build_list(5, :award, %{award_name: "Test Award"})
    assert true
  end

  # For testing purposes, assuming 5 seats per row (except for Row A)
  describe "given some awards" do
    setup [:generate_input]
    test "multiple awards seated first", %{academic_awards: academic_awards, school_comm_awards: school_comm_awards} do
      order_by_seat = 
        SeatingChartGenerator.generate_chart(:seat, academic_awards, school_comm_awards)
        |> Enum.map(fn {_, a} -> a end)

      assert "Kirk" == Enum.at(order_by_seat, 0)
      assert "Sulu" == Enum.at(order_by_seat, 2)
      assert "Thames" == Enum.at(order_by_seat, 5)
    end

    @tag :pending
    test "only special services assigned to row A", %{academic_awards: academic_awards, school_comm_awards: school_comm_awards} do
      seating_chart = SeatingChartGenerator.generate_chart(:seat, academic_awards, school_comm_awards)

      seating_chart
      |> Stream.filter(fn {_, a} -> a.category == "Special Services" end)
      |> Enum.map(fn {seat, _award} -> assert "Row A" == seat end)
    end

    @tag :pending
    test "nhs officers should be on the stage" do
      assert false
    end
  end

  defp generate_input(_) do
    academic_awards = []
      ++ build_list(5, :award, %{category: "CTE"})
      ++ [%Award{first_name: "Jim", last_name: "Kirk", category: "CTE", award_name: "Retail"}]
      ++ build_list(9, :award, %{category: "Fine Arts"})
      ++ [%Award{first_name: "Jim", last_name: "Kirk", category: "Fine Arts", award_name: "Band"}]
      ++ [%Award{first_name: "Hikaru", last_name: "Sulu", category: "Fine Arts", award_name: "Band"}]
      ++ build_list(8, :award, %{category: "LOTE"})
      ++ [%Award{first_name: "Hikaru", last_name: "Sulu", category: "LOTE", award_name: "German I"}]
      ++ build_list(5, :award, %{category: "Special Services"})

    school_comm_awards = []
      ++ build_list(5, :award, %{category: "Band"})
      ++ [%Award{first_name: "Darcy", last_name: "Thames", category: "Band", award_name: "Trombone"}]
      ++ build_list(9, :award, %{category: "Misc"})
      ++ [%Award{first_name: "Darcy", last_name: "Thames", category: "Misc", award_name: "Trombone"}]
      ++ [%Award{first_name: "Hikaru", last_name: "Sulu", category: "Golf", award_name: "Stuff"}]

    {:ok, academic_awards: academic_awards, school_comm_awards: school_comm_awards}
  end
end
