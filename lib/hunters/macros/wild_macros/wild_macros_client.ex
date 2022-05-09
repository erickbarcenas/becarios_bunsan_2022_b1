defmodule WildMacros.Client do
  @moduledoc false
  require WildMacros
  import WildMacros
  import Kernel, except: [..: 2, --: 2]

  :foo..:bar
  :ying..:yang

  def subs(s1, s2), do: s1 -- s2
end
