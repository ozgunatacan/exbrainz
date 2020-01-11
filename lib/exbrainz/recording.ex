defmodule Exbrainz.Recording do
  defstruct id: nil, title: nil, length: 0, relations: []
  use ExConstructor
  alias Exbrainz.{Recording, Relations}

  def get_vocals(%Recording{relations: relations}) do
    Relations.get_by_type(relations, "vocal")
  end
end
