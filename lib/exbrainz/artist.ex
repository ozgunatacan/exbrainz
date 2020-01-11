defmodule Exbrainz.Artist do
  defstruct id: nil, name: nil, aliases: []
  use ExConstructor
end

defimpl Poison.Decoder, for: Exbrainz.Artist do
  import ExConstructor
  alias Exbrainz.{Artist, Alias}

  def decode(payload, _options) do
    %{Artist.new(payload) | aliases: decode_alias(payload)}
  end

  defp decode_alias(%Artist{aliases: aliases}) do
    Enum.map(aliases, &populate_struct(%Alias{}, &1))
  end
end
