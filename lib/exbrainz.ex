defmodule Exbrainz do
  alias Exbrainz.{Artist, Recordings, Works}

  def get_artist!(mbid) do
    path = "/artist/#{mbid}?inc=aliases&fmt=json"
    handle_req(path, %Artist{})
  end

  def get_recordings!(mbid, limit \\ 25) do
    path = "/recording?artist=#{mbid}&fmt=json&limit=#{limit}&inc=artist-rels"
    handle_req(path, %Recordings{})
  end

  def get_works!(mbid, limit \\ 25) do
    path = "/work?artist=#{mbid}&fmt=json&limit=#{limit}&inc=artist-rels"
    handle_req(path, %Works{})
  end

  defp handle_req(path, struct) do
    path
    |> get!
    |> Poison.decode!(as: struct)
  end

  defp get!(path) do
    headers = ["User-Agent": user_agent()]
    response = HTTPoison.get!(base_url() <> path, headers)
    response.body
  end

  defp base_url, do: Application.fetch_env!(:exbrainz, :musicbrainz_base_url)
  defp user_agent, do: Application.fetch_env!(:exbrainz, :user_agent)
end
