defmodule Exbrainz do
  alias Exbrainz.{Artist, Recordings}

  def get_artist!(mbid) do
    path = "/artist/#{mbid}?inc=aliases&fmt=json"
    response = get!(path)
    Poison.decode!(response.body, as: %Artist{})
  end

  def get_recordings!(mbid, limit \\ 25) do
    path = "/recording?artist=#{mbid}&fmt=json&limit=#{limit}&inc=artist-rels"
    response = get!(path)
    Poison.decode!(response.body, as: %Recordings{})
  end

  defp get!(path) do
    headers = ["User-Agent": user_agent()]
    HTTPoison.get!(base_url() <> path, headers)
  end

  defp base_url, do: Application.fetch_env!(:exbrainz, :musicbrainz_base_url)
  defp user_agent, do: Application.fetch_env!(:exbrainz, :user_agent)
end
