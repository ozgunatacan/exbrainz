defmodule ExbrainzTest do
  use ExUnit.Case
  doctest Exbrainz

  test "greets the world" do
    assert Exbrainz.hello() == :world
  end
end
