defmodule Exbrainz.Recording do
  defstruct id: nil, title: nil, length: 0, relations: []
  use ExConstructor
  alias Exbrainz.Recording

  def get_vocals(%Recording{relations: relations}) do
    relations
    |> Enum.filter(&(&1["type"] == "vocal"))
    |> Enum.map(& &1["artist"]["name"])
  end
end
