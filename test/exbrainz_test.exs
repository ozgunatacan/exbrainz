defmodule ExbrainzTest do
  use ExUnit.Case

  alias Exbrainz.{Recording, Recordings, Alias}

  @mbid "e77a055f-bb96-4317-bfd0-45ec69c9e852"
  test "get artist with musicbrainz id" do
    artist = Exbrainz.get_artist!(@mbid)

    assert artist.id == @mbid
    assert artist.name == "Alfredo De Angelis"
    [first | _rest] = artist.aliases
    assert first == %Alias{name: "Alfredo D'angelis"}
  end

  test "get recordings of an artist with musicbrainz id" do
    recordings = Exbrainz.get_recordings!(@mbid, 10)
    assert recordings."recording-count" == 701
    assert recordings."recording-offset" == 0
    [first | _rest] = recordings.recordings

    assert first == %Recording{
             id: "0499107d-7a72-41c7-b329-0b68fbd098d8",
             length: 153_186,
             title: "9 de Julio"
           }

    maga = Recordings.get_recording_by_title(recordings, "A Magaldi")

    assert Recording.get_vocals(maga) == ["Carlos Dante", "Julio Martel"]
  end
end
