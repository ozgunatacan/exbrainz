# Exbrainz

[![Actions Status](https://github.com/ozgunatacan/exbrainz/workflows/Build/badge.svg)](https://github.com/ozgunatacan/exbrainz/actions)

[![Coverage Status](https://coveralls.io/repos/github/ozgunatacan/exbrainz/badge.svg?branch=master)](https://coveralls.io/github/ozgunatacan/exbrainz?branch=master)


An Elixir Client library for [MusicBrainz web service.](https://musicbrainz.org/doc/Development/JSON_Web_Service)

To understand MusicBrainz terminology better read [here.](https://musicbrainz.org/doc/Terminology)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exbrainz` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exbrainz, "~> 0.1.0"}
  ]
end
```

## Config

MusicBrainz needs User-Agent header for [rate-limiting.](https://musicbrainz.org/doc/XML_Web_Service/Rate_Limiting)

```elixir

config :exbrainz,
  musicbrainz_base_url: "https://musicbrainz.org/ws/2",
  user_agent: "Xbrainz/0.1.0 ( https://github.com/ozgunatacan/exbrainz )"

```
## Usage

```elixir
micheal_jackson = "f27ec8db-af05-4f36-916e-3d57f91ecf5e"

artist = Exbrainz.get_artist!(micheal_jackson)
artits.aliases

Exbrainz.get_recordings!(micheal_jackson, 1)

works  = Exbrainz.get_works!(micheal_jackson, 1)

work = Works.get_work_by_title(works, "Billy Jean")

Work.get_composer(work) 
Work.get_lyricist(work) 
 
```
