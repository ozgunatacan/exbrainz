defmodule MockServer do
  use Plug.Router
  import Plug.Conn

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  get "/artist/:id" do
    mbid = "e77a055f-bb96-4317-bfd0-45ec69c9e852"
    conn = fetch_query_params(conn)

    with ^mbid <- conn.path_params["id"],
         %{"fmt" => "json", "inc" => "aliases"} <- conn.query_params do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Responses.artist())
    else
      _ ->
        send_resp(conn, 404, "not found")
    end
  end

  get "/recording" do
    mbid = "e77a055f-bb96-4317-bfd0-45ec69c9e852"
    conn = fetch_query_params(conn)

    with %{"artist" => ^mbid, "inc" => "artist-rels", "fmt" => "json", "limit" => "10"} <-
           conn.query_params do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Responses.recordings())
    else
      _ ->
        send_resp(conn, 404, "not found")
    end
  end

  get "/work" do
    mbid = "e77a055f-bb96-4317-bfd0-45ec69c9e852"
    conn = fetch_query_params(conn)

    with %{"artist" => ^mbid, "inc" => "artist-rels", "fmt" => "json", "limit" => "2"} <-
           conn.query_params do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Responses.works())
    else
      _ ->
        send_resp(conn, 404, "not found")
    end
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
