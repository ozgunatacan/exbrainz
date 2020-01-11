defmodule Exbrainz.Work do
  defstruct id: nil, title: nil, type: nil, relations: []
  use ExConstructor
  alias Exbrainz.Work

  def get_lyricist(%Work{relations: relations}) do
    relations
    |> Enum.filter(&(&1["type"] == "lyricist"))
    |> Enum.map(& &1["artist"]["name"])
  end

  def get_composer(%Work{relations: relations}) do
    relations
    |> Enum.filter(&(&1["type"] == "composer"))
    |> Enum.map(& &1["artist"]["name"])
  end
end
