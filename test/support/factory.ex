defmodule Luta.Factory do
  use ExMachina.Ecto, repo: Luta.Repo

  use Luta.ArenaFactory
end
