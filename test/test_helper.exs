ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FenixApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FenixApi.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(FenixApi.Repo, :manual)

