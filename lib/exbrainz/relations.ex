defmodule Exbrainz.Relations do
  def get_by_type(relations, type) when is_list(relations) do
    relations
    |> Enum.filter(&(&1["type"] == type))
    |> Enum.map(& &1["artist"]["name"])
  end
end
