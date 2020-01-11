defmodule Exbrainz.Work do
  defstruct id: nil, title: nil, type: nil, relations: []
  use ExConstructor
  alias Exbrainz.{Work, Relations}

  def get_lyricist(%Work{relations: relations}) do
    Relations.get_by_type(relations, "lyricist")
  end

  def get_composer(%Work{relations: relations}) do
    Relations.get_by_type(relations, "composer")
  end
end
