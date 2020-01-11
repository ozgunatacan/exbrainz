# Exbrainz

[![Actions Status](https://github.com/ozgunatacan/exbrainz/workflows/build/badge.svg)](https://github.com/ozgunatacan/exbrainz/actions)


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

Music brains needs User-Agent header for [rate-limiting.](https://musicbrainz.org/doc/XML_Web_Service/Rate_Limiting)

```elixir

config :exbrainz,
  musicbrainz_base_url: "https://musicbrainz.org/ws/2",
  user_agent: "Xbrainz/0.1.0 ( https://github.com/ozgunatacan/exbrainz )"

```
