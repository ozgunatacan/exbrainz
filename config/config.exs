import Config

version = Application.spec(:exbrainz, :vsn) |> to_string()

config :exbrainz,
  musicbrainz_base_url: "https://musicbrainz.org/ws/2",
  user_agent: "Xbrainz/0.1.0 ( https://github.com/ozgunatacan/exbrainz )"

import_config "#{Mix.env()}.exs"
