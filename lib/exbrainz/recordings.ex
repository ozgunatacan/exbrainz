defmodule Exbrainz.Recordings do
  defstruct "recording-count": 0, "recording-offset": 0, recordings: []
  use ExConstructor

  alias Exbrainz.Recordings

  def get_recording_by_title(%Recordings{recordings: recordings}, title) do
    Enum.find(recordings, &(&1.title == title))
  end
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
