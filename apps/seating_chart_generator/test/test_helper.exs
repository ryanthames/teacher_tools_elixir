ExUnit.configure(exclude: [pending: true])
ExUnit.start()
# Faker.start()
{:ok, _} = Application.ensure_all_started(:ex_machina)