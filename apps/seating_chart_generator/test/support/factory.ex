defmodule SeatingChartGenerator.Factory do
  use ExMachina
  alias SeatingChartGenerator.Award

  def award_factory() do
    %Award{
      first_name: Faker.Name.first_name,
      last_name: Faker.Name.last_name,
      category: Faker.Lorem.word,
      award_name: Faker.Lorem.word
    }
  end
end