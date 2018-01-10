defmodule SeatingChartGenerator.CLI do
  def main([academics_file, school_comm_file] = args) do
    # Do stuff
    args
    |> IO.inspect
  end

  def main(_) do
    IO.puts "Need two arguments"
  end
end