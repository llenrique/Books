{:ok, _} = Application.ensure_all_stated(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Books.Repo, :manual)
