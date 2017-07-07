defmodule Reader.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
      alias Reader.Repo
      import Reader.Router.Helpers
    end
  end

  setup tags do
    {:ok, session} = Wallaby.start_session()
    session |> Wallaby.Browser.resize_window(1600, 1000)
    {:ok, session: session}
  end
end
