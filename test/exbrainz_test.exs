defmodule ExbrainzTest do
  use ExUnit.Case

  test "get artist with musicbrainz id" do
    mbid = "e77a055f-bb96-4317-bfd0-45ec69c9e852"
    artist = Exbrainz.get_artist!(mbid)

    assert artist.id == mbid
    assert artist.name == "Alfredo De Angelis"
    [first | _rest] = artist.aliases
    assert first == %Exbrainz.Alias{name: "Alfredo D'angelis"}
  end
end
