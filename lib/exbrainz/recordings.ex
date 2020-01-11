defmodule Exbrainz.Recordings do
  defstruct "recording-count": 0, "recording-offset": 0, recordings: []
  use ExConstructor
end

defimpl Poison.Decoder, for: Exbrainz.Recordings do
  import ExConstructor
  alias Exbrainz.{Recordings, Recording}

  def decode(payload, _options) do
    %Recordings{payload | recordings: decode_recordings(payload)}
  end

  defp decode_recordings(%Recordings{recordings: recordings}) do
    Enum.map(recordings, &populate_struct(%Recording{}, &1))
  end
end
