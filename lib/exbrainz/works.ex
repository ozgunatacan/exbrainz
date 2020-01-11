defmodule Exbrainz.Works do
  defstruct "work-count": 0, "work-offset": 0, works: []
  use ExConstructor

  alias Exbrainz.Works

  def get_work_by_title(%Works{works: works}, title) do
    Enum.find(works, &(&1.title == title))
  end
end

defimpl Poison.Decoder, for: Exbrainz.Works do
  import ExConstructor
  alias Exbrainz.{Works, Work}

  def decode(payload, _options) do
    %Works{payload | works: decode_works(payload)}
  end

  defp decode_works(%Works{works: works}) do
    Enum.map(works, &populate_struct(%Work{}, &1))
  end
end
